function varargout = FPAS_Gui(varargin)
% FPAS_GUI MATLAB code for FPAS_Gui.fig
%      FPAS_GUI, by itself, creates a new FPAS_GUI or raises the existing
%      singleton*.
%
%      H = FPAS_GUI returns the handle to a new FPAS_GUI or the handle to
%      the existing singleton*.
%
%      FPAS_GUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in FPAS_GUI.M with the given input arguments.
%
%      FPAS_GUI('Property','Value',...) creates a new FPAS_GUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before FPAS_Gui_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to FPAS_Gui_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

global samples avg;

% Edit the above text to modify the response to help FPAS_Gui

% Last Modified by GUIDE v2.5 26-Jun-2012 15:21:37

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @FPAS_Gui_OpeningFcn, ...
                   'gui_OutputFcn',  @FPAS_Gui_OutputFcn, ...
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

% --- Executes just before FPAS_Gui is made visible.
function FPAS_Gui_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to FPAS_Gui (see VARARGIN)

% Choose default command line output for FPAS_Gui
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% FPAS_Initialize(100);

global hPlots avg;

avg.pixels = random('uniform', 0.0, 5.0, 1, 64);
avg.external = random('uniform', 0.0, 5.0, 1, 16);

hPlots(1) = bar(handles.axesSample, avg.pixels([1:32]));
set(hPlots(1),'YDataSource','avg.pixels([1:32])');
hPlots(2) = bar(handles.axesReference, avg.pixels([33:64]));
set(hPlots(2),'YDataSource','avg.pixels([33:64])');
hPlots(3) = bar(handles.axesExternal, avg.external([1:16]));
set(hPlots(3),'YDataSource','avg.external([1:16])');

% This sets up the initial plot - only do when we are invisible
% so window can get raised using FPAS_Gui.
%if strcmp(get(hObject,'Visible'),'off')
%    refreshPl
%end

% UIWAIT makes FPAS_Gui wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = FPAS_Gui_OutputFcn(hObject, eventdata, handles)
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;

% --- Executes on button press in pbGo.
function pbGo_Callback(hObject, eventdata, handles)
% hObject    handle to pbGo (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global samples avg hPlots;

% [samples, avg = FPAS_sample;
avg.pixels = random('uniform', 0.0, 5.0, 1, 64);
avg.external = random('uniform', 0.0, 5.0, 1, 16);
    
refreshdata(hPlots,'caller');
drawnow;

% --------------------------------------------------------------------
function FileMenu_Callback(hObject, eventdata, handles)
% hObject    handle to FileMenu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function OpenMenuItem_Callback(hObject, eventdata, handles)
% hObject    handle to OpenMenuItem (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
file = uigetfile('*.fig');
if ~isequal(file, 0)
    open(file);
end

% --------------------------------------------------------------------
function PrintMenuItem_Callback(hObject, eventdata, handles)
% hObject    handle to PrintMenuItem (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
printdlg(handles.figure1)

% --------------------------------------------------------------------
function CloseMenuItem_Callback(hObject, eventdata, handles)
% hObject    handle to CloseMenuItem (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
selection = questdlg(['Close ' get(handles.figure1,'Name') '?'],...
                     ['Close ' get(handles.figure1,'Name') '...'],...
                     'Yes','No','Yes');
if strcmp(selection,'No')
    return;
end

delete(handles.figure1)


% --- Executes on selection change in popupmenu1.
function popupmenu1_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = get(hObject,'String') returns popupmenu1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu1


% --- Executes during object creation, after setting all properties.
function popupmenu1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
     set(hObject,'BackgroundColor','white');
end

set(hObject, 'String', {'plot(rand(5))', 'plot(sin(1:0.01:25))', 'bar(1:.5:10)', 'plot(membrane)', 'surf(peaks)'});


% --- Executes during object creation, after setting all properties.
function figure1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
