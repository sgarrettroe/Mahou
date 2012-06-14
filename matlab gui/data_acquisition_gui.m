function varargout = data_acquisition_gui(varargin)
% DATA_ACQUISITION_GUI MATLAB code for data_acquisition_gui.fig
%      DATA_ACQUISITION_GUI, by itself, creates a new DATA_ACQUISITION_GUI or raises the existing
%      singleton*.
%
%      H = DATA_ACQUISITION_GUI returns the handle to a new DATA_ACQUISITION_GUI or the handle to
%      the existing singleton*.
%
%      DATA_ACQUISITION_GUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in DATA_ACQUISITION_GUI.M with the given input arguments.
%
%      DATA_ACQUISITION_GUI('Property','Value',...) creates a new DATA_ACQUISITION_GUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before data_acquisition_gui_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to data_acquisition_gui_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help data_acquisition_gui

% Last Modified by GUIDE v2.5 12-Jun-2012 17:46:40

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @data_acquisition_gui_OpeningFcn, ...
                   'gui_OutputFcn',  @data_acquisition_gui_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before data_acquisition_gui is made visible.
function data_acquisition_gui_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to data_acquisition_gui (see VARARGIN)

% Choose default command line output for data_acquisition_gui
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes data_acquisition_gui wait for user response (see UIRESUME)
% uiwait(handles.figure1);


global dllinfo USE_DLLS USE_LABMAX labMax;             %%%Could be put into handles
dllinfo = [];
USE_DLLS = 0;
USE_LABMAX = 1;
labMax = [];

if USE_DLLS,
  %load dlls here
end %if USE_DLLS

if USE_LABMAX
  disp('Initialize LabMax');
  
  %set up parameters for communication with the LabMax scope by serial port
  LABMAX_PORT = 'COM1';
  LABMAX_BAUD = 115200;
  LABMAX_PARITY = 'NONE';
  LABMAX_SBITS = '1';
  LABMAX_PACE = 'NONE';
  LABMAX_SERVICE = 'OFF'; 
  LABMAX_TERMINATOR = {'CR/LF','CR/LF'};
  %I'm guessing data bits is 8???
  
  %see doc serial to see more options also check instrument control
  %toolbox
  
  %find any open com port objects
  labMax = instrfind('Type', 'serial', 'Port', LABMAX_PORT, 'Tag', '');

  % Create the serial port object if it does not exist
  % otherwise use the object that was found.
  if isempty(labMax)
    labMax = serial(LABMAX_PORT);
  else
    fclose(labMax); %close all found objects
    labMax = labMax(1) %keep only the first
  end
  
  % Connect to instrument object, labMax.
  fopen(labMax);

  % Configure instrument object, labMax.
  set(labMax, 'BaudRate', LABMAX_BAUD);
  set(labMax, 'Terminator', LABMAX_TERMINATOR);
  
  % Baud rate
  labMaxCommandHandshake(labMax, ['SYST:COMM:SER:BAUD ' num2str(LABMAX_BAUD)]);
  %make sure we are handshaking
  labMaxCommandHandshake(labMax, 'SYST:COMM:HAND ON');
  %make meter under remote (computer) control
  labMaxCommandHandshake(labMax, 'SYST:REM');
  %turn service requests off because I think they make for some garbage
  %bits (char(5)) that mess up reading strings
  labMaxCommandHandshake(labMax, 'SYST:COMM:SER:SERV OFF');
 
  idn = labMaxQueryHandshake(labMax,'*IDN?');
  if regexp(idn,'^Coherent, Inc')~=1
    warning('SGRLAB:hardwareTrouble',...
      sprintf('LabMax communication not okay, turning it off\n'));
    USE_LABMAX = false;
  end
  
  %check status here should be somehting like 00000884
  labMaxStatus = labMaxQueryHandshake(labMax,'SYST:STAT?');
  fprintf(1,'LabMax status %s\n',labMaxStatus);
  
end
   

