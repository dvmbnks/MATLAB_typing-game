function varargout = Typ(varargin)
% TYP MATLAB code for Typ.fig
%      TYP, by itself, creates a new TYP or raises the existing
%      singleton*.
%
%      H = TYP returns the handle to a new TYP or the handle to
%      the existing singleton*.
%
%      TYP('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in TYP.M with the given input arguments.
%
%    TYP('Property','Value',...) creates a new TYP or raises the
%    existing singleton*.  Starting from the left, property value pairs are
%    applied to the GUI before Typ_OpeningFcn gets called.  An
%    unrecognized property name or invalid value makes property application
%    stop.  All inputs are passed to Typ_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Typ

% Last Modified by GUIDE v2.5 17-Apr-2023 19:06:36

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Typ_OpeningFcn, ...
                   'gui_OutputFcn',  @Typ_OutputFcn, ...
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


% --- Executes just before Typ is made visible.
function Typ_OpeningFcn(hObject, ~, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Typ (see VARARGIN)

% Choose default command line output for Typ
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Typ wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Typ_OutputFcn(~, ~, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;

% Whenever a key is pressed.
function input1_Callback(hObject, eventdata, handles)
% Collecting the key that's pressed. 
enteredKey = (get(gcf,'CurrentCharacter'));
% If enter is pushed.
if enteredKey == char(13)
    % Calling the game function. 
    pushbutton1_Callback(hObject, eventdata, handles)
end

% --- Executes during object creation, after setting all properties.
function input1_CreateFcn(hObject, ~, ~)
% hObject    handle to input1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), ...
        get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

%{
Executes on button press in pushbutton1(Whenever user finishes their 
input).
%}

function pushbutton1_Callback(~, ~, handles)
% Get displayed word. 
getWord = string(get(handles.displaytext, 'string'));
% Collect input. 
inputText = string(get(handles.input1,'string'));

% If input and displayed word are sample.
if getWord == inputText
    % Collect the score. 
    valScore = str2double(get(handles.score, 'string'));
    % Increase the score. 
    valScore = valScore + 1;
    % Set the score in the GUI. 
    set(handles.score, 'string', valScore)
    % Clear input text.  
    set(handles.input1, 'string',"");
else
    % Clear input text.  
    set(handles.input1, 'string',"");
end
% Clear the input. 
set(handles.input1, 'string',"");
% Transform word in charachter vector. 
dispWord = char(resultWord);
% Set the word on GUI. 
set(handles.displaytext, 'string',dispWord);


%{
Executes on button press in pushbutton2.To initalise timer and score
variables. 
%}

function pushbutton2_Callback(~, ~, handles)
% Timer Function provided by Matlab. [Check bibliography]
t = timer('TimerFcn', 'stat=false;','StartDelay',60);
% Starting timer. 
start(t)
% Change word into a charachter array. 
finWord = char(resultWord);
% Set score to inital values.
valScore = 0;
% Display text, score and restart input. 
set(handles.displaytext, 'string',finWord);
set(handles.score, 'string', valScore);
set(handles.input1, 'string',"");
