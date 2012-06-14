%play with LabMax
% Find a serial port object.
obj1 = instrfind('Type', 'serial', 'Port', 'COM1', 'Tag', '');

% Create the serial port object if it does not exist
% otherwise use the object that was found.
if isempty(obj1)
    obj1 = serial('COM1');
else
    fclose(obj1);
    obj1 = obj1(1)
end

% Connect to instrument object, obj1.
fopen(obj1);

% Configure instrument object, obj1.
set(obj1, 'BaudRate', 19200);
set(obj1, 'Terminator', {'CR/LF','CR/LF'});
handshake_flag = true;
fprintf(obj1,'SYST:COMM:HAND OFF');
if strcmpi(query('SYST:COMM:HAND?'),'OFF')
  handshake_flag = false;
else
  handshake_flag = true;
  handshake(obj1);
end

% Communicating with instrument object, obj1.
data1 = query(obj1, '*IDN?');
handshake(obj1,handshake_flag);

%% check status should return something like 00000884
fprintf(obj1, 'SYST:REM');
handshake(obj1,handshake_flag);

data2 = query(obj1, 'SYST:STAT?')
handshake(obj1,handshake_flag);

%% try to read a single value
fprintf(obj1, 'CONF:DISP:PRI');
handshake(obj1,handshake_flag);
fprintf(obj1, 'CONF:RANG:AUTO ON');
handshake(obj1,handshake_flag);

fprintf(obj1,'CONF:READ:CONT LAST');
handshake(obj1,handshake_flag);

fprintf(obj1, 'INIT');
handshake(obj1,handshake_flag);
pause(1);
fprintf(obj1, 'ABOR');
handshake(obj1,handshake_flag);

%%
data7 = query(obj1, 'FETC:NREC?')
handshake(obj1,handshake_flag);
nrecs = [];
while isempty(nrecs)
  nrecs = sscanf(data7,'%i')
  data7 = data7(2:end);
end

data8 = cell(1,nrecs);
val = zeros(1,nrecs);
for i = 1:nrecs
  data8{i} = query(obj1, 'FETC:NEXT?');
  handshake(obj1,handshake_flag);
  val(i) = sscanf(data8{i},'%E',1);
end
val


%%

fprintf(obj1, 'CONF:DISP:TREN');


% Disconnect from instrument object, obj1.
fclose(obj1);


%%
obj1.BytesAvailableFcnMode = 'terminator';
obj1.BytesAvailableFcn = @instrcallback;

%% start again CONNECT


% Find a serial port object.
obj1 = instrfind('Type', 'serial', 'Port', 'COM1', 'Tag', '');

% Create the serial port object if it does not exist
% otherwise use the object that was found.
if isempty(obj1)
    obj1 = serial('COM1');
else
    fclose(obj1);
    obj1 = obj1(1)
end

% Connect to instrument object, obj1.
fopen(obj1);

% Configure instrument object, obj1.
set(obj1, 'BaudRate', 115200);
set(obj1, 'Terminator', {'CR/LF','CR/LF'});
labMaxCommandHandshake(obj1, 'SYST:COMM:HAND ON');
labMaxCommandHandshake(obj1, 'SYST:COMM:SER:SERV OFF');
labMaxCommandHandshake(obj1, 'SYST:REM');
 
%% single point
labMaxCommandHandshake(obj1, 'CONF:DISP:PRI');
labMaxCommandHandshake(obj1, 'CONF:RANG:AUTO ON');
labMaxCommandHandshake(obj1,'CONF:READ:CONT LAST');
labMaxCommandHandshake(obj1, 'INIT');

pause(.1);
labMaxCommandHandshake(obj1, 'ABOR');

data7 = labMaxQueryHandshake(obj1, 'FETC:NREC?');
nrecs = [];
while isempty(nrecs)
  nrecs = sscanf(data7,'%i');
  data7 = data7(2:end); %if reading didn't work throw away leading char and try again???
end

data8 = cell(1,nrecs);
val = zeros(1,nrecs);
for i = 1:nrecs
  data8{i} = query(obj1, 'FETC:NEXT?');
  handshake(obj1,handshake_flag);
  val(i) = sscanf(data8{i},'%E',1);
end
val

%% multipoint
labMaxCommandHandshake(obj1, 'CONF:DISP:PRI');
labMaxCommandHandshake(obj1, 'CONF:RANG:AUTO ON');
labMaxCommandHandshake(obj1,'CONF:READ:CONT STRE');
shots = 500;

  %acquire the current data point from meter
  labMaxCommandHandshake(obj1, 'INIT');
  flag_done = false;
  while ~flag_done
    data7 = labMaxQueryHandshake(obj1, 'FETC:NREC?');
    nrecs = [];
    while isempty(nrecs)
      nrecs = sscanf(data7,'%i');
      data7 = data7(2:end); %if reading didn't work throw away leading char and try again???
    end
    
    if nrecs >= shots, flag_done = true;end
  end
  labMaxCommandHandshake(obj1, 'ABOR');

  data8 = cell(1,shots);
  val = zeros(1,shots);
  for i = 1:shots
    data8{i} = labMaxQueryHandshake(obj1, 'FETC:NEXT?');
    val(i) = sscanf(data8{i},'%E',1);
  end
  
  %% multipoint ALL
labMaxCommandHandshake(obj1, 'CONF:DISP:PRI');
labMaxCommandHandshake(obj1, 'CONF:RANG:AUTO ON');
labMaxCommandHandshake(obj1,'CONF:READ:CONT STRE');
shots = 500;

  %acquire the current data point from meter
  labMaxCommandHandshake(obj1, 'INIT');
  flag_done = false;
  while ~flag_done
    data7 = labMaxQueryHandshake(obj1, 'FETC:NREC?');
    nrecs = [];
    while isempty(nrecs)
      nrecs = sscanf(data7,'%i');
      data7 = data7(2:end); %if reading didn't work throw away leading char and try again???
    end
    
    if nrecs >= shots, flag_done = true;end
  end
  labMaxCommandHandshake(obj1, 'ABOR');
  
  %% the fetch is the slow part
  tic
  data8 = cell(1,nrecs);
  val = zeros(1,shots);
  fprintf(obj1,'FETC:ALL?')
  for i = 1:nrecs
    data8{i} = fscanf(obj1, '%s');
  end
  toc
  tic
  for i = 1:shots
    val(i) = sscanf(data8{i},'%E',1);
  end
  toc
  val = val(1:shots);
  
  %% try higher baud rate
  labMaxCommandHandshake(obj1,'SYST:COMM:SER:BAUD 115200');
  set(obj1,'Baud',115200);
  