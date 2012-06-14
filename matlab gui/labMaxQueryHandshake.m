function res = labMaxQueryHandshake(obj,cmd)
res = query(obj,cmd);
while(obj.bytesAvailable==0)
  drawnow
end
handshake(obj,true);
