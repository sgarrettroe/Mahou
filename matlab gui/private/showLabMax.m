function [data,avg_data] = showLabMax(labMax,handles,params,data,avg_data,i_scan)

%if first scan set up the powermeter acquisition and initialize variables
if i_scan == 1
  %initialize code goes here
  labMaxCommandHandshake(labMax, 'CONF:DISP:PRI');
  labMaxCommandHandshake(labMax, 'CONF:RANG:AUTO ON');
  labMaxCommandHandshake(labMax,'CONF:READ:CONT LAST');
end

%acquire current data point from meter
labMaxCommandHandshake(labMax, 'INIT');
drawnow;
pause(.1);
labMaxCommandHandshake(labMax, 'ABOR');

data7 = labMaxQueryHandshake(labMax, 'FETC:NREC?');
nrecs = [];
while isempty(nrecs)
  nrecs = sscanf(data7,'%i');
  data7 = data7(2:end); %if reading didn't work throw away leading char and try again???
end

data8 = cell(1,nrecs);
val = zeros(1,nrecs);
for i = 1:nrecs
  data8{i} = labMaxQueryHandshake(labMax, 'FETC:NEXT?');
  val(i) = sscanf(data8{i},'%E',1);
end

%package output
%x data doesn't change in this style
data.y = val(1); %update y data

%accumulate the average
avg_data.y = (avg_data.y.*(i_scan-1) + data.y)./i_scan;