%Follow procedure on p.28
%pages  +14

H=actxserver('JYMono.Monochromator');
H1=H.uniqueid;
% Load Parameters Last Saved, Need Registry Key for Load
H.Load
H.OpenCommunications
H.Initialize
% DoEvents allows the windows to Multitask
% DoEvents in VB is Drawnow in MATLAB
% Since we are only dealing with one monochromater, IsBusy is sufficient
% (vs. the optional IsReady)
if H.IsBusy==True
    Drawnow
elseif H.IsBusy~=True
    break
end
actxcontrol('JYMono.Monochromator')
% Do I have to do a eventshandler?
% wait for it to initialize 
% Use isready (controller) to make sure the controller has finished issuing commands
% Use isbusy (hardware) to make sure action is complete?

%Use H.events to see what kind of events there can be
%registerevent
%eventlisteners, 

H.registerevent('JYSYSTEMLIBLib.IJYEventInfo')
% Listing the event handler functions associated with COM object events
info=H.eventlisteners

%MovetoGrating, GetCurrentGrating
% Gratings are 1200 Groves/mm
% isn't it 150, 75 & 50?
%MovetoSlitWidth, GetCurrentSlitWidth, CalibrateSlitWidth

%save
%unregisterallevents or unregisterevent
%unintialize 


%What is double?

H.delete

%Example:
%ccd.UniqueId = “CCD1”
%ccd.Load
%ccd.OpenCommunications
%ccd.Initialize ‘ Returns immediately. Caller should wait for the event.
%‘ Example of event handler
%Private Sub ccdObject_Initialize(ByVal Status As Long, ByVal eventInfo As
%JYSYSTEMLIBLib.IJYEventInfo)
%MsgBox( “Hardware Initialized!”)
%End Sub