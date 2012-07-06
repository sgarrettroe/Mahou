function DAQmxStopTask(lib,taskh)
% start NI task 
%
[err]=calllib(lib,'DAQmxStopTask',taskh);
DAQmxCheckError(lib,err);
