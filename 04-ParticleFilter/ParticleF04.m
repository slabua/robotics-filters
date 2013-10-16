function varargout = ParticleF04(varargin)
% PARTICLEF04 MATLAB code for ParticleF04.fig
%      PARTICLEF04, by itself, creates a new PARTICLEF04 or raises the existing
%      singleton*.
%
%      H = PARTICLEF04 returns the handle to a new PARTICLEF04 or the handle to
%      the existing singleton*.
%
%      PARTICLEF04('CALLBACK', hObject, eventData, handles, ...) calls the local
%      function named CALLBACK in PARTICLEF04.M with the given input arguments.
%
%      PARTICLEF04('Property', 'Value', ...) creates a new PARTICLEF04 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before ParticleF04_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to ParticleF04_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES
%
% -- 
% Salvatore La Bua (slabua@gmail.com)
% DICGIM - University of Palermo

% Edit the above text to modify the response to help ParticleF04

% Last Modified by GUIDE v2.5 16-Oct-2013 01:52:45

% Begin initialization code - DO NOT EDIT
    gui_Singleton = 1;
    gui_State = struct('gui_Name', mfilename, ...
                       'gui_Singleton', gui_Singleton, ...
                       'gui_OpeningFcn', @ParticleF04_OpeningFcn, ...
                       'gui_OutputFcn', @ParticleF04_OutputFcn, ...
                       'gui_LayoutFcn', [], ...
                       'gui_Callback', []);
    if nargin && ischar(varargin{1})
        gui_State.gui_Callback = str2func(varargin{1});
    end

    if nargout
        [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
    else
        gui_mainfcn(gui_State, varargin{:});
    end
    % End initialization code - DO NOT EDIT

% --- Executes just before ParticleF04 is made visible.
function ParticleF04_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to ParticleF04 (see VARARGIN)
    handles = initialize_gui(hObject, handles);
    % Choose default command line output for ParticleF04
    handles.output = hObject;

    % Update handles structure
    guidata(hObject, handles);

% UIWAIT makes ParticleF04 wait for user response (see UIRESUME)
% uiwait(handles.figure1);

% --- Outputs from this function are returned to the command line.
function varargout = ParticleF04_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
    varargout{1} = handles.output;

% --- Executes on button press in Default.
function Default_Callback(hObject, eventdata, handles)
% hObject    handle to Default (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
    flag_default = get(handles.Default, 'Value');
    if (flag_default)
        set_Default(hObject, handles);
        disable_fields(hObject, handles);
    else
        set_Default(hObject, handles);
        enable_fields(hObject, handles);
    end
    % Hint: get(hObject, 'Value') returns toggle state of Default

function Mu0_X_Callback(hObject, eventdata, handles)
% hObject    handle to Mu0_X (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject, 'String') returns contents of Mu0_X as text
%        str2double(get(hObject, 'String')) returns contents of Mu0_X as a double

% --- Executes during object creation, after setting all properties.
function Mu0_X_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Mu0_X (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
    if ispc && isequal(get(hObject, 'BackgroundColor'), get(0, 'defaultUicontrolBackgroundColor'))
        set(hObject, 'BackgroundColor', 'white');
    end

function Mu0_Y_Callback(hObject, eventdata, handles)
% hObject    handle to Mu0_Y (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject, 'String') returns contents of Mu0_Y as text
%        str2double(get(hObject, 'String')) returns contents of Mu0_Y as a double

% --- Executes during object creation, after setting all properties.
function Mu0_Y_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Mu0_Y (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
    if ispc && isequal(get(hObject, 'BackgroundColor'), get(0, 'defaultUicontrolBackgroundColor'))
        set(hObject, 'BackgroundColor', 'white');
    end

function X0_X_Callback(hObject, eventdata, handles)
% hObject    handle to X0_X (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject, 'String') returns contents of X0_X as text
%        str2double(get(hObject, 'String')) returns contents of X0_X as a double

% --- Executes during object creation, after setting all properties.
function X0_X_CreateFcn(hObject, eventdata, handles)
% hObject    handle to X0_X (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
    if ispc && isequal(get(hObject, 'BackgroundColor'), get(0, 'defaultUicontrolBackgroundColor'))
        set(hObject, 'BackgroundColor', 'white');
    end

function X0_Y_Callback(hObject, eventdata, handles)
% hObject    handle to X0_Y (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject, 'String') returns contents of X0_Y as text
%        str2double(get(hObject, 'String')) returns contents of X0_Y as a double

% --- Executes during object creation, after setting all properties.
function X0_Y_CreateFcn(hObject, eventdata, handles)
% hObject    handle to X0_Y (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
    if ispc && isequal(get(hObject, 'BackgroundColor'), get(0, 'defaultUicontrolBackgroundColor'))
        set(hObject, 'BackgroundColor', 'white');
    end

function Direction_Callback(hObject, eventdata, handles)
% hObject    handle to Direction (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject, 'String') returns contents of Direction as text
%        str2double(get(hObject, 'String')) returns contents of Direction as a double

% --- Executes during object creation, after setting all properties.
function Direction_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Direction (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
    if ispc && isequal(get(hObject, 'BackgroundColor'), get(0, 'defaultUicontrolBackgroundColor'))
        set(hObject, 'BackgroundColor', 'white');
    end

function Control_noise_Callback(hObject, eventdata, handles)
% hObject    handle to Control_noise (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject, 'String') returns contents of Control_noise as text
%        str2double(get(hObject, 'String')) returns contents of Control_noise as a double

% --- Executes during object creation, after setting all properties.
function Control_noise_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Control_noise (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
    if ispc && isequal(get(hObject, 'BackgroundColor'), get(0, 'defaultUicontrolBackgroundColor'))
        set(hObject, 'BackgroundColor', 'white');
    end

function Sensor_noise_Callback(hObject, eventdata, handles)
% hObject    handle to Sensor_noise (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject, 'String') returns contents of Sensor_noise as text
%        str2double(get(hObject, 'String')) returns contents of Sensor_noise as a double

% --- Executes during object creation, after setting all properties.
function Sensor_noise_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Sensor_noise (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
    if ispc && isequal(get(hObject, 'BackgroundColor'), get(0, 'defaultUicontrolBackgroundColor'))
        set(hObject, 'BackgroundColor', 'white');
    end

function Sigma_stdX_Callback(hObject, eventdata, handles)
% hObject    handle to Sigma_stdX (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject, 'String') returns contents of Sigma_stdX as text
%        str2double(get(hObject, 'String')) returns contents of Sigma_stdX as a double

% --- Executes during object creation, after setting all properties.
function Sigma_stdX_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Sigma_stdX (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
    if ispc && isequal(get(hObject, 'BackgroundColor'), get(0, 'defaultUicontrolBackgroundColor'))
        set(hObject, 'BackgroundColor', 'white');
    end

function Sigma_stdY_Callback(hObject, eventdata, handles)
% hObject    handle to Sigma_stdY (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject, 'String') returns contents of Sigma_stdY as text
%        str2double(get(hObject, 'String')) returns contents of Sigma_stdY as a double

% --- Executes during object creation, after setting all properties.
function Sigma_stdY_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Sigma_stdY (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
    if ispc && isequal(get(hObject, 'BackgroundColor'), get(0, 'defaultUicontrolBackgroundColor'))
        set(hObject, 'BackgroundColor', 'white');
    end

function Sigma_std_Theta_Callback(hObject, eventdata, handles)
% hObject    handle to Sigma_stdY (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject, 'String') returns contents of Sigma_stdY as text
%        str2double(get(hObject, 'String')) returns contents of Sigma_stdY as a double

% --- Executes during object creation, after setting all properties.
function Sigma_std_Theta_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Sigma_stdY (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
    if ispc && isequal(get(hObject, 'BackgroundColor'), get(0, 'defaultUicontrolBackgroundColor'))
        set(hObject, 'BackgroundColor', 'white');
    end

function Linear_velocity_Callback(hObject, eventdata, handles)
% hObject    handle to Linear_velocity (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject, 'String') returns contents of Linear_velocity as text
%        str2double(get(hObject, 'String')) returns contents of Linear_velocity as a double

% --- Executes during object creation, after setting all properties.
function Linear_velocity_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Linear_velocity (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
    if ispc && isequal(get(hObject, 'BackgroundColor'), get(0, 'defaultUicontrolBackgroundColor'))
        set(hObject, 'BackgroundColor', 'white');
    end

function Frequency_Callback(hObject, eventdata, handles)
% hObject    handle to Frequency (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject, 'String') returns contents of Frequency as text
%        str2double(get(hObject, 'String')) returns contents of Frequency as a double

% --- Executes during object creation, after setting all properties.
function Frequency_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Frequency (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
    if ispc && isequal(get(hObject, 'BackgroundColor'), get(0, 'defaultUicontrolBackgroundColor'))
        set(hObject, 'BackgroundColor', 'white');
    end

% --- Executes on button press in Play.
function Play_Callback(hObject, eventdata, handles)
% hObject    handle to Play (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
    cla(handles.Plot, 'reset');
    set(handles.Plot, 'Color', [0.3 0.3 0.3]);
    zoom off;
    pan off;
    set(handles.Default, 'Enable', 'OFF');
    disable_fields(hObject, handles);
    set_Legend(hObject, handles);

    [campioni, g_std, NL, r, q, Sigma0, vl, theta, freq, iter] = create_var(hObject, handles);
    Esercitazione4(campioni, g_std, NL, r, q, Sigma0, vl, theta, freq, iter, hObject, handles);

    set(handles.Default, 'Enable', 'ON');
    flag_default = get(handles.Default, 'Value');
    if (~flag_default)
        enable_fields(hObject, handles);
    end

function set_Legend(hObject, handles)
    im = imread('legend4.png');
    set(handles.Legend, 'HandleVisibility', 'ON');
    axes(handles.Legend);
    image(im);
    set(handles.Legend, 'XTick', []);
    set(handles.Legend, 'YTick', []);

function steps_Callback(hObject, eventdata, handles)
% hObject    handle to steps (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject, 'String') returns contents of steps as text
%        str2double(get(hObject, 'String')) returns contents of steps as a double

% --- Executes during object creation, after setting all properties.
function steps_CreateFcn(hObject, eventdata, handles)
% hObject    handle to steps (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
    if ispc && isequal(get(hObject, 'BackgroundColor'), get(0, 'defaultUicontrolBackgroundColor'))
        set(hObject, 'BackgroundColor', 'white');
    end

% --- Executes on button press in Stop.
function Stop_Callback(hObject, eventdata, handles)
% hObject    handle to Stop (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
    global flag_stop;
    flag_stop = 1;
    set(handles.Default, 'Enable', 'ON');
    flag_default = get(handles.Default, 'Value');
    if (~flag_default)
        enable_fields(hObject, handles);
    end

% --- Executes on button press in Reset.
function Reset_Callback(hObject, eventdata, handles)
% hObject    handle to Reset (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
    Stop_Callback(hObject, eventdata, handles);
    zoom off;
    pan off;
    h = initialize_gui(hObject, handles);
    set(handles.Legend, 'XTick', []);
    set(handles.Legend, 'YTick', []);

% --- Executes on button press in Zoom.
function Zoom_Callback(hObject, eventdata, handles)
% hObject    handle to Zoom (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
    zoom on;

% --- Executes on button press in Pan.
function Pan_Callback(hObject, eventdata, handles)
% hObject    handle to Pan (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
    pan on;

function NL_min_Callback(hObject, eventdata, handles)
% hObject    handle to NL_min (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject, 'String') returns contents of NL_min as text
%        str2double(get(hObject, 'String')) returns contents of NL_min as a double

% --- Executes during object creation, after setting all properties.
function NL_min_CreateFcn(hObject, eventdata, handles)
% hObject    handle to NL_min (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
    if ispc && isequal(get(hObject, 'BackgroundColor'), get(0, 'defaultUicontrolBackgroundColor'))
        set(hObject, 'BackgroundColor', 'white');
    end

function NL_fixed_Callback(hObject, eventdata, handles)
% hObject    handle to NL_fixed (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject, 'String') returns contents of NL_fixed as text
%        str2double(get(hObject, 'String')) returns contents of NL_fixed as a double

% --- Executes during object creation, after setting all properties.
function NL_fixed_CreateFcn(hObject, eventdata, handles)
% hObject    handle to NL_fixed (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
    if ispc && isequal(get(hObject, 'BackgroundColor'), get(0, 'defaultUicontrolBackgroundColor'))
        set(hObject, 'BackgroundColor', 'white');
    end

function NL_max_Callback(hObject, eventdata, handles)
% hObject    handle to NL_max (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject, 'String') returns contents of NL_max as text
%        str2double(get(hObject, 'String')) returns contents of NL_max as a double

% --- Executes during object creation, after setting all properties.
function NL_max_CreateFcn(hObject, eventdata, handles)
% hObject    handle to NL_max (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
    if ispc && isequal(get(hObject, 'BackgroundColor'), get(0, 'defaultUicontrolBackgroundColor'))
        set(hObject, 'BackgroundColor', 'white');
    end

function N_Samples_Callback(hObject, eventdata, handles)
% hObject    handle to N_Samples (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject, 'String') returns contents of N_Samples as text
%        str2double(get(hObject, 'String')) returns contents of N_Samples as a double

% --- Executes during object creation, after setting all properties.
function N_Samples_CreateFcn(hObject, eventdata, handles)
% hObject    handle to N_Samples (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
    if ispc && isequal(get(hObject, 'BackgroundColor'), get(0, 'defaultUicontrolBackgroundColor'))
        set(hObject, 'BackgroundColor', 'white');
    end

function Gaussian_std_Callback(hObject, eventdata, handles)
% hObject    handle to Gaussian_std (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject, 'String') returns contents of Gaussian_std as text
%        str2double(get(hObject, 'String')) returns contents of Gaussian_std as a double

% --- Executes during object creation, after setting all properties.
function Gaussian_std_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Gaussian_std (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
    if ispc && isequal(get(hObject, 'BackgroundColor'), get(0, 'defaultUicontrolBackgroundColor'))
        set(hObject, 'BackgroundColor', 'white');
    end

function handles = initialize_gui(hObject, handles)
% If the metricdata field is present and the reset flag is false, it means
% we are we are just re-initializing a GUI by calling it from the cmd line
% while it is up. So, bail out as we dont want to reset the data.
    set(handles.Sigma_std_Theta, 'Visible', 'OFF');
    cla(handles.Plot, 'reset');
    set(handles.Plot, 'Color', [0.3 0.3 0.3]);
    cla(handles.Legend, 'reset');
    set(handles.Legend, 'Color', [0.3 0.3 0.3]);
    set(handles.Legend, 'Visible', 'OFF');
    set(handles.Legend, 'XTick', []);
    set(handles.Legend, 'YTick', []);
    set(handles.Default, 'Enable', 'ON');
    set(handles.Default, 'Value', 1);
    set_Default(hObject, handles);
    disable_fields(hObject, handles);

function set_Default(hObject, handles)
    set(handles.N_Samples, 'String', 1500);
    set(handles.Uniform, 'Value', 1);
    set(handles.Gaussian, 'Value', 0);
    set(handles.Gaussian_std, 'String', 10);
    set(handles.Fixed, 'Value', 1);
    set(handles.Between, 'Value', 0);
    set(handles.NL_fixed, 'String', 20);
    set(handles.NL_min, 'String', 20);
    set(handles.NL_max, 'String', 40);
    set(handles.Control_noise, 'String', 0.1);
    set(handles.Sensor_noise, 'String', 5);
    set(handles.Sigma_stdX, 'String', 100);
    set(handles.Sigma_stdY, 'String', 100);
    set(handles.Sigma_std_Theta, 'String', 0.76);
    set(handles.Linear_velocity, 'String', 4.5);
    set(handles.Direction, 'String', -0.52);
    set(handles.Frequency, 'String', 50);
    set(handles.steps, 'String', 500);

function disable_fields(hObject, handles)
    set(handles.N_Samples, 'Enable', 'OFF');
    set(handles.Uniform, 'Enable', 'OFF');
    set(handles.Gaussian, 'Enable', 'OFF');
    set(handles.Gaussian_std, 'Enable', 'OFF');
    set(handles.Fixed, 'Enable', 'OFF');
    set(handles.Between, 'Enable', 'OFF');
    set(handles.NL_fixed, 'Enable', 'OFF');
    set(handles.NL_min, 'Enable', 'OFF');
    set(handles.NL_max, 'Enable', 'OFF');
    set(handles.Control_noise, 'Enable', 'OFF');
    set(handles.Sensor_noise, 'Enable', 'OFF');
    set(handles.Sigma_stdX, 'Enable', 'OFF');
    set(handles.Sigma_stdY, 'Enable', 'OFF');
    set(handles.Sigma_std_Theta, 'Enable', 'OFF');
    set(handles.Linear_velocity, 'Enable', 'OFF');
    set(handles.Direction, 'Enable', 'OFF');
    set(handles.Frequency, 'Enable', 'OFF');
    set(handles.steps, 'Enable', 'OFF');

function enable_fields(hObject, handles)
    set(handles.N_Samples, 'Enable', 'ON');
    set(handles.Uniform, 'Enable', 'ON');
    set(handles.Gaussian, 'Enable', 'ON');
    set(handles.Gaussian_std, 'Enable', 'ON');
    set(handles.Fixed, 'Enable', 'ON');
    set(handles.Between, 'Enable', 'ON');
    set(handles.NL_fixed, 'Enable', 'ON');
    set(handles.NL_min, 'Enable', 'ON');
    set(handles.NL_max, 'Enable', 'ON');
    set(handles.Control_noise, 'Enable', 'ON');
    set(handles.Sensor_noise, 'Enable', 'ON');
    set(handles.Sigma_stdX, 'Enable', 'ON');
    set(handles.Sigma_stdY, 'Enable', 'ON');
    set(handles.Sigma_std_Theta, 'Enable', 'ON');
    set(handles.Linear_velocity, 'Enable', 'ON');
    set(handles.Direction, 'Enable', 'ON');
    set(handles.Frequency, 'Enable', 'ON');
    set(handles.steps, 'Enable', 'ON');

function [campioni, g_std, NL, r, q, Sigma0, vl, theta, freq, iter] = create_var(hObject, handles)
    N_Samples = eval(get(handles.N_Samples, 'String'));
    Gaussian_std = eval(get(handles.Gaussian_std, 'String'));
    NL_fixed = eval(get(handles.NL_fixed, 'String'));
    NL_min = eval(get(handles.NL_min, 'String'));
    NL_max = eval(get(handles.NL_max, 'String'));
    Control_noise = eval(get(handles.Control_noise, 'String'));
    Sensor_noise = eval(get(handles.Sensor_noise, 'String'));
    Sigma_stdX = eval(get(handles.Sigma_stdX, 'String'));
    Sigma_stdY = eval(get(handles.Sigma_stdY, 'String'));
    Sigma_std = eval(get(handles.Sigma_std_Theta, 'String'));
    Linear_velocity = eval(get(handles.Linear_velocity, 'String'));
    Direction = eval(get(handles.Direction, 'String'));
    Frequency = eval(get(handles.Frequency, 'String'));
    steps = eval(get(handles.steps, 'String'));

    campioni = N_Samples;
    g_std = Gaussian_std;
    if (get(handles.Fixed, 'Value'))
        NL = NL_fixed;
    else
        NL = randi(NL_max-NL_min+1) + (NL_min-1);
    end
    r = Control_noise;
    q = Sensor_noise^2;
    Sigma0 = [Sigma_stdX, 0; 0, Sigma_stdY];
    vl = Linear_velocity;
    theta = Direction;
    freq = Frequency;
    iter = steps;

function Esercitazione4(campioni, g_std, NL, r, q, Sigma0, vl, theta, freq, iter, hObject, handles)
%La Funzione implementa il Filtro Particellare

    global flag_stop;
    flag_stop = 0;
    axes(handles.Plot);

    dt = 1/freq; %Periodo di campionamento
    delta_s = [cos(theta)*vl*dt sin(theta)*vl*dt]; %Spostamento

    global map_dim;
    map_dim = [100 100];
    X0 = map_dim / 2; %Posizione iniziale del robot

    L = zeros(NL, 2);

    misura = zeros(NL, 1);
    %Generazione dei landmark
    for i = 1 : NL
        L(i, 1) = map_dim(1)*rand;
        L(i, 2) = map_dim(2)*rand;
    end

    S = zeros(campioni, 2);
    global perc_uniform_samples;
    %Percentuale di campioni uniformemente distribuiti (kidnapped robot problem)
    perc_uniform_samples = 5;
    %Generazione delle particelle
    for i = 1 : campioni
        if (get(handles.Uniform, 'Value'))
            S(i, 1) = map_dim(1)*rand; %distribuzione di particelle uniforme
            S(i, 2) = map_dim(2)*rand; %distribuzione di particelle uniforme
        else
            S(i, 1) = X0(1)+g_std*randn(1); %distribuzione di particelle gaussiana
            S(i, 2) = X0(2)+g_std*randn(1); %centrata su X0 e deviazione standard g_std
        end
    end

    % Plot dei landmark e delle particelle iniziali
    hold on;
    set(gca, 'Color', [0.3 0.3 0.3]);
    plot(L(:, 1), L(:, 2), 'oc', 'markersize', 5);
    plot(L(:, 1), L(:, 2), 'oc', 'markersize', 5);
    plot(S(:, 1), S(:, 2), 'xr', 'markersize', 5);
    hold off;
    pause(2);

    %Inizializzazione dell'algoritmo
    Xk = X0;
    S_new = S;
    matrix_xk = [];

    for i = 1 : iter

        R = (0+sqrt(r).*randn(1)); %Generazione del rumore sul controllo

        %Applicazione del modello del moto
        Xk = motion_model(Xk, delta_s); %Posizione reale con eventuale aggiunta di rumore
        [S_new, index, index_corr] = particle_filter(Xk+R, S_new, L, delta_s, Sigma0, r, q); %Nuovo insieme di particelle

        %Plot dei parametri
        if ~mod(i, 10) %Aggiorno il grafico ogni 10 passi
            matrix_xk = [matrix_xk; Xk];
            plot(L(:, 1), L(:, 2), 'oc', 'markersize', 5); %Plot dei landmark
        	hold on;
        	set(gca, 'Color', [0.3 0.3 0.3]);
            plot(S_new(:, 1), S_new(:, 2), 'xr'); %Plot delle particelle
            plot(Xk(1), Xk(2), 'ok', 'markersize', 7, 'MarkerFaceColor', 'k'); %Plot della posizione reale del robot
            plot(matrix_xk(:, 1), matrix_xk(:, 2), 'r.-');
            plot([Xk(1), L(index, 1)], [Xk(2), L(index, 2)], 'g.-');
            plot([Xk(1), L(index_corr, 1)], [Xk(2), L(index_corr, 2)], 'y.-');
            pause(1/2);
            hold off
            if (flag_stop)
                return
            end
        end

    end

function S_pred_new = darwin_law(Sigma0, S_pred, pesi)
%Funzione che effettua un campionamento per importanza delle particelle rispetto ai loro pesi
%Parametri IN:
%Sigma0 : matrice di covarianza
%S_pred : stima delle particelle
%pesi : vettore dei pesi delle particelle
%Parametri OUT:
%S_pred_new : nuova stima delle particelle

    n = 1; %percentuale di particelle da campionare
    campioni = size(S_pred, 1);
    perc_sample = n*(floor(campioni/100))+1;

    R = chol(Sigma0);

    %Campionamento per importanza delle particelle con peso minore
    for i = 1 : perc_sample
        [c, j] = min(pesi);
        pesi(j) = 1;
        S_pred(j, :) = repmat(mean(S_pred), 1, 1)+ randn(1, 2)*R;
    end

    S_pred_new = S_pred;

function X_new = motion_model(X, delta_s)
%Applicazione del modello del moto
%Parametri IN:
%X : posizione del robot
%delta_s : spostamento del robot
%Parametri OUT:
%X_new : nuova posizione del robot

    X_new = X + ones(size(X(:, 1)))*delta_s;
%     X_new = X + ones(size(X(:, 1)))*delta_s + (sqrt(0).*randn(size(X)));

function [S_new, index, index_corr] = particle_filter(Xk, S, L, delta_s, Sigma0, r, q)
%Filtro particellare
%Parametri IN:
%Xk : posizione reale del robot
%S : insieme delle particelle
%L : insieme dei landmark
%delta_s : vettore spostamento
%Sigma0 : matrice di covarianza
%q : incertezza sulla misura
%Parametri OUT:
%S_new : insieme delle particelle ricampionate

    %Applicazione del modello del moto alle particelle
%     S_pred = motion_model(S, delta_s);
    S_pred = motion_model(S, delta_s) + (sqrt(r).*randn(size(S)));

    %Applicazione del modello della misura alle particelle
    [pesi, index, index_corr] = sensor_model(S_pred, Xk, L, q);

%     %Fase di campionamento
%     S_pred_new = darwin_law(Sigma0, S_pred, pesi);
% 
%     %Applicazione del modello della misura alle particelle campionate
%     pesi_new = sensor_model(S_pred_new, Xk, L, q);
% 
%     %Fase di ricampionamento
%     S_new = resampling(S_pred_new, pesi_new);

    S_new = wheel_resample(S_pred, pesi);

function S_resample = resampling(S, pesi)
%Funzione che effettua un ricampionamento delle particelle
%Parametri IN:
%S : insieme delle particelle
%pesi : pesi delle particelle
%Parametri OUT:
%S_resample : insieme delle particelle campionate

    [n, m] = size(S);
    soglia = 0.00000001;

    S_resample = zeros(n, m);

    C = zeros(n, 1);

    C = cumsum(pesi); %Somma cumulativa

    i = 1;

    %Metodo Montecarlo per il ricampionamento
    for j = 1:n
        u = j/n;
        while u-C(i)>soglia %Per evitare errori dovuti agli arrotondamenti
            i = i+1;
        end

        S_resample(j, :) = S(i, :);
    end

function [pesi, index, index_corr] = sensor_model(S, X, L, q)
%La funzione applica il modello della misura
%Parametri IN:
%S : insieme delle particelle
%X : posizione del robot
%L : insieme dei landmark
%q : incertezza sulla misura
%Parametri OUT:
%[pesi index] : vettore dei pesi delle particelle

    NL = size(L, 1); %Numero dei landmark
    campioni = size(S, 1); %Numero delle particelle

    misura = zeros(NL, 1);

    %Calcolo delle distanze tra il robot e tutti i landmark con aggiunta del
    %rumore
    for i = 1 : NL

        misura_corr(i) = 2*sqrt((X-L(i, :))*(X-L(i, :))');
        misura(i) = misura_corr(i) + sqrt(q)*randn(1)/2;
                
    end

    [mis_min, index] = min(misura); %Calcolo del landmark stimato piu' vicino
    [mis_min, index_corr] = min(misura_corr); %Calcolo del landmark piu' vicino

    distanza = zeros(campioni, 1);

    %Calcolo della distanza tra i landmark e le particelle e dell'errore
    %commesso
    for i = 1 : campioni
        distanza(i) = sqrt((L(index, :)-S(i, :))*(L(index, :)-S(i, :))');
        errore(i) = abs(mis_min-distanza(i));
    end

    pesi_errori = 1./errore; %Calcolo dei pesi delle particelle
    pesi = pesi_errori./sum(pesi_errori); %Normalizzazione dei pesi

function S_resample = wheel_resample(S, pesi)
%Funzione che implementa il ricampionamento secondo il metodo della
%roulette, simile al sistematic resampling
%Parametri IN:
%S : insieme di particelle da ricampionare
%pesi : pesi delle particelle da ricampionare
%Parametri OUT:
%S_resample : insieme delle particelle ricampionate

    S_resample = [];
    N = length(pesi);
    
    global perc_uniform_samples;
    excluded = round(N / 100 * perc_uniform_samples);
    
    index = randi(N);
    beta = 0;
    mw = max(pesi);

    for i = 1 : N - excluded
        beta = beta + rand()*2*mw;

        while (beta > pesi(index))
            beta = beta - pesi(index);
            index = index+1;
            if (index > N), index = 1; end;
        end

        S_resample = [S_resample; S(index, :)];
        % S_resample = [S_resample; S(index, :)+(randn(1,2))*0.5];

    end

    global map_dim;
    S_unif = generate_uniform_samples(excluded, map_dim);
    S_resample = [S_resample; S_unif];

function S = generate_uniform_samples(perc_samples, map_dim)
%La funzione genera una percentuale di particelle uniformemente distribuite
%per favorire la convergenza dell'algoritmo in caso di robot rapito
%Parametri IN:
%perc_samples : percentuale di particelle uniformemente distribuite
%map_dim : dominio di generazione
%Parametri OUT:
%S : insieme di particelle generate
    for i = 1 : perc_samples
        S(i, 1) = map_dim(1)*rand; %distribuzione di particelle uniforme
        S(i, 2) = map_dim(2)*rand; %distribuzione di particelle uniforme
    end
