classdef Sampler_Uniform < handle
    
    properties (SetAccess = private)
        sample;
    end
    
    methods
        
        function Initialize(obj)
        end
        
        function Start(obj)
        end
        
        function result = Finish(obj)
            obj.sample.data.pixels = random('uniform', 0.0, 5.0, 64, PARAMS.nShots);
            obj.sample.data.external = random('uniform', 0.0, 5.0, 16, PARAMS.nShots);
            
            sample.mean.pixels = mean(sample.data.pixels, 2);
            sample.mean.external = mean(sample.data.external, 2);

            sample.mOD = log10(sample.data.pixels([33:64],:)./sample.data.pixels([1:32],:))*1000;
            sample.noise = std(sample.mOD, 1, 2);
            sample.mOD = mean(sample.mOD, 2);
            sample.abs_noise = (std(sample.data.pixels(16,:))+std(sample.data.pixels(17,:)))/2;
            
            result = obj.sample;
        end
        
    end
end
