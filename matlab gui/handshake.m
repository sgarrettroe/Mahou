function handshake(obj,handshake_flag)
%HANDSHAKE.M talks to the LabMax powermeter. handhsake reads available data until
%there is no more. If a command was successful, handshake(obj) is silent
%(or OK). If ther eis an error it reports the error code (usu ER100 for
%unknown command), and if there is no info it says EMPTY which is
%ambiguous; could be good or bad.
%
% to be more robust this should have some automatic way to check if data is
% coming. Sometimes it comes too fast and the handshake give a timeout
% error?

if ~handshake_flag
  %if handshaking is disabled return right away
  return
end

res = {''};
count = 0;
while obj.bytesAvailable > 0
  count=count+1;
  res{count} = fscanf(obj,'%s');
end
switch res{1}
  case ''
    disp('handshake EMPTY');
  case {'OK',[char(5) 'OK']}
    %disp('handshake OK');
  otherwise
    warning('SGRLAB:hardwareCommError',...
      sprintf('Handshake with serial port failed with code %s\n',res{:}));
end
%have to keep polling to make sure queue is empty