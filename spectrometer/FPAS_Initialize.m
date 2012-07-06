function FPAS_Initialize
global FPAS PARAMS NICONST;

%% Initialilze constants and variables.

LoadNIConstants;

%propteries of the array detector
FPAS.nPixels = 64;
FPAS.nExtInputs = 16;
FPAS.nMaxChan = 256; %the number of channels written to the FIFO buffer in the FPAS
FPAS.nSampsPerChan = FPAS.nMaxChan/2*PARAMS.nShots+1; %nChan/2+1; %total number of points to acquire #Ch*#scans (where scans is NI language for shots)

%% load library
FPAS.lib = 'myni';	% library alias
if ~libisloaded(FPAS.lib)
    disp('Matlab: Load nicaiu.dll')
    funclist = loadlibrary('nicaiu.dll','C:\Program Files (x86)\National Instruments\NI-DAQ\DAQmx ANSI C Dev\include\nidaqmx.h','alias',FPAS.lib);
    %if you do NOT have nicaiu.dll and nidaqmx.h
    %in your Matlab path,add full pathnames or copy the files.
    %libfunctions(FPAS.lib,'-full') % use this to show the... 
    %libfunctionsview(FPAS.lib)     % included function
end
disp('Matlab: dll loaded')

% %% load all DAQmx constants
% if ~exist('flag_NIconstants_defined','var') || ~flag_NIconstants_defined
%     NIconstants;    
% end
disp('done')

%% reset device
devName = 'Dev1'; %as defined in NI MAX program
DAQmxResetDevice(FPAS.lib,'Dev1');

%% create task

% for later use the total number of channels from the electronics (not the
% same as the number of digital input/output channels, which is just 1)
%nChan = FPAS.nPixels + FPAS.nExtInputs;

lines = {'Dev1/line0:31'};
taskName = '';	% ?
chanName = {''};	% recommended to avoid problems
lineGrouping = NICONST.DAQmx_Val_ChanForAllLines; % One Channel For All Lines

% [FPAS.hTask,FPAS.nChan] = DAQmxCreateDIChan(FPAS.lib,lines,lineGrouping,taskName,chanName);
% %here numchan is the number of digital input channels, i.e. just 1
% 
% %% configure timing
% 
% sampleMode = DAQmx_Val_FiniteSamps;
% sampleClkRate = 10e6;%10 MHz
% sampleClkOutputTerm = '/Dev1/PFI4'; %note leading front slash. Why needed here???
% sampleClkPulsePolarity = DAQmx_Val_ActiveHigh;
% pauseWhen = DAQmx_Val_High;
% readyEventActiveLevel = DAQmx_Val_ActiveHigh;
% 
% DAQmxCfgBurstHandshakingTimingExportClock(FPAS.lib,FPAS.hTask,...
%     sampleMode,FPAS.nSampsPerChan,sampleClkRate,sampleClkOutputTerm,...
%     sampleClkPulsePolarity,pauseWhen,readyEventActiveLevel);

