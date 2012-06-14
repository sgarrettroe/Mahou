% Find a serial port object.
PI_PORT = 'COM4';
obj2 = instrfind('Type', 'serial', 'Port', PI_PORT, 'Tag', '');

% Create the serial port object if it does not exist
% otherwise use the object that was found.
if isempty(obj2)
    obj2 = serial('PI_PORT');
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

%% reference move
fprintf(obj2,'FNL');

%%