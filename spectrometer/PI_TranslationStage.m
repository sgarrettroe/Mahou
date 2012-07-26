classdef PI_TranslationStage < hgsetget

    properties
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
        initialized;
    end
        
    methods
        
        function obj = PI_TranslationStage(port, scale, gui_object_name)
            obj.initialized = 0;
            obj.center = 0;
            obj.scale = scale;
            obj.comPort = port;
            obj.terminator = {'LF','LF'};
            obj.type = 'serial';
            obj.gui_object = gui_object_name;
            obj.baud = 38400;

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

            try
                % %%
                obj.ID = obj.sendPIMotorCommand('*IDN?', 1);

                [nums ~] = sscanf(obj.sendPIMotorCommand('TMN?', 1), '%i=%f');
                obj.minimum = nums(2)/obj.scale;
                [nums ~] = sscanf(obj.sendPIMotorCommand('TMX?', 1), '%i=%f');
                obj.maximum = nums(2)/obj.scale;

                % reference move to negative limit
                obj.sendPIMotorCommand('RON 1 1', 0);
                obj.sendPIMotorCommand('SVO 1 1', 0);
                obj.sendPIMotorCommand('VEL 1 0.5', 0);
                obj.sendPIMotorCommand('FNL 1', 0);

                %Wait until motor gets to limit.
                while 1==1
                    status = obj.sendPIMotorCommand('SRG? 1 1', 1);
                    num = uint16(hex2dec(status(7:end-1)));
                    if bitand(num, hex2dec('A000'))==hex2dec('8000')
                        break;
                    else
                        pause(0.1);
                    end
                end
                obj.initialized = 1;
            catch
                warning('Spectrometer:Interferometer', 'Cannot find translation stage.  Entering simulation mode.');
            end
        end

        %%
        function delete(obj)
            fclose(obj.object);
        end
        
        function new_position = MoveTo(obj, handles, desired_position, speed, move_relative, move_async)

            if move_relative
                pos = GetMotorPos(motor_index);         % @@@ Not right.  Need real position.
                desired_position = pos+desired_position;
            end

            % Check against limits
            if desired_position<obj.minimum
                desired_position = obj.minimum;
            elseif desired_position>obj.maximum
                desired_position = obj.maximum;
            end
            new_position = desired_position;
            
            %% move to an absolute position
            obj.sendPIMotorCommand(sprintf('VEL 1 %f', speed*obj.scale), 0);
            obj.sendPIMotorCommand(sprintf('MOV 1 %f', (desired_position+obj.center)*obj.scale), 0);

            %% Wait until stage reaches target
            if move_async==0
                while 1==1
                    status = obj.sendPIMotorCommand('SRG? 1 1', 1);
                    num = uint16(hex2dec(status(7:end-1)));
                    if bitand(num, hex2dec('A000'))==hex2dec('8000')
                        break;
                    else
                        pause(0.1);
                    end
                end
            end

            if ~strcmp(obj.gui_object, '')
                h = eval(sprintf('handles.%s', obj.gui_object));
                set(h, 'String', num2str(obj.GetPosition));
            end
        end

        function position = GetPosition(obj)
            if obj.initialized
                result = obj.sendPIMotorCommand('POS?', 1);
                [nums ~] = sscanf(result, '%i=%f');
                position = nums(2)/obj.scale+obj.center;
            else
                position = 0;
            end
        end

        function SetCenter(obj)
            if obj.initialized
                result = sendPIMotorCommand('POS?', 1);
                [nums ~] = sscanf(result, '%i=%f');
                obj.center = nums(2)/obj.scale;
            end
        end
        
        function Halt(obj)
            fprintf(obj.object,'HLT 1\n');
        end
        
        function result = sendPIMotorCommand(obj, msg, expect_response)
            message = deblank(msg);

            if expect_response~=0
                result = query(obj.object, message);
            else
                result = '';
                fprintf(obj.object, message);
            end

            error_code = query(obj.object, 'ERR?');
            if error_code(1)~='0'
                error('Motor error code %s: %s\n', deblank(error_code), message);
            end
        end
        
    end
    
end



     
        