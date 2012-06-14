function [data,avg_data] = scanLabMax(labMax,handles,params,data,avg_data,i_scan,hPlots)

%if first scan set up the powermeter acquisition and initialize variables
if i_scan == 1
  %initialize code goes here
  labMaxCommandHandshake(labMax, 'CONF:DISP:PRI');
  labMaxCommandHandshake(labMax, 'CONF:RANG:AUTO ON');
  labMaxCommandHandshake(labMax, 'CONF:READ:CONT STRE');
end

%set scan index to 1 if we are in an infinite loop (this i_scan is only in
%scope inside this function)
if params.scan_max == -1, i_scan = 1;end
for i_step = 1:length(data(1).x)
  
  %move to the desired position
  moveMotorFs(handles,1,data(i_scan).x(i_step));
  
  %acquire the current data point from meter
  labMaxCommandHandshake(labMax, 'INIT');
  flag_done = false;
  while ~flag_done
    data7 = labMaxQueryHandshake(labMax, 'FETC:NREC?');
    nrecs = [];
    while isempty(nrecs)
      nrecs = sscanf(data7,'%i');
      data7 = data7(2:end); %if reading didn't work throw away leading char and try again???
    end
    
    if nrecs >= params.shots, flag_done = true;end
  end
  labMaxCommandHandshake(labMax, 'ABOR');
  
  %read the data from the meter (the slow step)
  data8 = cell(1,nrecs);
  fprintf(labMax,'FETC:ALL?')
  for i = 1:nrecs
    data8{i} = fscanf(labMax, '%s');
  end
  handshake(labMax,true);
  
  %convert the strings to numeric
  val = zeros(1,params.shots);
  for i = 1:params.shots
    val(i) = sscanf(data8{i},'%E',1);
  end
  
  data(i_scan).y(i_step) = mean(val);
  
  %dummy code
  refreshdata(hPlots,'caller');
  drawnow;
end


%package output
%x data doesn't change in this style


%accumulate the average
if i_scan == 1
    avg_data.y = data(1).y;
else
  avg_data.y = (avg_data.y.*(i_scan-1) + data(i_scan).y)./i_scan;
end

