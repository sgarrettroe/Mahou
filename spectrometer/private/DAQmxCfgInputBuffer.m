function DAQmxCfgInputBuffer(lib,taskh,numSampsPerChan)
%
%DAQmxCfgInputBuffer
%int32 DAQmxCfgInputBuffer (TaskHandle taskHandle, uInt32 numSampsPerChan);
%
%
[err]=calllib(lib,'DAQmxCfgInputBuffer',taskh,uint32(numSampsPerChan));
DAQmxCheckError(lib,err);
