function DAQmxStartTask(lib,taskh)
% start NI task 
%
[err]=calllib(lib,'DAQmxStartTask',taskh);
DAQmxCheckError(lib,err);
