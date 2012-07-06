function DAQmxTaskControl(lib,th,val)
%only tested for val = DAQmx_Val_Task_Commit
[err] = calllib(lib,'DAQmxTaskControl',th,val);
DAQmxCheckError(lib,err);
