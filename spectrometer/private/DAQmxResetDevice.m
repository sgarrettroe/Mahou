function DAQmxResetDevice(lib,devName)
% reset a DAQmx device
[err]=calllib(lib,'DAQmxResetDevice',devName);
DAQmxCheckError(lib,err);
