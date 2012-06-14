function new_position = (handles,motor_index,desired_position)
% put the code to move motors here. The desired position and new position
% are in units of fs. The command should return a number indicating where
% it got to, which could be different from the command (due to hitting a
% limit switch, etc)

%dummy code
pause(0.1);

new_position = desired_position;

%update the gui
h = eval(sprintf('handles.edtMotor%i',1));
set(h,'String',num2str(new_position));
