function varargout = Spectrometer(varargin)
% SPECTROMETER MATLAB code for Spectrometer.fig
%      SPECTROMETER, by itself, creates a new SPECTROMETER or raises the existing
%      singleton*.
%
%      H = SPECTROMETER returns the handle to a new SPECTROMETER or the handle to
%      the existing singleton*.
%
%      SPECTROMETER('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in SPECTROMETER.M with the given input arguments.
%
%      SPECTROMETER('Property','Value',...) creates a new SPECTROMETER or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Spectrometer_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Spectrometer_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

global method;

% Edit the above text to modify the response to help Spectrometer

% Last Modified by GUIDE v2.5 29-Jun-2012 14:31:41

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Spectrometer_OpeningFcn, ...
                   'gui_OutputFcn',  @Spectrometer_OutputFcn, ...
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

% --- Executes just before Spectrometer is made visible.
function Spectrometer_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Spectrometer (see VARARGIN)

global scales hRawPlots method;

% Choose default command line output for Spectrometer
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

scales.ch32 = [0:31];

%Default method on startup.
method = Method_RawData;
method.InitializePlot(handles);

global PARAMS;
PARAMS.nShots = 1000;
PARAMS.sample_method = 2;

% FPAS_Initialize;

% The Raw Data plot is the same for every method.
hRawPlots(1) = plot(handles.axesRawData, scales.ch32, zeros(1, 32), 'r');
set(hRawPlots(1),'XDataSource', 'scales.ch32', 'YDataSource','sample.mean.pixels([1:32])');
hold(handles.axesRawData, 'on');
hRawPlots(2) = plot(handles.axesRawData, scales.ch32, zeros(1, 32), 'g');
set(hRawPlots(2),'XDataSource', 'scales.ch32', 'YDataSource','sample.mean.pixels([33:64])');
hRawPlots(3) = plot(handles.axesRawData, scales.ch32, zeros(1, 32), 'b');
set(hRawPlots(3),'XDataSource', 'scales.ch32', 'YDataSource','sample.noise./1000');     % @@@ will have to fix this scale factor
hold(handles.axesRawData, 'off');
set(handles.axesRawData, 'XLim', [1, 32]);

% This sets up the initial plot - only do when we are invisible
% so window can get raised using Spectrometer.
%if strcmp(get(hObject,'Visible'),'off')
%    refreshPl
%end

% UIWAIT makes Spectrometer wait for user response (see UIRESUME)
% uiwait(handles.figure1);

% --- Outputs from this function are returned to the command line.
function varargout = Spectrometer_OutputFcn(hObject, eventdata, handles)
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

global method PARAMS;

% Called recursively if scan is running
if ~strcmp(get(handles.pbGo, 'String'), 'Go')
    set(handles.pbGo, 'String', 'Go', 'BackgroundColor', 'green');
    return;
end

% Get parameters

PARAMS.nScans = str2num(get(handles.editNumScans, 'String'));
PARAMS.nShots = str2num(get(handles.editNumShots, 'String'));

% FPAS_Initialize;          % FPAS Setup uses number of shots
method.InitializeData(handles);

set(handles.pbGo, 'String', 'Stop', 'BackgroundColor', [1.0 0.0 0.0]);

try
    for ii=1:PARAMS.nScans
        method.Scan(handles);
        if strcmp(get(handles.pbGo, 'String'), 'Go')~=0
            break;
        end
    end
catch
    set(handles.pbGo, 'String', 'Go', 'BackgroundColor', 'green');
    rethrow;
end
set(handles.pbGo, 'String', 'Go', 'BackgroundColor', 'green');

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

% --- Executes during object creation, after setting all properties.
function figure1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes on selection change in popupMethods.
function popupMethods_Callback(hObject, eventdata, handles)
% hObject    handle to popupMethods (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupMethods contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupMethods

global method;

delete(method);
switch get(handles .popupMethods, 'Value')
    case 1
        newmethod = Method_RawData;
    case 2
        newmethod = Method_Spectrum;
    otherwise
        error('Nonexistent data acquisition method selected');
end

% If we get here, we know that a new method has been instantiated
delete(method);
method = newmethod;
method.InitializePlot(handles)

% --- Executes during object creation, after setting all properties.
function popupMethods_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupMethods (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function editNumScans_Callback(hObject, eventdata, handles)
% hObject    handle to editNumScans (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editNumScans as text
%        str2double(get(hObject,'String')) returns contents of editNumScans as a double


% --- Executes during object creation, after setting all properties.
function editNumScans_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editNumScans (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function editNumShots_Callback(hObject, eventdata, handles)
% hObject    handle to editNumShots (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editNumShots as text
%        str2double(get(hObject,'String')) returns contents of editNumShots as a double


% --- Executes during object creation, after setting all properties.
function editNumShots_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editNumShots (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
