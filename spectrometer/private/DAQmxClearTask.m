function DAQmxClearTask(lib,hTask)
% clear DAQmx task
[err]=calllib(lib,'DAQmxClearTask',hTask);
DAQmxCheckError(lib,err);
