classdef IO_Interface < handle
    
    properties (SetAccess = private)
        dio;
        active;
    end
    
    methods
        
        function obj = IO_Interface
            obj.active = 0;
            try 
                obj.dio = digitalio('nidaq', 'Dev2');
                obj.active = 1;
            catch
                warning('Spectrometer:DIO', 'Digital I/O module not found.  Entering simulation mode');
            end
            if obj.active
                addline(obj.dio, 7, 1, 'out');      % Port 1 bit 7
            else
            end;
        end
        
        function delete(obj)
            CloseClockGate(obj);
            if obj.active
                close(obj.dio);
            end
        end

        function OpenClockGate(obj)
            if obj.active
                putvalue(obj.dio.Line(1), 1);
            end
        end
        
        function CloseClockGate(obj)
            if obj.active
                putvalue(obj.dio.Line(1), 0);
            end
        end
        
    end
    
end
            
            
            