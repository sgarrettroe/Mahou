classdef Method_Spectrum < handle
    
    properties
        hPlots;
        sample;
    end
     
    methods
        
       function obj = Method_Spectrum
            obj.sample.mOD = zeros(32, 1);
        end

       function InitializePlot(obj, handles)
            global scales;
            obj.hPlots = plot(handles.axesMain, scales.ch32, obj.sample.mOD, 'r');
            set(obj.hPlots,'XDataSource', 'scales.ch32', 'YDataSource', 'method.PlotData(1)');
            set(handles.axesMain, 'XLim', [1, 32]);
        end

        function value = PlotData(obj, N)
            switch N
                case 1
                    value = obj.sample.mOD;
                otherwise
                    error('Unknown plot data index');
            end
        end

        function InitializeData(obj, ~)
        end
        
        function Scan(obj, handles)
            % Note: it is an object-oriented nightmare for this class to
            % know about the global instance, but I can't find a way around
            % it. DAC. 2012/06/28
            global method scales;
            obj.sample = FPAS_Sample;
            refreshdata(obj.hPlots, 'caller');
            RefreshRawData(handles, obj.sample);
            drawnow;
        end
        
        function Save(obj, filename)
            save(filename, obj.sample);
        end
        

    end
end

     