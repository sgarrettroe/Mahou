% Find a serial port object.
PI_PORT = 'COM4';
obj2 = instrfind('Type', 'serial', 'Port', PI_PORT, 'Tag', '');

% Create the serial port object if it does not exist
% otherwise use the object that was found.
if isempty(obj2)
    obj2 = serial(PI_PORT);
else
    fclose(obj2);
    obj2 = obj2(1)
end

% Connect to instrument object, obj1.
fopen(obj2);

% Configure instrument object, obj1.
set(obj2, 'BaudRate', 38400);
set(obj2, 'Terminator', {'LF','LF'});

%%
fprintf(obj2,'*IDN?');
fscanf(obj2,'%s')

%% reference move to negative limit
fprintf(obj2,'RON 1 1');
fprintf(obj2,'FNL');

%% move to an absolute position
fprintf(obj2,'MOV 1 1.93')

%% read position
query(obj2,'POS?')

%% reset motor
fprintf(obj2,'RON 1 0'); %turns referencing off (this is quick and dirty reset)
fprintf(obj2,'POS 1 0')

%% clean up
fclose(obj2)
delete(obj2)
clear obj2
