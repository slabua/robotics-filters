function varargout = EKFSLAM05(varargin)
% EKFSLAM05 MATLAB code for EKFSLAM05.fig
%      EKFSLAM05, by itself, creates a new EKFSLAM05 or raises the existing
%      singleton*.
%
%      H = EKFSLAM05 returns the handle to a new EKFSLAM05 or the handle to
%      the existing singleton*.
%
%      EKFSLAM05('CALLBACK', hObject, eventData, handles, ...) calls the local
%      function named CALLBACK in EKFSLAM05.M with the given input arguments.
%
%      EKFSLAM05('Property', 'Value', ...) creates a new EKFSLAM05 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before EKFSLAM05_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to EKFSLAM05_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES
%
% -- 
% Salvatore La Bua (slabua@gmail.com)
% GLB
% MTM
% DICGIM - University of Palermo

% Edit the above text to modify the response to help EKFSLAM05

% Last Modified by GUIDE v2.5 16-Oct-2013 02:13:26

% Begin initialization code - DO NOT EDIT
    gui_Singleton = 1;
    gui_State = struct('gui_Name', mfilename, ...
                       'gui_Singleton', gui_Singleton, ...
                       'gui_OpeningFcn', @EKFSLAM05_OpeningFcn, ...
                       'gui_OutputFcn', @EKFSLAM05_OutputFcn, ...
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

% --- Executes just before EKFSLAM05 is made visible.
function EKFSLAM05_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to EKFSLAM05 (see VARARGIN)
    handles = initialize_gui(hObject, handles);
    % Choose default command line output for EKFSLAM05
    handles.output = hObject;

    % Update handles structure
    guidata(hObject, handles);

    % UIWAIT makes EKFSLAM05 wait for user response (see UIRESUME)
    % uiwait(handles.figure1);

% --- Outputs from this function are returned to the command line.
function varargout = EKFSLAM05_OutputFcn(hObject, eventdata, handles) 
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

% --- Executes on button press in Play.
function Play_Callback(hObject, eventdata, handles)
% hObject    handle to Play (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
    cla(handles.Plot, 'reset');
    %set(handles.Plot, 'Color', [0.3 0.3 0.3]);
    zoom off;
    pan off;
    set(handles.Default, 'Enable', 'OFF');
    disable_fields(hObject, handles);
    set_Legend(hObject, handles);

    [X0, Mu0, vl, freq, R, Q, lm_vis, Sigma0, LOOPS, landmarks, waypoints] = create_var(hObject, handles);
    Esercitazione5(X0, Mu0, vl, freq, R, Q, lm_vis, Sigma0, LOOPS, landmarks, waypoints, hObject, handles);

    set(handles.Default, 'Enable', 'ON');
    flag_default = get(handles.Default, 'Value');
    if (~flag_default)
        enable_fields(hObject, handles);
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

function loops_Callback(hObject, eventdata, handles)
% hObject    handle to loops (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject, 'String') returns contents of loops as text
%        str2double(get(hObject, 'String')) returns contents of loops as a double

% --- Executes during object creation, after setting all properties.
function loops_CreateFcn(hObject, eventdata, handles)
% hObject    handle to loops (see GCBO)
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
% hObject    handle to Sigma_std_Theta (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject, 'String') returns contents of Sigma_std_Theta as text
%        str2double(get(hObject, 'String')) returns contents of Sigma_std_Theta as a double

% --- Executes during object creation, after setting all properties.
function Sigma_std_Theta_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Sigma_std_Theta (see GCBO)
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

function landmarks_edit_Callback(hObject, eventdata, handles)
% hObject    handle to landmarks_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject, 'String') returns contents of landmarks_edit as text
%        str2double(get(hObject, 'String')) returns contents of landmarks_edit as a double

% --- Executes during object creation, after setting all properties.
function landmarks_edit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to landmarks_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
    if ispc && isequal(get(hObject, 'BackgroundColor'), get(0, 'defaultUicontrolBackgroundColor'))
        set(hObject, 'BackgroundColor', 'white');
    end

% --- Executes on button press in Open_landmarks.
function Open_landmarks_Callback(hObject, eventdata, handles)
% hObject    handle to Open_landmarks (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
    %[filename_land, pathname_land, filterindex_land] = uigetfile('*.mat', ...
    %    'Select file', 'MultiSelect', 'off');
    %%landmarks = load(filename_land);
    %filename_land = mat2cell(filename_land, 1);
    %filename_vet = cell2mat(filename_land(1));
    %lm_struct = uiimport([pathname_land filename_vet]);
    %landmarks = lm_struct.lm;
    %handles.landmarks = landmarks;
    %guidata(hObject, handles);
    [landmarks, filename] = OpenFile();
    handles.landmarks = landmarks;
    guidata(hObject, handles);
    set(handles.landmarks_edit, 'String', filename);

function waypoints_edit_Callback(hObject, eventdata, handles)
% hObject    handle to waypoints_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject, 'String') returns contents of waypoints_edit as text
%        str2double(get(hObject, 'String')) returns contents of waypoints_edit as a double

% --- Executes during object creation, after setting all properties.
function waypoints_edit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to waypoints_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
    if ispc && isequal(get(hObject, 'BackgroundColor'), get(0, 'defaultUicontrolBackgroundColor'))
        set(hObject, 'BackgroundColor', 'white');
    end

% --- Executes on button press in Open_waypoints.
function Open_waypoints_Callback(hObject, eventdata, handles)
% hObject    handle to Open_waypoints (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
    %[filename_waypoints, pathname_waypoints, filterindex_waypoints] = uigetfile('*.mat', ...
    %    'Select file', 'MultiSelect', 'off');
    %filename_waypoints = mat2cell(filename_waypoints, 1);
    %filename_vet2 = cell2mat(filename_waypoints(1));
    %waypoints_struct = uiimport([pathname_waypoints filename_vet2]);
    %waypoints_struct = load([pathname_waypoints filename_waypoints]);
    %waypoints = waypoints_struct.waypoints;
    %handles.waypoints = waypoints;
    %guidata(hObject, handles);
    [waypoints, filename] = OpenFile();
    handles.waypoints = waypoints;
    guidata(hObject, handles);
    set(handles.waypoints_edit, 'String', filename);

function [variable, filename] = OpenFile()
    [filename, pathname] = uigetfile('*.mat', ...
        'Select file', 'MultiSelect', 'off');
    if (isequal(filename, 0) || isequal(pathname, 0))
        %Operazione da eseguire se si e' premuto Cancel
        variable = 0;
        filename = 'Default';
    else
        structure = load([pathname, filename]);
        fieldname = fieldnames(structure);
        variable = getfield(structure, char(fieldname));
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

function X0_Theta_Callback(hObject, eventdata, handles)
% hObject    handle to X0_Theta (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject, 'String') returns contents of X0_Theta as text
%        str2double(get(hObject, 'String')) returns contents of X0_Theta as a double

% --- Executes during object creation, after setting all properties.
function X0_Theta_CreateFcn(hObject, eventdata, handles)
% hObject    handle to X0_Theta (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
    if ispc && isequal(get(hObject, 'BackgroundColor'), get(0, 'defaultUicontrolBackgroundColor'))
        set(hObject, 'BackgroundColor', 'white');
    end
    
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

function Mu0_Theta_Callback(hObject, eventdata, handles)
% hObject    handle to Mu0_Theta (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject, 'String') returns contents of Mu0_Theta as text
%        str2double(get(hObject, 'String')) returns contents of Mu0_Theta as a double

% --- Executes during object creation, after setting all properties.
function Mu0_Theta_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Mu0_Theta (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject, 'BackgroundColor'), get(0, 'defaultUicontrolBackgroundColor'))
    set(hObject, 'BackgroundColor', 'white');
end

function Sensor_range_Callback(hObject, eventdata, handles)
% hObject    handle to Sensor_range (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject, 'String') returns contents of Sensor_range as text
%        str2double(get(hObject, 'String')) returns contents of Sensor_range as a double

% --- Executes during object creation, after setting all properties.
function Sensor_range_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Sensor_range (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
    if ispc && isequal(get(hObject, 'BackgroundColor'), get(0, 'defaultUicontrolBackgroundColor'))
        set(hObject, 'BackgroundColor', 'white');
    end

function Control_noise_r_Callback(hObject, eventdata, handles)
% hObject    handle to Control_noise_r (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject, 'String') returns contents of Control_noise_r as text
%        str2double(get(hObject, 'String')) returns contents of Control_noise_r as a double

% --- Executes during object creation, after setting all properties.
function Control_noise_r_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Control_noise_r (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
    if ispc && isequal(get(hObject, 'BackgroundColor'), get(0, 'defaultUicontrolBackgroundColor'))
        set(hObject, 'BackgroundColor', 'white');
    end

function Control_noise_angle_Callback(hObject, eventdata, handles)
% hObject    handle to Control_noise_angle (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject, 'String') returns contents of Control_noise_angle as text
%        str2double(get(hObject, 'String')) returns contents of Control_noise_angle as a double

% --- Executes during object creation, after setting all properties.
function Control_noise_angle_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Control_noise_angle (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
    if ispc && isequal(get(hObject, 'BackgroundColor'), get(0, 'defaultUicontrolBackgroundColor'))
        set(hObject, 'BackgroundColor', 'white');
    end

function Sensor_noise_r_Callback(hObject, eventdata, handles)
% hObject    handle to Sensor_noise_r (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject, 'String') returns contents of Sensor_noise_r as text
%        str2double(get(hObject, 'String')) returns contents of Sensor_noise_r as a double

% --- Executes during object creation, after setting all properties.
function Sensor_noise_r_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Sensor_noise_r (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
    if ispc && isequal(get(hObject, 'BackgroundColor'), get(0, 'defaultUicontrolBackgroundColor'))
        set(hObject, 'BackgroundColor', 'white');
    end

function Sensor_noise_angle_Callback(hObject, eventdata, handles)
% hObject    handle to Sensor_noise_angle (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject, 'String') returns contents of Sensor_noise_angle as text
%        str2double(get(hObject, 'String')) returns contents of Sensor_noise_angle as a double

% --- Executes during object creation, after setting all properties.
function Sensor_noise_angle_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Sensor_noise_angle (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
    if ispc && isequal(get(hObject, 'BackgroundColor'), get(0, 'defaultUicontrolBackgroundColor'))
        set(hObject, 'BackgroundColor', 'white');
    end

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

function handles = initialize_gui(hObject, handles)
% If the metricdata field is present and the reset flag is false, it means
% we are we are just re-initializing a GUI by calling it from the cmd line
% while it is up. So, bail out as we dont want to reset the data.
    set(handles.Lin_v, 'Visible', 'OFF');
    set(handles.Linear_velocity, 'Visible', 'OFF');
    cla(handles.Plot, 'reset');
    %set(handles.Plot, 'Color', [0.3 0.3 0.3]);
    cla(handles.Legend, 'reset');
    %set(handles.Legend, 'Color', [0.3 0.3 0.3]);
    set(handles.Legend, 'Visible', 'OFF');
    set(handles.Legend, 'XTick', []);
    set(handles.Legend, 'YTick', []);
    set(handles.Default, 'Enable', 'ON');
    set(handles.Default, 'Value', 1);
    set_Default(hObject, handles);
    disable_fields(hObject, handles);

function set_Default(hObject, handles)
    %set(handles.Open_landmarks, 'Enable', 'OFF');
    set(handles.landmarks_edit, 'String', 'landmarks.mat');
    handles.landmarks = 0;
    guidata(hObject, handles);
    %set(handles.Open_waypoints, 'Enable', 'OFF');
    set(handles.waypoints_edit, 'String', 'waypoints.mat');
    handles.waypoints = 0;
    guidata(hObject, handles);
    set(handles.X0_X, 'String', 0);
    set(handles.X0_Y, 'String', 0);
    set(handles.X0_Theta, 'String', 0);
    set(handles.Mu0_X, 'String', 0);
    set(handles.Mu0_Y, 'String', 0);
    set(handles.Mu0_Theta, 'String', 0);
    %set(handles.Linear_velocity, 'String', 0.3);
    set(handles.Frequency, 'String', 10);
    set(handles.Control_noise_r, 'String', 0.03);
    set(handles.Control_noise_angle, 'String', 'pi/180');
    set(handles.Sensor_noise_r, 'String', 0.05);
    set(handles.Sensor_noise_angle, 'String', 'pi/180');
    set(handles.Sensor_range, 'String', 4);
    set(handles.Sigma_stdX, 'String', 0);
    set(handles.Sigma_stdY, 'String', 0);
    set(handles.Sigma_std_Theta, 'String', 0);
    set(handles.loops, 'String', 3);

function disable_fields(hObject, handles)
    set(handles.Open_landmarks, 'Enable', 'OFF');
    set(handles.landmarks_edit, 'Enable', 'OFF');
    set(handles.Open_waypoints, 'Enable', 'OFF');
    set(handles.waypoints_edit, 'Enable', 'OFF');
    set(handles.X0_X, 'Enable', 'OFF');
    set(handles.X0_Y, 'Enable', 'OFF');
    set(handles.X0_Theta, 'Enable', 'OFF');
    set(handles.Mu0_X, 'Enable', 'OFF');
    set(handles.Mu0_Y, 'Enable', 'OFF');
    set(handles.Mu0_Theta, 'Enable', 'OFF');
    %set(handles.Linear_velocity, 'Enable', 'OFF');
    set(handles.Frequency, 'Enable', 'OFF');
    set(handles.Control_noise_r, 'Enable', 'OFF');
    set(handles.Control_noise_angle, 'Enable', 'OFF');
    set(handles.Sensor_noise_r, 'Enable', 'OFF');
    set(handles.Sensor_noise_angle, 'Enable', 'OFF');
    set(handles.Sensor_range, 'Enable', 'OFF');
    set(handles.Sigma_stdX, 'Enable', 'OFF');
    set(handles.Sigma_stdY, 'Enable', 'OFF');
    set(handles.Sigma_std_Theta, 'Enable', 'OFF');
    set(handles.loops, 'Enable', 'OFF');

function enable_fields(hObject, handles)
    set(handles.Open_landmarks, 'Enable', 'ON');
    set(handles.landmarks_edit, 'Enable', 'ON');
    set(handles.Open_waypoints, 'Enable', 'ON');
    set(handles.waypoints_edit, 'Enable', 'ON');
    set(handles.X0_X, 'Enable', 'ON');
    set(handles.X0_Y, 'Enable', 'ON');
    set(handles.X0_Theta, 'Enable', 'ON');
    set(handles.Mu0_X, 'Enable', 'ON');
    set(handles.Mu0_Y, 'Enable', 'ON');
    set(handles.Mu0_Theta, 'Enable', 'ON');
    %set(handles.Linear_velocity, 'Enable', 'ON');
    set(handles.Frequency, 'Enable', 'ON');
    set(handles.Control_noise_r, 'Enable', 'ON');
    set(handles.Control_noise_angle, 'Enable', 'ON');
    set(handles.Sensor_noise_r, 'Enable', 'ON');
    set(handles.Sensor_noise_angle, 'Enable', 'ON');
    set(handles.Sensor_range, 'Enable', 'ON');
    set(handles.Sigma_stdX, 'Enable', 'ON');
    set(handles.Sigma_stdY, 'Enable', 'ON');
    set(handles.Sigma_std_Theta, 'Enable', 'ON');
    set(handles.loops, 'Enable', 'ON');

function set_Legend(hObject, handles)
    im = imread('legend5.png');
    set(handles.Legend, 'HandleVisibility', 'ON');
    axes(handles.Legend);
    image(im);
    set(handles.Legend, 'XTick', []);
    set(handles.Legend, 'YTick', []);

function [X0, Mu0, vl, freq, R, Q, lm_vis, Sigma0, LOOPS, landmarks, waypoints] = create_var(hObject, handles)
    X0_X = eval(get(handles.X0_X, 'String'));
    X0_Y = eval(get(handles.X0_Y, 'String'));
    X0_Theta = eval(get(handles.X0_Theta, 'String'));
    Mu0_X = eval(get(handles.Mu0_X, 'String'));
    Mu0_Y = eval(get(handles.Mu0_Y, 'String'));
    Mu0_Theta = eval(get(handles.Mu0_Theta, 'String'));
    Linear_velocity = eval(get(handles.Linear_velocity, 'String'));
    Frequency = eval(get(handles.Frequency, 'String'));
    Control_noise_r = eval(get(handles.Control_noise_r, 'String'));
    Control_noise_angle = eval(get(handles.Control_noise_angle, 'String'));
    Sensor_noise_r = eval(get(handles.Sensor_noise_r, 'String'));
    Sensor_noise_angle = eval(get(handles.Sensor_noise_angle, 'String'));
    Sensor_range = eval(get(handles.Sensor_range, 'String'));
    Sigma_stdX = eval(get(handles.Sigma_stdX, 'String'));
    Sigma_stdY = eval(get(handles.Sigma_stdY, 'String'));
    Sigma_std = eval(get(handles.Sigma_std_Theta, 'String'));
    loops = eval(get(handles.loops, 'String'));

    X0 = [X0_X; X0_Y; X0_Theta];
    Mu0 = [Mu0_X; Mu0_Y; Mu0_Theta];
    vl = Linear_velocity;
    freq = Frequency;
    if (Sensor_noise_r <= 1e-3)
        Sensor_noise_r = 1e-3;
    end
    if (Sensor_noise_angle <= 1e-3)
        Sensor_noise_angle = 1e-3;
    end
    R = [Control_noise_r, 0; 0, Control_noise_angle].^2;
    Q = [Sensor_noise_r, 0; 0, Sensor_noise_angle].^2;
    lm_vis = Sensor_range;
    Sigma0 = [Sigma_stdX, 0, 0; 0, Sigma_stdY, 0; 0, 0, Sigma_std];
    LOOPS = loops;

    if isfield(handles, 'landmarks')
        landmarks = handles.landmarks;
    else
        landmarks = 0;
    end
    if isfield(handles, 'waypoints')
        waypoints = handles.waypoints;
    else
        waypoints = 0;
    end

function Esercitazione5(X0, Mu0, vl, freq, R, Q, lm_vis, Sigma0, LOOPS, landmarks, waypoints, hObject, handles)
%Funzione per il calcolo della mappa e della localizzazione del robot
%Parametri IN:
%landmarks : vettore contenente le coordinate dei landmarks
%waypoints : vettore contenente le coordinate dei waypoints costituenti il percorso
% seguito dal robot
%lm_vis : parametro indicante il range sensoriale del robot

    global flag_stop;
    flag_stop = 0;
    axes(handles.Plot);

    % Inizializzazione Landmark e Boe
    if (~landmarks)
        landmarks = [-1:11, 1:2:9, 11*ones(1, 12), 9*ones(1, 4), -1:10, 1:2:7;
                     -ones(1, 13), ones(1, 5), 0:11, 3:2:9, 11*ones(1, 12), 9*ones(1, 4)];
    end
    if (~waypoints)
        waypoints = [0 10 10  0 0;
               0  0 10 10 0];
    end
    if (get(handles.Default, 'Value'))
        lm_vis = 4;
    end

    if (size(landmarks, 1) == 2)
        landmarks(3, :) = 1:size(landmarks, 2);
    end

    % Impostazione della finestra di visualizzazione
    MAXX = max([max(landmarks(1, :)) max(waypoints(1, :))]);
    MAXY = max([max(landmarks(2, :)) max(waypoints(2, :))]);
    MINX = min([min(landmarks(1, :)) min(waypoints(1, :))]);
    MINY = min([min(landmarks(2, :)) min(waypoints(2, :))]);
    lim_axis = [MINX-1 MAXX+1 MINY-1 MAXY+1];
    axis(lim_axis);
    x_step = (lim_axis(2)-lim_axis(1))/5;
    y_step = (lim_axis(4)-lim_axis(3))/5;
    set(handles.Plot, 'XTick', round(100*(lim_axis(1):x_step:lim_axis(2)))/100);
    set(handles.Plot, 'YTick', round(100*(lim_axis(3):y_step:lim_axis(4)))/100);

    map_factor = min(MAXX-MINX, MAXY-MINY);
    vl_factor = 30;
    %vl = map_factor / vl_factor;
    vl = 0.3;

    % Plot dei landmark e dei waypoints
    hold on;
    plot(landmarks(1, :), landmarks(2, :), 'ob');
    plot(waypoints(1, :), waypoints(2, :), 'b.--');

    % Inizializzazione dei parametri dello SLAM
    dt_period = 0;
    dt = 1/freq;
    theta = 0;
    
    % Inizializzazione dei parametri di visualizzazione
    sense_step = 2;
    draw_step = 10;
    draw_every = 2;

    % Costante booleana per il tracciamento del percorso del robot.
    % True -> linea | False -> punti
    DRAW_PATH = true;

    current_b = 0;
    at_boa_tol = 0.03;
    % max_dir = 120*pi/180;
    max_de_dir = 120*pi/180;

    Xk = X0;
    odom = X0;
    Muk = Mu0;
    Sigma_k = Sigma0;

    dir = theta;

    dim_robot = 0.1;

    seen_lm = zeros(1, size(landmarks, 2));

    % Inizializzazione del plot del robot, odometria, stime dei landmark, 
    %  covarianze del veicolo e covarianze dei landmark
    h2 = plot(0, 0, 'ro');
%     h3 = plot(0, 0, 'go');
    h4 = plot(0, 0, '+r');
    vcov = plot(0, 0, 'r');
    fcov = plot(0, 0, 'r');

    cov_gain = 1;
    loop = 1;
    i_draw = 1;
    skip_count = 0;
    accPath = [];

    % colors = [1:-0.2:0; 0:0.2:1]';
    % colors(:, 3) = 0;
    colors = [1 0 0; % r
              0 1 0; % g
              0 0 1; % b
              0 1 1; % c
              1 0 1; % m
              1 0.5 0]; % o

    while (loop <= LOOPS)
        i_draw = i_draw + 1;

        h2path = plot(0, 0, 'r'); % Plot del percorso del robot
        % h2path = plot(0, 0, '-', 'color', colors(1+mod(loop-1, size(colors, 1)), :)); % Plot del percorso del robot

        % Plot della stima del robot, percorso stimato del robot, odometria, 
        %  stima della posizione dei landmark, covarianza del robot e dei
        %  landmark
        if ((DRAW_PATH) && (~skip_count)), accPath = [accPath, Muk(1:2)]; end;
        skip_count = mod(skip_count+1, draw_every);

        if (~mod(i_draw, draw_step))
            if (DRAW_PATH)
                set(h2path, 'XData', accPath(1, :), 'YData', accPath(2, :));
            else
                set(h2path, 'XData', Muk(1), 'YData', Muk(2));
            end

            set(h2, 'XData', Muk(1), 'YData', Muk(2));
            % set(h3, 'XData', odom(1), 'YData', odom(2));
            set(h4, 'XData', Muk(4:2:length(Muk)-1), 'YData', Muk(5:2:length(Muk)));
            if (Sigma_k(1:2, 1:2) ~= zeros(2))
                pvcov = PlotEllipse(Muk(1:2), Sigma_k(1:2, 1:2), cov_gain);
                set(vcov, 'xdata', pvcov(1, :), 'ydata', pvcov(2, :));
            end
            if (length(Muk) > 3)
                pfcov = PlotEllipseLm(Muk, Sigma_k, cov_gain);
                set(fcov, 'xdata', pfcov(1, :), 'ydata', pfcov(2, :));
            end

            drawnow;

            if (flag_stop)
                return
            end

            if (DRAW_PATH), accPath = accPath(:, end); end;
        end

        % Calcolo della direzione verso la prossima boa
        next_b = waypoints(:, current_b + 1);
        dist_boa = sqrt((Xk(1:2)-next_b)' * (Xk(1:2)-next_b));
        if (dist_boa < at_boa_tol)
            if (current_b + 1 == size(waypoints, 2))
                current_b = 0;
                loop = loop + 1;
            else
                current_b = current_b + 1;
            end
        end
        de_dir = fixAngle(atan2(next_b(2)-Xk(2), next_b(1)-Xk(1)) - Xk(3) - dir);
        max_De = max_de_dir*dt;
        if (abs(de_dir) > max_De)
            de_dir = sign(de_dir)*max_De;
        end
        dir = dir + de_dir;

        % Applicazione del modello del moto al robot
        Xk(1:length(X0)) = motionModel(Xk(1:length(X0)), vl, dir, dim_robot, dt);

        % Aggiunta di rumore alla velocita' lineare e all'angolo di sterzata
        %  del robot
        vl_n = vl + randn(1)*sqrt(R(1, 1));
        dir_n = dir + randn(1)*sqrt(R(2, 2));

        % Fase di predizione
        deX = vl_n*dt * sin(dir_n+Muk(3));
        deY = vl_n*dt * cos(dir_n+Muk(3));
        Gt = [1 0 -deX; 0 1 deY; 0 0 1];
        Gu = [dt*cos(Muk(3)+dir_n) -deX;
              dt*sin(Muk(3)+dir_n)  deY;
              dt*sin(dir_n)/dim_robot vl_n*dt*cos(dir_n)/dim_robot];

        % Aggiornamento della matrice di covarianza
        Sigma_k(1:length(X0), 1:length(X0)) = Gt * Sigma_k(1:length(X0), 1:length(X0)) * Gt' + Gu*R*Gu';
        if (length(Sigma_k) > 3)
            Sigma_k(1:length(X0), length(X0)+1:end) = Gt * Sigma_k(1:length(X0), length(X0)+1:end);
            Sigma_k(length(X0)+1:end, 1:length(X0)) = Sigma_k(1:length(X0), length(X0)+1:end)';
        end

        % Applicazione del modello del moto alla stima del robot
        Muk(1:length(X0)) = motionModel(Muk, vl_n, dir_n, dim_robot, dt);

        % Applicazione del modello del moto all'odometria
        % odom = motionModel(odom, vl_n, dir_n, dim_robot, dt);

        dt_period = dt_period + dt;
        if (dt_period >= (sense_step*dt))
            dt_period = 0;

            % Calcolo delle distanze tra il robot e i landmark
            dist_lm = sqrt(sum((landmarks(1:2, :) - repmat(Xk(1:2, :), 1, size(landmarks, 2))).^2));
            id_vis = find(dist_lm < lm_vis);
            landmark_range = (landmarks(:, id_vis));
            dx = landmark_range(1, :) - Xk(1);
            dy = landmark_range(2, :) - Xk(2);
            z_lm = [dist_lm(id_vis); fixAngle(atan2(dy, dx)-Xk(3)); landmark_range(3, :)];
            z_lm_n = z_lm + randn(size(z_lm)).*repmat([sqrt(diag(Q)); 0], 1, size(z_lm, 2));

            % Associazione dei landmark compresi all'interno del range di
            %  visibilita'
            [z_old, z_new, seen_lm, idf] = landmark_associate(Mu0, Muk, z_lm_n, seen_lm);

            % Fase di aggiornamento
            len_z = size(z_old, 2);
            len_x = length(Muk);
            H = zeros(2*len_z, len_x);
            v = zeros(2*len_z, 1);
            QQ = zeros(2*len_z);

            for i = 1:len_z
                ii = 2*i + (-1:0);
                [z_h, H(ii, :)] = sensorModel(Mu0, Muk, idf(i));
                v(ii) = [z_old(1, i)-z_h(1);
                    fixAngle(z_old(2, i)-z_h(2))];
                QQ(ii, ii) = Q;
            end

            % Calcolo del guadagno di Kalman
            S = symmetric_m(H * (Sigma_k * H') + QQ);
            %K = (Sigma_k * H') * (inv(S));
            K = (Sigma_k * H') / S;
            Muk = Muk + K * v;
            I = eye(size(Sigma_k, 2));
            Sigma_k = (I - K * H) * Sigma_k;
            Sigma_k = symmetric_m(Sigma_k);

            % Incremento delle dimensioni matriciali di Muk e Sigma_k
            for i = 1 : size(z_new, 2)
                r = z_new(1, i);
                b = z_new(2, i);
                len = length(Muk);

                Muk = [Muk;
                       Muk(1) + r*cos(b+Muk(3));
                       Muk(2) + r*sin(b+Muk(3))];

                deX = r * sin(b+Muk(3));
                deY = r * cos(b+Muk(3));
                Gv = [1 0 -deX; 0 1 deY];
                Gz = [cos(Muk(3)+b) -deX;
                      sin(Muk(3)+b)  deY];

                rng = len+1:len+2;
                Sigma_k(rng, rng) = Gv*Sigma_k(1:3, 1:3)*Gv' + Gz*Q*Gz';
                Sigma_k(rng, 1:3) = Gv*Sigma_k(1:3, 1:3);
                Sigma_k(1:3, rng) = Sigma_k(rng, 1:3)';
                if (len > 3)
                    rnm = 4:len;
                    Sigma_k(rng, rnm) = Gv*Sigma_k(1:3, rnm);
                    Sigma_k(rnm, rng) = Sigma_k(rng, rnm)';
                end

            end 
        end 
    end

function S = symmetric_m(S)
% Funzione per mantenere la forma simmetrica di una matrice ed ovviare ad
%  eventuali errori di arrotondamento scaturiti dai calcoli
    S = (S+S')*0.5;

function el = PlotEllipse(x, P, nSigma)
% Funzione per il tracciamento di una singola ellisse di covarianza
    N = 8;
    step = 2*pi/N;
    if (all(diag(P)))
        [V, D] = eig(P);
        y = nSigma * [cos(0:step:2*pi); sin(0:step:2*pi)];
        el = V*sqrtm(D)*y;
        el = [el el(:, 1)] + repmat(x, 1, size(el, 2)+1);
        el(:, end) = NaN;
    end

function el = PlotEllipseLm(x, P, nSigma)
% Funzione per il tracciamento di una serie di ellissi di covarianza
    el = [];
    for lm_id = 1:(length(x) - 3)/2
        i = 2*lm_id - 1;
        xx = x(i+3:i+4);
        PP = P(i+3:i+4, i+3:i+4);
        el = [el PlotEllipse(xx, PP, nSigma)];
    end

function angle = fixAngle(angle)
%Funzione che corregge l'angolo riportandolo nell'intervallo (-180, +180)
%Parametri IN:
%angle : angolo da correggere
%Parametri OUT:
%fixed_angle : angolo corretto

    if angle > pi
        angle = angle - 2*pi;
    elseif angle < -pi
        angle = angle + 2*pi;
    end

function [z_old, z_new, seen_lm, idf] = landmark_associate(Mu0, Muk, z_lm_n, seen_lm)
%Funzione che associa ai landmark gia' visti i nuovi landmark presenti nel
%range di visibilita' del robot
%Parametri IN:
%Mu0 : stima della posizione iniziale
%Muk : vettore delle stime della posizione del robot e dei landmark visti
%z_lm_n : vettore delle distanze tra il robot e i landmark visti
%seen_lm : vettore che contiene i flag rappresentanti l'ordine dei landmark
%visti
%Parametri OUT:
%z_old : vettore che contiene le distanze dei landmark gia' associati 
%z_new : vettore che contiene le distanze dei landmark appena associati
%seen_lm : vettore aggiornato che contiene i flag rappresentanti l'ordine 
%dei landmark visti
%idf : indice aggiornato dei landmark gia' associati

    %Inizializzazione dei vettori delle misure e degli indici dei landmark
    z_old = []; z_new = [];
    idf = []; idn = [];

    for i = 1:size(z_lm_n, 2)
        j = z_lm_n(3, i);
        if (~seen_lm(j)) %nuovo landmark da associare
            z_new = [z_new z_lm_n(:, i)];
            idn = [idn j];
        else %landmark gia' associato
            z_old = [z_old z_lm_n(:, i)];
            idf = [idf seen_lm(j)];
        end
    end

    %contrassegna i landmark visti con il rispettivo ordine di avvistamento
    Nlm = (length(Muk) - length(Mu0)) / 2;
    seen_lm(idn) = Nlm + (1:size(z_new, 2));

function update = motionModel(current, vl, dir, dim_robot, dt)
%Funzione che applica il modello del moto al robot
%Parametri IN:
%current : posizione iniziale del robot
%vl : velocita' lineare
%dir : angolo di direzione del movimento del robot
%dim_robot : dimensione fisica del robot
%dt : periodo di campionamento
%Parametri OUT:
%update : posizione del robot aggiornata dopo l'applicazione del modello
%del moto

    update = [current(1) + dt*vl*cos(current(3)+dir);
              current(2) + dt*vl*sin(current(3)+dir);
              fixAngle(current(3) + dt*vl*sin(dir)/dim_robot)];

function [z_h, H] = sensorModel(Mu0, Muk, lm_id)
%Funzione che applica il modello delle misure tra il robot e i landmark
%Parametri IN:
%Mu0 : stima della posizione iniziale
%Muk : vettore delle stime della posizione del robot e dei landmark visti
%lm_id : vettore degli indici relativi ai landmark associati
%Parametri OUT:
%z_h : vettore che contiene la distanza predetta in coordinate polari
%H : Jacobiano

    %Inizializzazione dei parametri
    dim = length(Mu0);
    pos = dim + lm_id*2 - 1;
    H = zeros(2, length(Muk));

    muJ = Muk(pos:pos+1);
    delta = [muJ(1)-Muk(1); muJ(2)-Muk(2)];

    q = sqrt(delta.'*delta);
    angle = fixAngle(atan2(delta(2), delta(1)) - Muk(3));

    z_h = [q; angle];

    H(:, 1:dim) = [-(delta(1)/q), -(delta(2)/q), 0;
                    delta(2)/(q*q), -(delta(1)/(q*q)), -1];
    H(:, pos:pos+1) = [  delta(1)/q, delta(2)/q;
                       -(delta(2)/(q*q)), delta(1)/(q*q)];
