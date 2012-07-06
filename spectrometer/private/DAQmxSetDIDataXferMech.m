function DAQmxSetDIDataXferMech(lib,task,name_lines,val)
% set the data transfer mechanism. DAQmx_Val_DMA is the only thing tested
numChan = numel(name_lines);
for m = 1:numChan
    [err,b,c] = calllib(lib,'DAQmxSetDIDataXferMech',task,name_lines{m},val);
    DAQmxCheckError(lib,err);
end
