function labMaxCommandHandshake(obj,cmd)
fprintf(obj,cmd);
read_flag = false;
while(obj.bytesAvailable==0)
  drawnow
end
handshake(obj,true);
