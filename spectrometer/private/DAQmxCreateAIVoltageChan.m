function taskh = DAQmxCreateAIVoltageChan(lib,physicalChannel,Vmin,Vmax)
% function taskh = DAQmxCreateAIVoltageChan(lib,physicalChannel,Vmin,Vmax)
% 
% this function creates a task and adds analog input channel(s) to the task
% 
% inputs:
%	lib - .dll or alias (ex. 'myni')
%	physicalChannel - channel(s) to add to task
%		1 channel example: 'Dev1/ai0'
%		2 channels example: {'Dev1/ai0','Dev1/ai1'}
%			passing as .../ai0-1 probably also works, but I didn't test
%	Vmin - minimum voltage(s)
%		1 channel example: -10
%		2 channels example: [-10,-10]
%	Vmax - maximum voltage(s)
% 
% 
% C functions used:
%	int32 DAQmxCreateTask (const char taskName[],TaskHandle *taskHandle);
%	int32 DAQmxCreateAIVoltageChan (TaskHandle taskHandle,const char physicalChannel[],
%		const char nameToAssignToChannel[],int32 terminalConfig,float64 minVal,
%		float64 maxVal,int32 units,const char customScaleName[]);
%	int32 DAQmxTaskControl (TaskHandle taskHandle,int32 action);
% 
% written by Nathan Tomlin (nathan.a.tomlin@gmail.com)
% v0 - 1004


% create task
taskh = [];
name_task = '';	% recommended to avoid problems
[err,b,taskh] = calllib(lib,'DAQmxCreateTask',name_task,uint32(taskh));
DAQmxCheckError(lib,err);

% 	% check whether done
% 	[err,b,istaskdone] = calllib(lib,'DAQmxIsTaskDone',(taskh),0);
%  	DAQmxCheckError(lib,err);

% create AI voltage channel(s) and add to task
DAQmx_Val_RSE =10083; % RSE
DAQmx_Val_Volts= 10348; % measure volts
name_channel = '';	% recommended to avoid problems

if ~iscell(lines)	% just 1 channel to add to task
	[err,b,c,d] = calllib(lib,'DAQmxCreateAIVoltageChan',taskh,...
		physicalChannel,name_channel,...
		DAQmx_Val_RSE,Vmin,Vmax,DAQmx_Val_Volts,'');
	DAQmxCheckError(lib,err);
else % more than 1 channel to add to task
	for m = 1:numel(physicalChannel)
		[err,b,c,d] = calllib(lib,'DAQmxCreateAIVoltageChan',taskh,...
			physicalChannel{m},name_channel,...
			DAQmx_Val_RSE,Vmin(m),Vmax(m),DAQmx_Val_Volts,'');
		DAQmxCheckError(lib,err);
	end
end

% verify everything OK
DAQmx_Val_Task_Verify =2; % Verify
[err,b] = calllib(lib,'DAQmxTaskControl',taskh,DAQmx_Val_Task_Verify);
DAQmxCheckError(lib,err);
