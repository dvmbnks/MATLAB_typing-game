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

% Last Modified by GUIDE v2.5 19-Apr-2023 21:08:24

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

%{ 
Display the rules in the GUI by replacing plot axes with an image. Read the
image from the file. 
%}

 I = imread('image1.jpg');
 % Displaying the image.
 imshow(I);

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


% When each key is pressed.
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
% Resetting the variables. 
set(handles.text6,'string', "0");
set(handles.text8,'string',"")
set(handles.text7,'string',"")
set(handles.text9,'string',"");
set(handles.text10,'string',"");

% Get displayed word. 
getWord = string(get(handles.displaytext, 'string'));
% Collect input. 
inputText = string(get(handles.input1,'string'));

% If input and displayed word are sample.
if getWord == inputText
    % Collect the score. 
    valScore = str2double(get(handles.scores, 'string'));
    % Increase the score. 
    valScore = valScore + 1;
end
% Set the score in the GUI. 
set(handles.scores, 'string', valScore)
% Clear input text.  
set(handles.input1, 'string',"");

% Transform word in charachter vector.
finWord = char(resultWord);
% Choose a random value with 50/50 chance. 
ranVal = randi([1,2]);
% In one of the cases.
if ranVal == 1
    % Make the word Upper to make the game harder. 
    finWord = upper(finWord);
end
% Set the word on GUI. 
set(handles.displaytext, 'string',finWord);

%{
Executes on button press in pushbutton2.To initalise timer and score
variables. 
%}

function pushbutton2_Callback(~, ~, handles)
% Setting up the game and initalising all the values in the GUI. 
set(handles.displaytext, 'string',"[WORD APPEARS HERE]");
set(handles.displaytext,'Foreground','white')
set(handles.displaytext,'fontsize',15)
set(handles.text6,'string', 0);
set(handles.text6,'string', "0");
set(handles.text8,'string',"")
set(handles.text7,'string',"")
set(handles.text10,'string',"");
set(handles.text9,'string',"");
set(handles.text12, 'string',"");
set(handles.timer, 'string',"60");

% Allow the user to some time before the game starts. 
pause(1);
% Timer Function provided by Matlab. [Check Bibliography].
t = timer('TimerFcn', 'stat=false;','StartDelay',60);
% Starting the timer to run in the background.
start(t)
% Change word into a charachter array and collect a word from function.
finWord = char(resultWord);

% Set score and timers to inital values.
valScore = 0;
valTime = 60;

% Display text, score and restart input. 
set(handles.displaytext, 'string',finWord);
set(handles.scores, 'string', valScore);
set(handles.input1, 'string',"");

for i = 1:60
    % To ensure the code runs after every second. 
    pause(1)
    % Reducing timer value. 
    valTime = valTime - 1;
    % Setting the Timer string.
    set(handles.timer, 'string', valTime);
    % When timer hits 60.
    if i == 60
        % Turn off input. 
        set(handles.input1, 'enable', 'off')
        % Create a msgbox to show the game ended. 
        msgbox("Game Ended");
        % Message to display.
        varEnd = "Game Ended";
        % Displaying messages in GUI. 
        set(handles.displaytext, 'string',varEnd);
        set(handles.displaytext,'Foreground','RED')
        set(handles.displaytext,'fontsize',20)

    end
end

% --- Executes on key press with focus on input1 and none of its controls.
function input1_KeyPressFcn(~, ~, handles)
enteredKey = (get(gcf,'CurrentCharacter'));
if enteredKey ~= char(8)
    % Collect variables for input. 
    i = str2double(get(handles.text6,'string'));
    % Letters the user has gotten correct (collected from GUI). 
    letterTemp = char((get(handles.text8,'string')));
    % Letters the user has gotten incorrect (collected from GUI). 
    wrongTemp = char(get(handles.text10,'string'));
    % Increasing Index for a new vector element. 
    i = i + 1;
    % Assigning index in the GUI. 
    set(handles.text6,'string', i);
    % Get the word that's displayed, to be further compared. 
    getWord = get(handles.displaytext, 'string');
    % Converting the word from string into charachter vector.  
    getWord = char(getWord);

    % To ensure the index doesn't surpass the length of the vector. 
    if i <= length(getWord)

        %{ 
        If the inputted key is the same as the indexed elemtent from
        character vector (using vectors and index efficently). 
        %}
        if enteredKey == getWord(i)
            % Creating a vector that collects all the correct values. 
            letterTemp(i) = string(enteredKey);
            % Creating a vector that collects all the incorrect values. 
            wrongTemp(i) = " ";
            % Setting the values in the GUI to be accessible.
            set(handles.text9,'string',wrongTemp)
            set(handles.text10,'string',wrongTemp)
            set(handles.text8,'string',letterTemp)
            set(handles.text7,'string',letterTemp)
            set(handles.text7,'Foreground','GREEN')
        else
            % When the letter is incorrect, input the value in the vector. 
            wrongTemp(i) = (enteredKey);
            % Add space in the correct letter vector so no overlaps occur.
            letterTemp(i) = " ";
            % Set these values in the GUI so they're accessible. 
            set(handles.text7,'string',letterTemp)
            set(handles.text8,'string',letterTemp)
            % Set the wrong letters in Red. 
            set(handles.text9,'Foreground','RED')
            set(handles.text9,'string',wrongTemp)
            set(handles.text10,'string',wrongTemp)
        end
    end
end

% If the user goes back via backspace. 
if enteredKey == char(8)
    % Collect the index for the newest element. 
    i = str2double(get(handles.text6,'string'));
   % To ensure the index doesn't reduce below the minimum charachters.  
  if i > 0
     % Collect the Correct Letters.
    letterTemp = char((get(handles.text8,'string')));
    % Collect the Incorrect Letters. 
    wrongTemp = char(get(handles.text10,'string'));
    % Replace the letters with a space.
    letterTemp(i) = " ";
    wrongTemp(i) =(" ");

    % Set the new words in the GUI so they're accessible. 
    set(handles.text8,'string',letterTemp)
    set(handles.text7,'string',letterTemp)
    set(handles.text7,'Foreground','GREEN')
    set(handles.text10,'string',wrongTemp)
    set(handles.text9,'string',wrongTemp)
    set(handles.text9,'Foreground','RED')
 
    % Reduce the index value to account for the backspace. 
    i = i - 1;
    % Set the new index value. 
    set(handles.text6,'string', i);
  end
end

