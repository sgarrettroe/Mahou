classdef Method_RawData < handle
    
    properties
        hPlots;
        sample;
    end
     
    methods
        
        function obj = Method_RawData
            obj.sample.mean.pixels = zeros(32, 1000);
            obj.sample.mean.external = zeros(16, 1000);
            obj.sample.noise = zeros(32, 1);
        end

        function InitializePlot(obj, handles)
            global scales;
            obj.hPlots(1) = plot(handles.axesMain, scales.ch32, obj.sample.mean.pixels([1:32]), 'r');
            set(obj.hPlots(1),'XDataSource', 'scales.ch32', 'YDataSource', 'method.PlotData(1)');
            hold(handles.axesMain, 'on');
            obj.hPlots(2) = plot(handles.axesMain, scales.ch32, obj.sample.mean.pixels([33:64]), 'g');
            set(obj.hPlots(2),'XDataSource', 'scales.ch32', 'YDataSource', 'method.PlotData(2)');
            obj.hPlots(3) = plot(handles.axesMain, scales.ch32, obj.sample.noise./1000, 'b');
            set(obj.hPlots(3),'XDataSource', 'scales.ch32', 'YDataSource', 'method.PlotData(3)./1000');
            hold(handles.axesMain, 'off');
            set(handles.axesMain, 'XLim', [1, 32]);
        end

        function value = PlotData(obj, N)
            switch N
                case 1
                    value = obj.sample.mean.pixels(1:32);
                case 2
                    value = obj.sample.mean.pixels(33:64);
                case 3
                    value = obj.sample.noise;
                otherwise
                    error('Unknown plot data index');
            end
        end

        function InitializeData(obj, handles)
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


            