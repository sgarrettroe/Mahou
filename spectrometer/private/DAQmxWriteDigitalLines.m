function sampsPerChanWritten = DAQmxWriteDigitalLines(lib,taskh,numSampsPerChan,timeout,dataLayout,DOvalue)
% function sampsPerChanWritten = DAQmxWriteDigitalLines(lib,taskh,numSampsPerChan,timeout,dataLayout,DOvalue)
% 
% this function writes digital outputs from previously setup task
% 
% inputs:
%	lib - .dll or alias (ex. 'myni')
%	taskh - taskhandle of analog inputs
%	numSampsPerChan = ?
%	timeout - in seconds
%	dataLayout - DAQmx_Val_GroupByChannel or DAQmx_Val_GroupByScanNumber
%	DOvalue - value to write (0 or 1)
%		1 channel example: 0
%		2 channel example: [0,0]
% 
% C functions:
% int32 DAQmxReadDigitalLines (
%		TaskHandle taskHandle,int32 numSampsPerChan,float64 timeout,bool32 fillMode,
%		uInt8 readArray[],uInt32 arraySizeInBytes,int32 *sampsPerChanRead,int32 *numBytesPerSamp,bool32 *reserved);
% int32 DAQmxStopTask (TaskHandle taskHandle);
% int32 DAQmxWriteDigitalLines (
%		TaskHandle taskHandle,int32 numSampsPerChan,bool32 autoStart,float64 timeout,bool32 dataLayout,
%		uInt8 writeArray[],int32 *sampsPerChanWritten,bool32 *reserved);
% int32 DAQmxStopTask (TaskHandle taskHandle);
% 
% 
% written by Nathan Tomlin (nathan.a.tomlin@gmail.com)
% v0 - 1004

autoStart = 1;


[err,sampsperchanwritten,empty] = calllib(lib,'DAQmxWriteDigitalLines',...
	taskh,numSampsPerChan,autoStart,timeout,dataLayout,...
	DOvalue,0,[]);
DAQmxCheckError(lib,err);


% err = calllib(lib,'DAQmxStopTask',taskh);
% DAQmxCheckError(lib,err);
