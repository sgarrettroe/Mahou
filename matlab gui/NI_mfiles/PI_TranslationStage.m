classdef PI_TranslationStage < handle

    properties;
        center;
        scale;
        minimum;
        maximum;
        comPort;
        terminator;
        type;
        baud;
        object;
        gui_object;
        ID;
    end
        
    methods
        
        function obj = PI_TranslationStage(port, gui_object_name)
            obj.center = 0;
            obj.scale = 0.00015;
            obj.comPort = port;
            obj.terminator = {'LF','LF'};
            obj.type = 'serial';
            obj.gui_object = gui_object_name;

            obj.object = instrfind('Type', obj.type, 'Port', obj.comPort, 'Tag', '');

            % Create the serial port object if it does not exist
            % otherwise use the object that was found.
            if isempty(obj.object)
                obj.object = serial(obj.comPort);
            else
                fclose(obj.object);
                obj.object = obj.object(1);
            end

            % Connect to instrument object, obj1.
            fopen(obj.object);

            % Configure instrument object, obj1.
            set(obj.object, 'BaudRate', obj.baud);
            set(obj.object, 'Terminator', obj.terminator);

            % %%
            obj.ID = objsendPIMotorCommand(1, '*IDN?', 1);

            %% reference move to negative limit
            obj.sendPIMotorCommand(1, 'RON 1 1', 0);
            obj.sendPIMotorCommand(1, 'SVO 1 1', 0);
            obj.sendPIMotorCommand(1, 'VEL 1 0.5', 0);
            obj.sendPIMotorCommand(1, 'FNL 1', 0);

            obj.minimum = str2num(sendPIMotorCommand(1, 'TMN?', 1))/obj.scale;
            obj.maximum = str2num(sendPIMotorCommand(1, 'TMX?', 1))/obj.scale;
            
            %Wait until motor gets to limit.
            while 1==1
                status = sendPIMotorCommand(1, 'SRG? 1 1', 1);
                num = uint16(hex2dec(status(7:end-1)));
                if bitand(num, hex2dec('A000'))==hex2dec('8000')
                    break;
                else
                    pause(0.1);
                end
            end
        end

        function new_position = MoveTo(handles, desired_position, speed, move_relative, move_async)

            if move_relative
                pos = GetMotorPos(motor_index);         % @@@ Not right.  Need real position.
                desired_position = pos+desired_position;
            end

            % Check against limits
            if desired_position<PI_1.minimum
                desired_position = PI_1.minimum;
            elseif desired_position>PI_1.maximum
                desired_position = PI_1.maximum;
            end

            %% move to an absolute position
            sendPIMotorCommand(1, sprintf('VEL 1 %f', speed*PI_1.factor), 0);
            sendPIMotorCommand(1, sprintf('MOV 1 %f', (desired_position+obj.center)*obj.factor), 0);

            %% Wait until stage reaches target
            if move_async==0
                while 1==1
                    status = sendPIMotorCommand(1, 'SRG? 1 1', 1);
                    num = uint16(hex2dec(status(7:end-1)));
                    if bitand(num, hex2dec('A000'))==hex2dec('8000')
                        break;
                    else
                        pause(0.1);
                    end
                end
            end

            if ~isempty(obj.gui_handle)
                if ~strcmp(obj.gui_handle, '')
                    h = eval(sprintf('handles.%s', obj.gui_handle_name));
                    set(h, 'String', num2str(obj.getPosition));
                end
            end
        end

        function position = GetPosition
            result = sendPIMotorCommand(1, 'POS?', 1);
            [nums ~] = sscanf(result, '%i=%f');
            position = nums(2)/obj.factor+obj.center;
        end

        function SetCenter
            result = sendPIMotorCommand(1, 'POS?', 1);
            [nums count] = sscanf(result, '%i=%f');
            obj.center = nums(2)/obj.factor;
        end
        
        function Halt
            fprintf(obj.object,'HLT 1\n');
        end
    end
    
end



     
        