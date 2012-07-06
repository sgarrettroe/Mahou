function DAQmxCfgTimingBurstExportClock(lib,taskh,sampleMode,...
    sampsPerChan,sampleClkRate,sampleClkOutputTerm,...
    sampleClkPulsePolarity,pauseWhen,readyEventActiveLevel)
% 
% C functions used:
%DAQmxCfgBurstHandshakingTimingExportClock
% int32 DAQmxCfgBurstHandshakingTimingExportClock (TaskHandle taskHandle,
%     int32 sampleMode, uInt64 sampsPerChan, float64 sampleClkRate, const char
%     sampleClkOutpTerm[], int32 sampleClkPulsePolarity, int32 pauseWhen, int32
%     readyEventActiveLevel);
%
%
% based on: 
% written by Nathan Tomlin (nathan.a.tomlin@gmail.com)
% v0 - 1004

[err,stringout_term]=calllib(lib,'DAQmxCfgBurstHandshakingTimingExportClock',...
		taskh,int32(sampleMode),uint64(sampsPerChan),...
        double(sampleClkRate),sampleClkOutputTerm,int32(sampleClkPulsePolarity),int32(pauseWhen),...
        int32(readyEventActiveLevel));

DAQmxCheckError(lib,err);
