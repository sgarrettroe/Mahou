%load library
lib = 'myni';	% library alias
if ~libisloaded(lib)
    disp('Matlab: Load nicaiu.dll')
    funclist = loadlibrary('nicaiu.dll','C:\Program Files (x86)\National Instruments\NI-DAQ\DAQmx ANSI C Dev\include\nidaqmx.h','alias',lib);
    %if you do NOT have nicaiu.dll and nidaqmx.h
    %in your Matlab path,add full pathnames or copy the files.
    %libfunctions(lib,'-full') % use this to show the... 
    %libfunctionsview(lib)     % included function
end
disp('Matlab: dll loaded')

% %% load all DAQmx constants
if ~exist('flag_NIconstants_defined','var') || ~flag_NIconstants_defined
    NIconstants;    
end
disp('done')

%% reset device
devName = 'Dev1'; %as defined in NI MAX program
DAQmxResetDevice(lib,'Dev1');

%% create task
%propteries of the array detector
nPixels = 64;
nExtInputs = 16;
nShots = 5; %number of laser shots to acquire
maxChan = 256; %the number of channels written to the FIFO buffer in the FPAS

% for later use the total number of channels from the electronics (not the
% same as the number of digital input/output channels, which is just 1)
nChan = nPixels + nExtInputs;

lines = {'Dev1/line0:31'};
taskName = '';	% ?
chanName = {''};	% recommended to avoid problems
lineGrouping = DAQmx_Val_ChanForAllLines; % One Channel For All Lines

[hTask,numchan] = DAQmxCreateDIChan(lib,lines,lineGrouping,taskName,chanName);
%here numchan is the number of digital input channels, i.e. just 1

%% configure timing

sampleMode = DAQmx_Val_FiniteSamps;
sampsPerChan = maxChan/2*nShots+1; %nChan/2+1; %total number of points to acquire #Ch*#scans (where scans is NI language for shots)
sampleClkRate = 10e6;%10 MHz
sampleClkOutputTerm = '/Dev1/PFI4'; %note leading front slash. Why needed here???
sampleClkPulsePolarity = DAQmx_Val_ActiveHigh;
pauseWhen = DAQmx_Val_High;
readyEventActiveLevel = DAQmx_Val_ActiveHigh;

DAQmxCfgBurstHandshakingTimingExportClock(lib,hTask,...
    sampleMode,sampsPerChan,sampleClkRate,sampleClkOutputTerm,...
    sampleClkPulsePolarity,pauseWhen,readyEventActiveLevel);


%% set input buffer size
bufSizeInSamps = sampsPerChan*numchan;
DAQmxCfgInputBuffer(lib,hTask,bufSizeInSamps);

%% set DMA transfer
DAQmxSetDIDataXferMech(lib,hTask,chanName,DAQmx_Val_DMA);


%% commit (make everything as ready to go as it can be)
DAQmxTaskControl(lib,hTask,DAQmx_Val_Task_Commit);

%% start the task
DAQmxStartTask(lib,hTask);

%% read 
timeout = 1;
fillMode = DAQmx_Val_GroupByChannel; % Group by Channel
%fillMode = DAQmx_Val_GroupByScanNumber; % I think this doesn't matter when only 1 channel

[portdata,sampsPerChanRead] = DAQmxReadDigitalU32(lib,hTask,numchan,sampsPerChan,timeout,fillMode,bufSizeInSamps);

%portdata

%% stop
DAQmxStopTask(lib,hTask);

%% clear
DAQmxClearTask(lib,hTask);

%% swizzle data (could be optimized for memory and speed)
nPerBoard = 32; %has to do with the number of channels on the boards going to the FIFO
 
ind = [];
for ii = 1:ceil(nChan/nPerBoard)
  ind = [ind,[1:2:15 2:2:16; 17:2:31 18:2:32]+(ii-1)*32];
end
ind = ind(:);

%how many channels do you need to keep to unravel all the data correctly
maxInd = ceil(nChan/nPerBoard)*nPerBoard; 

%throw away first point because it is empty
hm = portdata(2:end);

%throw away as many points as we can without losing information
hm = reshape(hm,maxChan/2,nShots);
hm = hm(1:maxInd/2,:);

%flatten again
hm = hm(:); 

%convert each 32bit number to two 16bit numbers
hmm = typecast(hm,'uint16');
hmm = reshape(hmm,maxInd,nShots);

%use ind to sort the data
IND = repmat(ind,1,nShots); %this only needs to happen once per scan
data = zeros(size(IND)); %initialize size of array (once per scan)
%data = hmm(IND);
data = hmm(ind,1:nShots);

% extract array part and ext channels part
array = double(data(1:nPixels,:)); %the first 64 rows
ext = double(data((nPixels+1):(nPixels+nExtInputs),:))./13107; %the last 16 rows divided by some magic number I don't understand to make volts?
