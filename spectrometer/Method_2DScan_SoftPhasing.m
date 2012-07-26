 classdef Method_2DScan_SoftPhasing < handle
    
    properties (SetAccess = private)
        hPlot;
        plot_data;
        telomere;
        sample;
        position;
        theta;
        passes;
    end
     
    methods
        
        function obj = Method_2DScan_SoftPhasing
            obj.plot_data = zeros(32, 32);
            obj.telomere = 10;
            obj.theta = 0;
        end

        function InitializePlot(obj, handles)
            obj.plot_data = zeros(32, 32);
            obj.hPlot = contourf(handles.axesMain, obj.plot_data, 16);
            set(obj.hPlot,'DataSource', 'method.PlotData(1)');
            colormap(handles.axesMain, 'Jet');
            obj.passes = 0;
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
            global PARAMS;
            obj.plot_data = zeros(32, 32);
            obj.mean_data = zeros(32, 32);
            PARAMS.nShots = (PARAMS.stop-PARAMS.start)/PARAMS.speed;
            PARAMS.binCount = ceil(PARAMS.stop-PARAMS.start)/PARAMS.binSize;
            obj.bin = zeros(32, PARAMS.binCount)+2*obj.telemere;
        end

        function Scan(obj, handles)
            global PARAMS Interferometer_Stage;
            Interferometer_Stage.MoveTo(handles, PARAMS.start, 100, 0, 0);
            obj.position = 0;
            
            % We're counting a scan as being once in each direction.
            
            % Outbound
            FPAS_Sample(0);
            Interferometer_Stage.MoveTo(handles, PARAMS.stop, PARAMS.speed, 0, 0);
            obj.sample = FPAS_Sample(1);
            obj.plot_data = Log10(obj.sample.mean(33:64)./obj.sample.mean(1:32));    %%@@@ ???
            processPosition;
            processData;
            
            % Inbound
            FPAS_Sample(0);
            Interferometer_Stage.MoveTo(handles, PARAMS.start, PARAMS.speed, 0, 0);
            obj.sample = FPAS_Sample(1);
            obj.plot_data = Log10(obj.sample.mean(33:64)./obj.sample.mean(1:32));
            obj.processPosition;
            obj.processData;
           
            % Refresh
            refreshdata(obj.hPlot, 'caller');
            RefreshRawData(handles, obj.sample);
            drawnow;

            obj.plot_data = fft(obj.plot_data);
            refreshdata(obj.hPlot, 'caller');
            drawnow;
            Interferometer_Stage.MoveTo(handles, PARAMS.start, 50, 0, 1);
            pause(1.0);
            obj.mean_data = ((obj.mean_data*ii)+obj.plot_data)/(ii+1);

            obj.plot_data = obj.mean_data;
            refreshdata(obj.hPlot, 'caller');
            drawnow;
        end

        function noise = GetNoise(obj)
            noise = obj.sample.abs_noise;
        end
        
        function Save(obj, filename)
            save(filename, obj.plot_data);
        end

    end

    methods (Access = private)

        function processPosition(obj)

            % Determine relative position of each sample in nm
            % Assuming channel 15 is phase-x and 16 is phase-y
            obj.sample.position = zeros(PARAMS.nShots);
            obj.sample.data.external(15,:) = obj.sample.data.external(15,:)./obj.sample.mean.external(15);
            obj.sample.data.external(16,:) = obj.sample.data.external(16,:)./obj.sample.mean.external(16);

            last_x = -1;
            last_y =  1;
            for ii = 1:PARAMS.nShots
                x = sign(obj.sample.external(15, ii));
                y = sign(obj.sample.external(16, ii));

                % consider every axis
                if x>0 && last_x<0 && y>0
                    t_theta = 0;
                    dir  = +1;
                elseif x<0 && last_x>0 && y>0
                    t_theta = 0;
                    dir  = -1;
                elseif y<0 && last_y>0 && x>0
                    t_theta = 1;
                    dir  = +1;
                elseif y>0 && last_y<0 && x>0
                    t_theta = 1;
                    dir  = -1;
                elseif x<0 && last_x>0 && y<0
                    t_theta = 2;
                    dir  = +1;
                elseif x>0 && last_x<0 && y<0
                    t_theta = 2;
                    dir  = -1;
                elseif y>0 && last_y<0 && x<0
                    t_theta = 3;
                    dir  = +1;
                elseif y<0 && last_y>0 && x<0
                    t_theta = 3;
                    dir  = -1;
                else continue;
                end
            end

            % Determine increment in position.  Allow that some axis
            % crossings could be missed.
            incr = dir * mod(t_theta-obj.theta, 4)/4.0 * 2.11; % @@@ ??? 632.816; %HeNe wavelength in air
            obj.theta = t_theta;
            obj.position = obj.position + incr;
            obj.sample.position(ii) = obj.position;

            % Fill in samples that were missed.  %@@@ ??? probably a more
            % efficient way to do this.
            indices = find(obj.sample.position);
            for ii=1:PARAMS.nShots
                if obj.sample.position==0
                    lower = last(find(indices>=ii));        %%@@@ ??? May have trouble with leading/trailing zeros
                    upper = first(find(indices<=ii));
                    val = (obj.position(lower)*(upper-ii)+obj.position(upper)*(ii-lower))/(upper-lower);
                    if val>0
                        obj.sample.position = val;
                    end
                end
            end
        end

        function processData(obj)
            global PARAMS;
            
            % Put in bins.
            bins = zeros(32, PARAMS.binCount);
            counts = zeros(PARAMS.binCount);
            partitions = PARAMS.start:PARAMS.binSize:PARAMS.stop;
            for ii=1:PARAMS.nShots;
               index = last(find(partitions<=obj.sample.position(ii)));
               bins(:,index) = (bins(:,index)*counts(index)+obj.sample.data(:, kk))/(counts(index)+1);
               counts(index) = counts(index+1);
            end

            % Merge with existing plot data.
            obj.plot_data = (obj.plot_data*obj.passes+bins)/(obj.passes+1);
            obj.passes = obj.passes+1;
        end

    end
 end


            