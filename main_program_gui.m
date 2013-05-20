function varargout = main_program_gui(varargin)
% MAIN_PROGRAM_GUI MATLAB code for main_program_gui.fig
%      MAIN_PROGRAM_GUI, by itself, creates a new MAIN_PROGRAM_GUI or raises the existing
%      singleton*.
%
%      H = MAIN_PROGRAM_GUI returns the handle to a new MAIN_PROGRAM_GUI or the handle to
%      the existing singleton*.
%
%      MAIN_PROGRAM_GUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in MAIN_PROGRAM_GUI.M with the given input arguments.
%
%      MAIN_PROGRAM_GUI('Property','Value',...) creates a new MAIN_PROGRAM_GUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before main_program_gui_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to main_program_gui_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help main_program_gui

% Last Modified by GUIDE v2.5 07-May-2013 15:59:46

% Begin initialization code - DO NOT EDIT
global loadedfile;
global processedaudio;
global player;



gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @main_program_gui_OpeningFcn, ...
                   'gui_OutputFcn',  @main_program_gui_OutputFcn, ...
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


% --- Executes just before main_program_gui is made visible.
function main_program_gui_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to main_program_gui (see VARARGIN)

% Choose default command line output for main_program_gui
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes main_program_gui wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = main_program_gui_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on slider movement.
function slider1_Callback(hObject, eventdata, handles)
% hObject    handle to main_program_gui (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider

set(handles.ProcessedIndicator,'String','Gain Changed! Push Process');
set(handles.ProcessedIndicator,'ForegroundColor',[1 1 0]);
val=get(hObject, 'Value');
valstring=strcat(num2str(val),' dB');
set(handles.level1, 'String', valstring);
guidata(hObject,handles);

% --- Executes during object creation, after setting all properties.
function slider1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to main_program_gui (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on button press in load_button.
function load_button_Callback(hObject, eventdata, handles)
global loadedfile;
% hObject    handle to load_button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[file,path]=uigetfile('.wav', 'Choose a WAV file');
loadedfile=fullfile(path,file);
if (loadedfile~=0)
    set(handles.ProcessedIndicator,'String','File Not Processed');
    set(handles.ProcessedIndicator,'ForegroundColor',[1 0 0]);
    set(handles.ProcessedIndicator,'Visible','on');
    set(handles.FileIndicator,'String',loadedfile);
    set(handles.SavedIndicator,'Visible','on');
end
guidata(hObject,handles);

% --- Executes on slider movement.
function slider3_Callback(hObject, eventdata, handles)
% hObject    handle to slider3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
set(handles.ProcessedIndicator,'String','Gain Changed! Push Process');
set(handles.ProcessedIndicator,'ForegroundColor',[1 1 0]);
val=get(hObject, 'Value');
valstring=strcat(num2str(val),' dB');
set(handles.level3, 'String', valstring);
guidata(hObject,handles);

% --- Executes during object creation, after setting all properties.
function slider3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function slider4_Callback(hObject, eventdata, handles)
% hObject    handle to slider4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
set(handles.ProcessedIndicator,'String','Gain Changed! Push Process');
set(handles.ProcessedIndicator,'ForegroundColor',[1 1 0]);
val=get(hObject, 'Value');
valstring=strcat(num2str(val),' dB');
set(handles.level4, 'String', valstring);
guidata(hObject,handles);

% --- Executes during object creation, after setting all properties.
function slider4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function slider5_Callback(hObject, eventdata, handles)
% hObject    handle to slider5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
set(handles.ProcessedIndicator,'String','Gain Changed! Push Process');
set(handles.ProcessedIndicator,'ForegroundColor',[1 1 0]);
val=get(hObject, 'Value');
valstring=strcat(num2str(val),' dB');
set(handles.level5, 'String', valstring);
guidata(hObject,handles);

% --- Executes during object creation, after setting all properties.
function slider5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function slider6_Callback(hObject, eventdata, handles)
% hObject    handle to slider6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
set(handles.ProcessedIndicator,'String','Gain Changed! Push Process');
set(handles.ProcessedIndicator,'ForegroundColor',[1 1 0]);
val=get(hObject, 'Value');
valstring=strcat(num2str(val),' dB');
set(handles.level6, 'String', valstring);
guidata(hObject,handles);

% --- Executes during object creation, after setting all properties.
function slider6_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function slider7_Callback(hObject, eventdata, handles)
% hObject    handle to slider7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
set(handles.ProcessedIndicator,'String','Gain Changed! Push Process');
set(handles.ProcessedIndicator,'ForegroundColor',[1 1 0]);
val=get(hObject, 'Value');
valstring=strcat(num2str(val),' dB');
set(handles.level7, 'String', valstring);
guidata(hObject,handles);

% --- Executes during object creation, after setting all properties.
function slider7_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function slider8_Callback(hObject, eventdata, handles)
% hObject    handle to slider8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
set(handles.ProcessedIndicator,'String','Gain Changed! Push Process');
set(handles.ProcessedIndicator,'ForegroundColor',[1 1 0]);
val=get(hObject, 'Value');
valstring=strcat(num2str(val),' dB');
set(handles.level8, 'String', valstring);
guidata(hObject,handles);

% --- Executes during object creation, after setting all properties.
function slider8_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on button press in process_button.
function process_button_Callback(hObject, eventdata, handles)
% hObject    handle to process_button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global loadedfile;
global processedaudio;

gain1=get(handles.slider1, 'Value');
gain2=get(handles.slider2, 'Value');
gain3=get(handles.slider3, 'Value');
gain4=get(handles.slider4, 'Value');
gain5=get(handles.slider5, 'Value');
gain6=get(handles.slider6, 'Value');
gain7=get(handles.slider7, 'Value');
gain8=get(handles.slider8, 'Value');
gains=[gain1 gain2 gain3 gain4 gain5 gain6 gain7 gain8];
unprocessed=wavread(loadedfile);
processedaudio=equalizer(unprocessed,gains);
set(handles.ProcessedIndicator,'String','File Processed. Ready to Play or Save');
set(handles.ProcessedIndicator,'ForegroundColor',[0 1 0]);
set(handles.SavedIndicator,'String','Processed Audio Unsaved');
set(handles.SavedIndicator,'ForegroundColor',[1 0 0]);

guidata(hObject,handles);


% --- Executes on button press in play_button.
function play_button_Callback(hObject, eventdata, handles)
% hObject    handle to play_button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global processedaudio;
global player;
player=audioplayer(processedaudio,44100);
play(player);
guidata(hObject,handles);

% --- Executes on button press in save_button.
function save_button_Callback(hObject, eventdata, handles)
% hObject    handle to save_button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global processedaudio;
[file,path]=uiputfile('.wav','Save Processed WAV file');
savedfile=strcat(path,file);
wavwrite(processedaudio,44100,savedfile);
set(handles.SavedIndicator,'String','Processed Audio Saved!');
set(handles.SavedIndicator,'ForegroundColor', [0 1 0]);
guidata(hObject,handles);



% --- Executes on slider movement.
function slider2_Callback(hObject, eventdata, handles)
% hObject    handle to slider2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
set(handles.ProcessedIndicator,'String','Gain Changed! Push Process');
set(handles.ProcessedIndicator,'ForegroundColor',[1 1 0]);
val=get(hObject, 'Value');
valstring=strcat(num2str(val),' dB');
set(handles.level2, 'String', valstring);
guidata(hObject,handles);

% --- Executes during object creation, after setting all properties.
function slider2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on button press in Reset1.
function Reset1_Callback(hObject, eventdata, handles)
% hObject    handle to Reset1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of Reset1


% --- Executes on button press in Reset2.
function Reset2_Callback(hObject, eventdata, handles)
% hObject    handle to Reset2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of Reset2


% --- Executes on button press in Reset3.
function Reset3_Callback(hObject, eventdata, handles)
% hObject    handle to Reset3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of Reset3


% --- Executes on button press in Reset4.
function Reset4_Callback(hObject, eventdata, handles)
% hObject    handle to Reset4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of Reset4


% --- Executes on button press in Reset5.
function Reset5_Callback(hObject, eventdata, handles)
% hObject    handle to Reset5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of Reset5


% --- Executes on button press in Reset6.
function Reset6_Callback(hObject, eventdata, handles)
% hObject    handle to Reset6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of Reset6


% --- Executes on button press in Reset7.
function Reset7_Callback(hObject, eventdata, handles)
% hObject    handle to Reset7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of Reset7


% --- Executes on button press in Reset8.
function Reset8_Callback(hObject, eventdata, handles)
% hObject    handle to Reset8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of Reset8


% --- Executes on button press in ResetButton.
function ResetButton_Callback(hObject, eventdata, handles)
% hObject    handle to ResetButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
gainsreseted=0;
if (get(handles.Reset1, 'Value'))
    set(handles.slider1, 'Value', 0);
    set(handles.Reset1, 'Value',0);
    set(handles.level1, 'String','0 dB');
    gainsreseted=1;
end
if (get(handles.Reset2, 'Value'))
    set(handles.slider2, 'Value', 0);
    set(handles.Reset2, 'Value',0);
    set(handles.level2, 'String','0 dB');
    gainsreseted=1;
end
if (get(handles.Reset3, 'Value'))
    set(handles.slider3, 'Value', 0);
    set(handles.Reset3, 'Value',0);
    set(handles.level3, 'String','0 dB');
    gainsreseted=1;
end

if (get(handles.Reset4, 'Value'))
    set(handles.slider4, 'Value', 0);
    set(handles.Reset4, 'Value',0);
    set(handles.level4, 'String','0 dB');
    gainsreseted=1;
end
if (get(handles.Reset5, 'Value'))
    set(handles.slider5, 'Value', 0);
    set(handles.Reset5, 'Value',0);
    set(handles.level5, 'String','0 dB');
    gainsreseted=1;
end
if (get(handles.Reset6, 'Value'))
    set(handles.slider6, 'Value', 0);
    set(handles.Reset6, 'Value',0);
    set(handles.level6, 'String','0 dB');
    gainsreseted=1;
end
if (get(handles.Reset7, 'Value'))
    set(handles.slider7, 'Value', 0);
    set(handles.Reset7, 'Value',0);
    set(handles.level7, 'String','0 dB');
    gainsreseted=1;
end
if (get(handles.Reset8, 'Value'))
    set(handles.slider8, 'Value', 0);
    set(handles.Reset8, 'Value',0);
    set(handles.level8, 'String','0 dB');
    gainsreseted=1;
end
if (gainsreseted)
    set(handles.ProcessedIndicator,'String','Gains reset!');
    set(handles.ProcessedIndicator,'ForegroundColor',[1 1 0]);
end
guidata(hObject,handles);


% --- Executes on button press in ResetAll.
function ResetAll_Callback(hObject, eventdata, handles)
% hObject    handle to ResetAll (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

    set(handles.slider1, 'Value', 0);
    set(handles.Reset1, 'Value',0);
    set(handles.level1, 'String','0 dB');

    set(handles.slider2, 'Value', 0);
    set(handles.Reset2, 'Value',0);
    set(handles.level2, 'String','0 dB');
 
    set(handles.slider3, 'Value', 0);
    set(handles.Reset3, 'Value',0);
    set(handles.level3, 'String','0 dB');
    
    set(handles.slider4, 'Value', 0);
    set(handles.Reset4, 'Value',0);
    set(handles.level4, 'String','0 dB');
    
    set(handles.slider5, 'Value', 0);
    set(handles.Reset5, 'Value',0);
    set(handles.level5, 'String','0 dB');
    
    set(handles.slider6, 'Value', 0);
    set(handles.Reset6, 'Value',0);
    set(handles.level6, 'String','0 dB');
    
    set(handles.slider7, 'Value', 0);
    set(handles.Reset7, 'Value',0);
    set(handles.level7, 'String','0 dB');
   
    set(handles.slider8, 'Value', 0);
    set(handles.Reset8, 'Value',0);
    set(handles.level8, 'String','0 dB');
  
    set(handles.ProcessedIndicator,'String','Gains reset!');
    set(handles.ProcessedIndicator,'ForegroundColor',[1 1 0]);

guidata (hObject, handles);


% --- Executes on button press in stopbutton.
function stopbutton_Callback(hObject, eventdata, handles)
% hObject    handle to stopbutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global player;
stop(player);
guidata (hObject,handles);
