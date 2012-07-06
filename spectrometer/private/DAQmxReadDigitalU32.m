function [data,nData] = DAQmxReadDigitalU32(lib,taskh,...
    numchan,numSampsPerChan,timeout,fillMode,arraySizeInSamps)
% read digital port and return unsigned 32 bit integers in an array
%
% C function DAQmxReadDigitalU32 int32 DAQmxReadDigitalU32 (TaskHandle
%     taskHandle, int32 numSampsPerChan, float64 timeout, bool32 fillMode,
%     uInt32 readArray[], uInt32 arraySizeInSamps, int32 *sampsPerChanRead,
%     bool32 *reserved);

% make some pointers
readArray = ones(numchan,arraySizeInSamps); 
readArray_ptr = libpointer('uint32Ptr',readArray);

sampsPerChanRead = -1; %default so we can check that it changed 
sampsPerChanRead_ptr = libpointer('int32Ptr',sampsPerChanRead);

empty = []; 
empty_ptr = libpointer('uint32Ptr',empty);


[err,readArray,sampsPerChanRead,empty] = calllib(lib,'DAQmxReadDigitalU32',...
		taskh,int32(numSampsPerChan),double(timeout),fillMode,...
		readArray_ptr,uint32(arraySizeInSamps),sampsPerChanRead_ptr,empty_ptr);
DAQmxCheckError(lib,err);
nData = get(sampsPerChanRead_ptr,'Val');
data = get(readArray_ptr,'Value');
