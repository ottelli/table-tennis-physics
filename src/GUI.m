function varargout = GUI(varargin)
% GUI MATLAB code for GUI.fig
%      GUI, by itself, creates a new GUI or raises the existing
%      singleton*.
%
%      H = GUI returns the handle to a new GUI or the handle to
%      the existing singleton*.
%
%      GUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GUI.M with the given input arguments.
%
%      GUI('Property','Value',...) creates a new GUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before GUI_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to GUI_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help GUI

% Last Modified by GUIDE v2.5 16-Nov-2017 15:02:25

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @GUI_OpeningFcn, ...
                   'gui_OutputFcn',  @GUI_OutputFcn, ...
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


% --- Executes just before GUI is made visible.
function GUI_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to GUI (see VARARGIN)

% Choose default command line output for GUI
handles.output = hObject;
set(handles.xPosEdit,'String',0)
set(handles.yPosEdit,'String',0)
set(handles.zPosEdit,'String',0.76)
set(handles.elevationEdit,'String',0)
set(handles.azimuthEdit,'String',0)
set(handles.launchVelocity,'String',0)
set(handles.pitchSpinSlider,'Value',0)
set(handles.yawSpinSlider,'Value',0)
set(handles.rollingSpinSlider,'Value',0)
set(handles.tSText,'String',num2str(get(handles.pitchSpinSlider,'Value')));
set(handles.sSText,'String',num2str(get(handles.yawSpinSlider,'Value')));
set(handles.rSText,'String',num2str(get(handles.rollingSpinSlider,'Value')));
set(handles.tog,'String','Regular Table');
% Update handles structure
guidata(hObject, handles);

% UIWAIT makes GUI wait for user response (see UIRESUME)
% uiwait(handles.figure1);

% --- Outputs from this function are returned to the command line.
function varargout = GUI_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


%% Initialisation

% --- Executes during object creation, after setting all properties.
function yawSpinSlider_CreateFcn(hObject, eventdata, handles)
% hObject    handle to yawSpinSlider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end

% --- Executes during object creation, after setting all properties.
function rollingSpinSlider_CreateFcn(hObject, eventdata, handles)
% hObject    handle to rollingSpinSlider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end

% --- Executes during object creation, after setting all properties.
function pitchSpinSlider_CreateFcn(hObject, eventdata, handles)
% hObject    handle to pitchSpinSlider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end

