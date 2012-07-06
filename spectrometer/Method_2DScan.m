classdef Method_2DScan < handle
    
    properties
        hPlot;
        plot_data;
        mean_data;
    end
     
    methods
        
        function obj = Method_2DScan
            obj.plot_data = zeros(32, 32);
            obj.mean_data = zeros(32, 32);
        end

        function InitializePlot(obj, handles)
            obj.hPlot = contourf(obj.plot_data, 16);
            set(obj.hPlot,'DataSource', 'method.PlotData(1)');
            colormap(handles.axesMain, 'Jet');
%            set(handles.axesMain, 'XLim', [1, 32]);
        end

        function value = PlotData(obj, N)
            switch N
                case 1
                    value = obj.plot_data;
                otherwise
                    error('Unknown plot data index');
            end
        end

        function InitializeData(obj, ~)
            obj.plot_data = zeros(32, 32);
            obj.mean_data = zeros(32, 32);
        end

        function Scan(obj, handles)
            global PARAMS Interferometer_Stage;
            for ii = 1:PARAMS.nScans;
                step = (PARAMS.stop-PARAMS.start)/31;
                jj = 1;
                for lambda = PARAMS.start:step:PARAMS.stop
                    Interferometer_Stage.MoveTo(handles, lambda, 50, 0, 0);
                    sample = FPAS_Sample;
                    obj.plot_data(jj,:) = Log10(sample.mean(33:64)./sample.mean(1:32));
                    refreshdata(obj.hPlot, 'caller');
                    RefreshRawData(handles, sample);
                    drawnow;
                    jj = jj+1;
                end
                obj.plot_data = fft(obj.plot_data);
                refreshdata(obj.hPlot, 'caller');
                drawnow;
                Interferometer_Stage.MoveTo(handles, PARAMS.start, 50, 0, 1);
                pause(1.0);
                obj.mean_data = ((obj.mean_data*ii)+obj.plot_data)/(ii+1);
            end
            obj.plot_data = obj.mean_data;
            refreshdata(obj.hPlot, 'caller');
            drawnow;
        end
        
        function Save(obj, filename)
            save(filename, obj.plot_data);
        end

    end
end


            