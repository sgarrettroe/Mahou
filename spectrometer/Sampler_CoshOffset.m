classdef Sampler_CoshOffset < handle
    
    properties (SetAccess= private)
        sample;
    end
    
    methods
        
        function obj = Sampler_CoshOffset
        end
        
        function Initialize(obj)
        end
        
        function Start(obj)
        end
        
        function result = Finish(obj)
            for ii=1:32
                obj.sample.data.pixels(ii, :)   = abs(sech((ii-14)/6)^2 + random('Normal', 0, .2, 1, PARAMS.nShots));
                obj.sample.data.pixels(ii+32,:) = abs(sech((ii-18)/6)^2 + random('Normal', 0, .2, 1, PARAMS.nShots));
            end
            obj.sample.data.external = random('uniform', 0.0, 5.0, 16, PARAMS.nShots);

            obj.sample.mean.pixels = mean(obj.sample.data.pixels, 2);
            obj.sample.mean.external = mean(obj.sample.data.external, 2);

            obj.sample.mOD = log10(obj.sample.data.pixels([33:64],:)./obj.sample.data.pixels([1:32],:))*1000;
            obj.sample.noise = std(obj.sample.mOD, 1, 2);
            obj.sample.mOD = mean(obj.sample.mOD, 2);
            obj.sample.abs_noise = (std(obj.sample.data.pixels(16,:))+std(obj.sample.data.pixels(17,:)))/2;
            
            result = obj.sample;
        end

    end
end