% --- Outputs from this function are returned to the command line.
function varargout = data_acquisition_gui_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in btnGoCollect.
% THIS IS THE MAIN FUNCTION!!!
function btnGoCollect_Callback(hObject, eventdata, handles)
% hObject    handle to btnGoCollect (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global labMax

%if btnGoCollect == "Running" (ie we are already running) just exit and do nothing
if strcmpi(get(handles.btnGoCollect,'String'),'Running')
  return
end

%set text of btnGoCollect to "Running"
set(handles.btnGoCollect,'String','Running');

%set text of btnStop to "Stop"
set(handles.btnStop,'String','Stop');

%set test of btnHold to "Hold" (not implemented in loop yet)
set(handles.btnHold,'String','Hold');

%read parameters from parameters panel
params = read_parameters_panel(handles);

%save user value of scan_max. "Show" functions automatically set Scans=-1
%(infinite loop). We need to save the value in order to reset the value
old_scan_max = params.scan_max;

%initialize data structure
[data,avg_data] = initializeData(params);
size(data);

%set up the plots
hPlots = initializePlot(handles,params,data,avg_data);

%
i_scan = 0;
while (i_scan ~= params.scan_max) && (strcmpi(get(handles.btnStop,'String'),'Stop'))
  
  %increment the scan counter
  i_scan = i_scan + 1;
  set(handles.txtScan,'String',sprintf('Scan #%i',i_scan));
  
  %switch on the value of lstMethod
  switch lower(params.method)
    case 'show labmax'
      %exectute the 'Show' procedure for the LabMax meter
      
      %set scans = -1
      set(handles.edtScans,'String','-1');
      params.scan_max = -1;
      
      %call proc
      [data,avg_data] = showLabMax(labMax,handles,params,data,avg_data,i_scan);

    case 'labmax noncolinear ac'
      %do the full AC procedure with the meter
      [data,avg_data] = scanLabMax(labMax,handles,params,data,avg_data,i_scan,hPlots);

    otherwise
      %exit with warning
      warning('SGRLAB:methodUnknown','unknown method');
  end % end case

  %update plot
  %dummy;
  %myrefreshdata(hPlots,'caller');
  refreshdata(hPlots,'caller');
  drawnow;
end %end while loop

%save data (a cheat for now)
assignin('base','data',data);
assignin('base','avg_data',avg_data);

%clean up the number of scans
set(handles.edtScans,'String',num2str(old_scan_max));

%clean up buttons
set(handles.btnStop,'String','')
set(handles.btnHold,'String','')
set(handles.btnGoCollect,'String','Go Collect')


function p = read_parameters_panel(handles)

%read the parameters on the gui panel and return a structure
p.scan_max = str2double(get(handles.edtScans,'String'));
p.shots = str2double(get(handles.edtShots,'String'));
p.start = str2double(get(handles.edtStart,'String'));
p.end = str2double(get(handles.edtEnd,'String'));
p.resolution = str2double(get(handles.edtResolution,'String'));
contents = get(handles.lstMethod,'String'); %get list of methods
p.method = contents{get(handles.lstMethod,'Value')}; %get which method is selected


% --- Executes on button press in btnStop.
function btnStop_Callback(hObject, eventdata, handles)
% hObject    handle to btnStop (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% if go_collect not running then do nothing and exit
if ~strcmpi(get(handles.btnGoCollect,'String'),'Running')
  return
end

% set text to "Stopping" (which serves as the flag that the user really
% wants to stop the scan
set(hObject,'String','Stopping');


% --- Executes on button press in btnHold.
function btnHold_Callback(hObject, eventdata, handles)
% hObject    handle to btnHold (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on selection change in listMethod.
function lstMethod_Callback(hObject, eventdata, handles)
% hObject    handle to lstMethod (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns lstMethod contents as cell array
%        contents{get(hObject,'Value')} returns selected item from lstMethod


% --- Executes during object creation, after setting all properties.
function lstMethod_CreateFcn(hObject, eventdata, handles)
% hObject    handle to lstMethod (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes during object creation, after setting all properties.
function edtMotor1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edtMotor1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes on button press in btnResetMotor1.
function btnResetMotor1_Callback(hObject, eventdata, handles)
% hObject    handle to btnResetMotor1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

motor_index = 1;
new_position = reset_motor(motor_index);
set(handles.edtMotor1,'String',num2str(new_position));


% --- Executes during object creation, after setting all properties.
function edtShots_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edtShots (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes during object creation, after setting all properties.
function edtStart_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edtStart (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes during object creation, after setting all properties.
function edtEnd_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edtEnd (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes during object creation, after setting all properties.
function edtResolution_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edtResolution (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called



function edtScans_Callback(hObject, eventdata, handles)
% hObject    handle to edtScans (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edtScans as text
%        str2double(get(hObject,'String')) returns contents of edtScans as a double



function edtMotor1_Callback(hObject, eventdata, handles)
% hObject    handle to edtMotor1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edtMotor1 as text
%        str2double(get(hObject,'String')) returns contents of edtMotor1 as a double


% --- Executes on button press in btnMotor1.
function btnMotor1_Callback(hObject, eventdata, handles)
% hObject    handle to btnMotor1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
desired_position = str2double(get(handles.edtMotor1,'String'));
set(handles.edtMotor1,'String','moving...');

%
% command to move motor goes here
%
motor_index = 1;
new_position = moveMotorFs(handles,motor_index,desired_position);


function edtShots_Callback(hObject, eventdata, handles)
% hObject    handle to edtShots (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edtShots as text
%        str2double(get(hObject,'String')) returns contents of edtShots as a double



function edtStart_Callback(hObject, eventdata, handles)
% hObject    handle to edtStart (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edtStart as text
%        str2double(get(hObject,'String')) returns contents of edtStart as a double



function edtEnd_Callback(hObject, eventdata, handles)
% hObject    handle to edtEnd (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edtEnd as text
%        str2double(get(hObject,'String')) returns contents of edtEnd as a double



function edtResolution_Callback(hObject, eventdata, handles)
% hObject    handle to edtResolution (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edtResolution as text
%        str2double(get(hObject,'String')) returns contents of edtResolution as a double

function new_position = reset_motor(motor_index);
%put code to reset the "0" position of the motors here
reached_position = 0;


% --- Executes on button press in chkAutoscale.
function chkAutoscale_Callback(hObject, eventdata, handles)
% hObject    handle to chkAutoscale (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of chkAutoscale
if get(hObject,'Value')==1
  ylim(handles.axes1,'auto');
else
  ylim(handles.axes1,get(handles.axes1,'YLim'));
end


% --- Executes during object deletion, before destroying properties.
function figure1_DeleteFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global USE_LABMAX labMax USE_DLLS dllinfo

if USE_DLLS
  %clean up dlls here
  disp('Clean up dlls');
end

if USE_LABMAX
  disp('Clean up LabMax');
  %make meter local
  labMaxCommandHandshake(labMax,'SYST:LOC');
  
  %hang up connection
  fclose(labMax);
end