% --- Executes during object creation, after setting all properties.
function xPosEdit_CreateFcn(hObject,eventdata, handles)
% hObject    handle to xPosEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes during object creation, after setting all properties.
function yPosEdit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to yPosEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes during object creation, after setting all properties.
function azimuthEdit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to azimuthEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes during object creation, after setting all properties.
function elevationEdit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to elevationEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes during object creation, after setting all properties.
function zPosEdit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to zPosEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes during object creation, after setting all properties.
function launchVelocity_CreateFcn(hObject, eventdata, handles)
% hObject    handle to launchVelocity (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes during object creation, after setting all properties.
function tSText_CreateFcn(hObject, eventdata, handles)
set(hObject,'String',0)

%% --------------------Callbacks ----------------------------------
%------------------------------------------------------------------
%------------------------------------------------------------------

%% toggle and suggested shots
% --- Executes on button press in tog.
function tog_Callback(hObject, ~, handles)
if get(hObject,'Value') == 0
    set(hObject,'String','Regular Table')
else
    if get(hObject,'Value') == 1
        set(hObject,'String','Big Table')
    end
end
set(handles.customShotButton,'Value',1)

function backspinServeButton_Callback(hObject, eventdata, handles)
handles = guidata(hObject);
if get(handles.tog,'Value') == 0
set(handles.xPosEdit,'String',-0.1)
set(handles.yPosEdit,'String',1)
set(handles.zPosEdit,'String',0.9)
set(handles.elevationEdit,'String',-10)
set(handles.azimuthEdit,'String',-10)
set(handles.launchVelocity,'String',8.5)
set(handles.pitchSpinSlider,'Value',0)
set(handles.yawSpinSlider,'Value',816.8141)
set(handles.rollingSpinSlider,'Value',-816.8141)
set(handles.tSText,'String',num2str(get(handles.pitchSpinSlider,'Value')/(2*pi)));
set(handles.sSText,'String',num2str(get(handles.yawSpinSlider,'Value')/(2*pi)));
set(handles.rSText,'String',num2str(get(handles.rollingSpinSlider,'Value')/(2*pi)));
    else % big table
set(handles.xPosEdit,'String',-0.1)
set(handles.yPosEdit,'String',1)
set(handles.zPosEdit,'String',1)
set(handles.elevationEdit,'String',-10)
set(handles.azimuthEdit,'String',-10)
set(handles.launchVelocity,'String',20)
set(handles.pitchSpinSlider,'Value',0)
set(handles.yawSpinSlider,'Value',816.8141)
set(handles.rollingSpinSlider,'Value',-816.8141)
set(handles.tSText,'String',num2str(get(handles.pitchSpinSlider,'Value')/(2*pi)));
set(handles.sSText,'String',num2str(get(handles.yawSpinSlider,'Value')/(2*pi)));
set(handles.rSText,'String',num2str(get(handles.rollingSpinSlider,'Value')/(2*pi)));
end
guidata(hObject,handles);

function topSpinDriveButton_Callback(hObject, eventdata, handles)
handles = guidata(hObject);
if get(handles.tog,'Value') == 0
set(handles.xPosEdit,'String',-0.5)
set(handles.yPosEdit,'String',-0.1)
set(handles.zPosEdit,'String',1)
set(handles.elevationEdit,'String',8)
set(handles.azimuthEdit,'String',26)
set(handles.launchVelocity,'String',18.7)
set(handles.pitchSpinSlider,'Value',0)
set(handles.yawSpinSlider,'Value',838.8052)
set(handles.rollingSpinSlider,'Value',0)
set(handles.tSText,'String',num2str(get(handles.pitchSpinSlider,'Value')/(2*pi)));
set(handles.sSText,'String',num2str(get(handles.yawSpinSlider,'Value')/(2*pi)));
set(handles.rSText,'String',num2str(get(handles.rollingSpinSlider,'Value')/(2*pi)));
    else % big table
set(handles.xPosEdit,'String',-0.5)
set(handles.yPosEdit,'String',-0.1)
set(handles.zPosEdit,'String',1)
set(handles.elevationEdit,'String',16)
set(handles.azimuthEdit,'String',26)
set(handles.launchVelocity,'String',30)
set(handles.pitchSpinSlider,'Value',0)
set(handles.yawSpinSlider,'Value',838.8052)
set(handles.rollingSpinSlider,'Value',0)
set(handles.tSText,'String',num2str(get(handles.pitchSpinSlider,'Value')/(2*pi)));
set(handles.sSText,'String',num2str(get(handles.yawSpinSlider,'Value')/(2*pi)));
set(handles.rSText,'String',num2str(get(handles.rollingSpinSlider,'Value')/(2*pi)));
end
guidata(hObject,handles);

function sideSpinLoopButton_Callback(hObject, eventdata, handles)
handles = guidata(hObject);
if get(handles.tog,'Value') == 0
set(handles.xPosEdit,'String',-0.4)
set(handles.yPosEdit,'String',-0.2)
set(handles.zPosEdit,'String',0.76)
set(handles.elevationEdit,'String',14)
set(handles.azimuthEdit,'String',0)
set(handles.launchVelocity,'String',8)
set(handles.pitchSpinSlider,'Value',-50*2*pi)
set(handles.yawSpinSlider,'Value',-70*2*pi)
set(handles.rollingSpinSlider,'Value',150*2*pi)
set(handles.tSText,'String',num2str(get(handles.pitchSpinSlider,'Value')/(2*pi)));
set(handles.sSText,'String',num2str(get(handles.yawSpinSlider,'Value')/(2*pi)));
set(handles.rSText,'String',num2str(get(handles.rollingSpinSlider,'Value')/(2*pi)));
    else % big table
set(handles.xPosEdit,'String',-0.4)
set(handles.yPosEdit,'String',-1.8)
set(handles.zPosEdit,'String',0.76)
set(handles.elevationEdit,'String',14)
set(handles.azimuthEdit,'String',0)
set(handles.launchVelocity,'String',13.8)
set(handles.pitchSpinSlider,'Value',-50*2*pi)
set(handles.yawSpinSlider,'Value',-70*2*pi)
set(handles.rollingSpinSlider,'Value',150*2*pi)
set(handles.tSText,'String',num2str(get(handles.pitchSpinSlider,'Value')/(2*pi)));
set(handles.sSText,'String',num2str(get(handles.yawSpinSlider,'Value')/(2*pi)));
set(handles.rSText,'String',num2str(get(handles.rollingSpinSlider,'Value')/(2*pi)));
end
guidata(hObject,handles);

function smashShotButton_Callback(hObject, eventdata, handles)
handles = guidata(hObject);
if get(handles.tog,'Value') == 0
set(handles.xPosEdit,'String',1)
set(handles.yPosEdit,'String',0.7625)
set(handles.zPosEdit,'String',1.7)
set(handles.elevationEdit,'String',-22)
set(handles.azimuthEdit,'String',16)
set(handles.launchVelocity,'String',31.248)
set(handles.pitchSpinSlider,'Value',0)
set(handles.yawSpinSlider,'Value',0)
set(handles.rollingSpinSlider,'Value',0)
set(handles.tSText,'String',num2str(get(handles.pitchSpinSlider,'Value')/(2*pi)));
set(handles.sSText,'String',num2str(get(handles.yawSpinSlider,'Value')/(2*pi)));
set(handles.rSText,'String',num2str(get(handles.rollingSpinSlider,'Value')/(2*pi)));
else % big table
set(handles.xPosEdit,'String',0.2)
set(handles.yPosEdit,'String',1.5)
set(handles.zPosEdit,'String',1.7)
set(handles.elevationEdit,'String',-10)
set(handles.azimuthEdit,'String',15)
set(handles.launchVelocity,'String',31.248)
set(handles.pitchSpinSlider,'Value',0)
set(handles.yawSpinSlider,'Value',0)
set(handles.rollingSpinSlider,'Value',0)
set(handles.tSText,'String',num2str(get(handles.pitchSpinSlider,'Value')/(2*pi)));
set(handles.sSText,'String',num2str(get(handles.yawSpinSlider,'Value')/(2*pi)));
set(handles.rSText,'String',num2str(get(handles.rollingSpinSlider,'Value')/(2*pi)));
end
guidata(hObject,handles);

function customShotButton_Callback(hObject, eventdata, handles)
handles = guidata(hObject);
set(handles.xPosEdit,'String',0)
set(handles.yPosEdit,'String',0)
set(handles.zPosEdit,'String',0.76)
set(handles.elevationEdit,'String',0)
set(handles.azimuthEdit,'String',0)
set(handles.launchVelocity,'String',0)
set(handles.pitchSpinSlider,'Value',0)
set(handles.yawSpinSlider,'Value',0)
set(handles.rollingSpinSlider,'Value',0)
set(handles.tSText,'String',num2str(get(handles.pitchSpinSlider,'Value')/(2*pi)));
set(handles.sSText,'String',num2str(get(handles.yawSpinSlider,'Value')/(2*pi)));
set(handles.rSText,'String',num2str(get(handles.rollingSpinSlider,'Value')/(2*pi)));
guidata(hObject,handles);

%% sliders
% --- Executes on slider movement.
function yawSpinSlider_Callback(hObject, ~, handles)
AngVelY = get(hObject,'Value');
set(handles.sSText,'String',(num2str(get(hObject,'Value')/(2*pi))));

% --- Executes on slider movement.
function rollingSpinSlider_Callback(hObject, ~, handles)
AngVelZ = get(hObject,'Value');
set(handles.rSText,'String',(num2str(get(hObject,'Value')/(2*pi))));

% --- Executes on slider movement.
function pitchSpinSlider_Callback(hObject, ~, handles)
AngVelX = get(hObject,'Value');
set(handles.tSText,'String',(num2str(get(hObject,'Value')/(2*pi))));




%% type in values
function xPosEdit_Callback(~, ~, ~)


function yPosEdit_Callback(~, ~, ~)


function azimuthEdit_Callback(~, ~,~)


function elevationEdit_Callback(~, ~, ~)


function zPosEdit_Callback(~, ~, ~)


function launchVelocity_Callback(~, ~, ~)





%% zero buttons
function zero3_Callback(hObject, ~, handles)
set(handles.rollingSpinSlider,'Value',0)
set(handles.rSText,'String',num2str(get(handles.rollingSpinSlider,'Value')));

function zero2_Callback(hObject,~, handles)
set(handles.yawSpinSlider,'Value',0)
set(handles.sSText,'String',num2str(get(handles.yawSpinSlider,'Value')));

function zero1_Callback(hObject, ~, handles)
set(handles.pitchSpinSlider,'Value',0)
set(handles.tSText,'String',num2str(get(handles.pitchSpinSlider,'Value')));

%% go button

% --- Executes on button press in goButton.
function goButton_Callback(hObject, ~, handles)
% hObject    handle to goButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles = guidata(hObject);

x0=str2double(get(handles.xPosEdit,'string'));
y0=str2double(get(handles.yPosEdit,'string'));
z0=str2double(get(handles.zPosEdit,'string'));

strikeVelocity = str2double(get(handles.launchVelocity,'string'));

strikeAngle(1) = str2double(get(handles.elevationEdit,'string'));
strikeAngle(2) = str2double(get(handles.azimuthEdit,'string'));

AngVel(1) = get(handles.pitchSpinSlider,'Value');
AngVel(2) = get(handles.yawSpinSlider,'Value');
AngVel(3) = get(handles.rollingSpinSlider,'Value');

% if AngVel(1)==0
% AngVel(1)=0.0000001;
% end
% if AngVel(2)==0
% AngVel(2)=0.0000001;
% end
% if AngVel(3)==0
% AngVel(3)=0.0000001;
% end
TableSize = get(handles.tog,'Value');

solverFunction(x0,y0,z0,strikeVelocity,strikeAngle,AngVel,TableSize)
guidata(hObject,handles);


 
