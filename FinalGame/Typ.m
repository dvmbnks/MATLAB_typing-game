%{
This is the final code for a Typing Test Game built [with GUI (GUIDE)]
functionality. The main outlined functions are provided by MATLAB GUI. 
%}

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

% Last Modified by GUIDE v2.5 24-Apr-2023 18:54:51

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

%imshow(imread("image1.jpg"))

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
    Display the rules in the GUI by replacing plot axes with an image. 
    Read the image from the file. 
%}
I = imread('image1.jpg');
% Setting Axes. 
axes(handles.axes4)
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

function input1_Callback(hObject, eventdata, handles)
%{
Input of each key to ensure when [ENTER] is pressed, the function is
called. 
%}
kkey = (get(gcf,'CurrentCharacter'));

% If entered key is ENTER then call the "game" function.
if kkey == char(13)
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
% Set all the values to zero or null to ensure there isn't any overlap. 
set(handles.indexVal1,'string', "0");
set(handles.tempText2,'string',"")
set(handles.correctText,'string',"")
set(handles.tempText3,'string',"");
set(handles.tempText1,'string',"");

% Get the word that is required to compared. 
getWord = string(get(handles.displaytext, 'string'));
% Get the input from the user. 
inputText = string(get(handles.input1,'string'));

%{
Compare the word//Could've used string compare but there isn't a big
difference. If the word is correct then add a score. 
%}

if getWord == inputText
    % Collect scoring from static text. 
    valScore = str2double(get(handles.scores, 'string'));
    % Increase score. 
    valScore = valScore + 1;
    % Set the new score. 
    set(handles.scores, 'string', valScore)
end

% Clear the writing space so user doesn't have backspace everything. 
set(handles.input1, 'string',"");

% Conditonal statement: Does the user want to play hard or easy?
getSwitch = str2double(get(handles.indexVal2, 'string'));
if getSwitch == 1
    % Get the word by calling [resultWord] that generates the words. 
    finWord = char(resultWords);
else
    % Get the word by calling another function that generates the sentence. 
    finWord = char(resultSentence);
end    

% Set the word/sentence as user preference. 
set(handles.displaytext, 'string',finWord);


%{
Executes on button press in GamePlay.To initalise timer and score
variables. 
%}

function GamePlay_Callback(~, ~, handles)
% Collecting index to create vectors.
roundGame = str2double(get(handles.numGames,'string'));
% Increasing index to collect data for that index to create a vector. 
roundGame = roundGame + 1;

% Setting the information in the GUI. 
set(handles.numGames, 'string',roundGame);
% Allow the user to input information in the textbox. 
set(handles.input1, 'enable', 'on')

% Setting the Intial values. 
set(handles.displaytext, 'string',"[WORDS APPEARS HERE]");
set(handles.displaytext,'Foreground','white')
set(handles.displaytext,'fontsize',15)
set(handles.indexVal1,'string', "0");
set(handles.correctText,'string',"");
set(handles.tempText2,'string',"");
set(handles.tempText3,'string',"");
set(handles.tempText1,'string',"");
set(handles.gameText, 'string',"");
set(handles.letterScore,'string',"0");
set(handles.mistakeScore,'string',"0");

% Restarting the timer. 
set(handles.timer, 'string',"60");
% Give the user a second to realise the game has ended. 
pause(1);
% Timer Function provided by Matlab. 
t = timer('TimerFcn', 'stat=false;','StartDelay',60);
% Starting the timer to run in the background. 
start(t)

% Collecting the user preference. 
getSwitch = str2double(get(handles.indexVal2, 'string'));
% When user wants to play easy mode.
if getSwitch == 1
finWord = char(resultWords);
else
    % When user wants to play harder mode. 
    finWord = char(resultSentence);
end

% Resetting/Initalising Score and timer for that Game. 
valScore = 0;
valTimer = 60;
% Setting the new values in the GUI. 
set(handles.displaytext, 'string',finWord);
set(handles.scores, 'string', valScore);
set(handles.input1, 'string',"");

% Declaring Vectors.
wpm = [];
accWord = [];

% Timer & displaying Timer. 
for i = 1:60
    % For each second. 
    pause(1)
    % Reduce timer value from 60. 
    valTimer = valTimer - 1;
    % Set the value in GUI to report to user about time conditions. 
    set(handles.timer, 'string', valTimer);

    % When timer has ended.
    if i == 60
        % Disable user input so no scores can be added after time.  
        set(handles.input1, 'enable', 'off')
        % Collect the user mistakes. 
        mistakes = str2double(get(handles.mistakeScore,'string'));
        % Collect the user Scores. 
        scoring = str2double(get(handles.scores,'string'));
        % Collect the letters they got correct. 
        letters = str2double(get(handles.letterScore,'string'));
        % Collect user's preference to ensure the calculations are correct.
        getSwitch = str2double(get(handles.indexVal2, 'string'));
        % Import external saved data to form vectors. 
        importedData = importdata('dataFile.txt');

        % Incase the user wants to play easy.
        if getSwitch == 1
            % Ensuring the index doesn't try to collect non-existing data.
            if roundGame == 1
                % Creating a new vector element with collected information. 
                wpm(roundGame) = scoring;
            % After inital information exists. 
            else
                % Collecting the data using a for loop.  
                for j = 1:roundGame-1
                % Collecting top line of the Matrix. 
                wpm(j) = importedData(1,j);
                % Collecting second line of the Matrix. 
                accWord(j) = importedData(2,j);
                end
                % Collecting new information for a new indented element.
               wpm(roundGame) = scoring;
            end

        % If user wanted to play the hard mode.
        else
            % Ensuring the index doesn't try to collect non-existing data.
            if roundGame == 1
                % Multiplying the score by 5 for each word in sentence. 
                wpm(roundGame) = (scoring*5);
            else
               for j = 1:roundGame-1
                % Collecting top line of the Matrix. 
                wpm(j)= importedData(1,j);
                % Collecting second line of the Matrix. 
                accWord(j) = importedData(2,j);
               end
               % Collecting new index vector element's information. 
                wpm(roundGame) = (scoring*6);
            end
        end

    % Calculating Accuracy. 
    accWord(roundGame) = (letters/(letters+mistakes))*100;
    % Writing a new data txt file with new information about new elements. 
    writematrix([wpm;accWord], 'dataFile.txt')

    % Information for the Message Box. 
    txtOne = sprintf("You made %.f charachter mistakes.", mistakes);
    txtTwo = sprintf("You got %.f charachters correct!", letters);
    txtThr = sprintf("You have %.f percent accuracy!", accWord(roundGame));
    txtFour = sprintf("You got %.f Words Per Min!", wpm(roundGame));

    % Pausing for the user to understand the game has ended. 
    pause(1)

    % Creating an alert box about the new information.
    msgbox(["Game Over";txtOne;txtTwo;txtThr;txtFour]);
    % Showing user Game has ended by setting new text in GUI. 
    set(handles.gameText, 'string',"Game Ended");
    % Setting GUI's colour red. 
    set(handles.gameText,'Foreground','RED')
    end
end

% --- Executes on key press with focus on input1 and none of its controls.
function input1_KeyPressFcn(~, ~, handles)
% Collecting the key that's pressed. 
kkey = (get(gcf,'CurrentCharacter'));
% As long as the key is not the backspace.
if kkey ~= char(8)

    % Collect variables for input. 
    i = str2double(get(handles.indexVal1,'string'));
    % Letters the user has gotten correct (collected from GUI). 
    letterTemp = char((get(handles.tempText2,'string')));
    % Letters the user has gotten incorrect (collected from GUI). 
    wrongTemp = char(get(handles.tempText1,'string'));
    % Increasing Index for a new vector element. 
    i = i + 1;
    % Assigning index in the GUI. 
    set(handles.indexVal1,'string', i);

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
        if kkey == getWord(i)

            % Increase letter Score. 
            letScore = str2double(get(handles.letterScore,'string'));
            % Increase Index. 
            letScore = letScore + 1;
            % Set the index in the GUI so its accessible. 
            set(handles.letterScore,'string',letScore);
            % Creating a vector that collects all the correct values. 
            letterTemp(i) = string(kkey);
            % Creating a vector that collects all the incorrect values. 
            wrongTemp(i) = " ";

            % Setting the values in the GUI to be accessible. 
            set(handles.tempText3,'string',wrongTemp)
            set(handles.tempText1,'string',wrongTemp)
            set(handles.tempText2,'string',letterTemp)
            set(handles.correctText,'string',letterTemp)
            % Setting the correct values as Green. 
            set(handles.correctText,'Foreground','GREEN')
        else
            % Creating an index for the wrong letters vectors. 
            letWrong = str2double(get(handles.mistakeScore,'string'));
            letWrong = letWrong + 1;
            set(handles.mistakeScore,'string',letWrong);

            % When the letter is incorrect, input the value in the vector. 
            wrongTemp(i) = (kkey);
            % Add space in the correct letter vector so no overlaps occur.
            letterTemp(i) = " ";

            % Set these values in the GUI so they're accessible. 
            set(handles.correctText,'string',letterTemp)
            set(handles.tempText2,'string',letterTemp)
            % Set the wrong letters in Red. 
            set(handles.tempText3,'Foreground','RED')
            set(handles.tempText3,'string',wrongTemp)
            set(handles.tempText1,'string',wrongTemp)
        end
    end
end

% If the user goes back via backspace. 
if kkey == char(8)
   % Collect the index for the newest element. 
    i = str2double(get(handles.indexVal1,'string'));
    % To ensure the index doesn't reduce below the minimum charachters. 

  if i > 0
    % Collect the Correct Letters.
    letterTemp = char((get(handles.tempText2,'string')));
    % Collect the Incorrect Letters. 
    wrongTemp = char(get(handles.tempText1,'string'));
    % Replace the letters with a space.
    letterTemp(i) = " ";
    wrongTemp(i) =(" ");
    % Set the new words in the GUI so they're accessible. 
    set(handles.tempText2,'string',letterTemp)
    set(handles.correctText,'string',letterTemp)
    set(handles.correctText,'Foreground','GREEN')
 
    set(handles.tempText1,'string',wrongTemp)
    set(handles.tempText3,'string',wrongTemp)
    set(handles.tempText3,'Foreground','RED')
    % Reduce the index value to account for the backspace. 
    i = i - 1;
    % Set the new index value. 
    set(handles.indexVal1,'string', i);
  end
end

% When user wants to play Easy Mode.
function easyButton_Callback(hObject, eventdata, handles)
% When the user clicks the button, static information is collected.
getSwitch = str2double(get(handles.indexVal2, 'string'));
% A variable with information that user wants to play easy. 
getSwitch = 1;
% Set the "mode" in the GUI so its accessible. 
set(handles.indexVal2, 'string', getSwitch);
% Call the Game function. 
GamePlay_Callback(hObject, eventdata, handles);

% When user wants to play Hard mode. 
function hardButton_Callback(hObject, eventdata, handles)
% When the user clicks the button, static information is collected.
getSwitch = str2double(get(handles.indexVal2, 'string'));
% A variable with information that user wants to play hard. 
getSwitch = 0;
% Set the "mode" in the GUI so its accessible. 
set(handles.indexVal2, 'string',getSwitch);
% Call the Game function. 
GamePlay_Callback(hObject, eventdata, handles)

% When user wants to see their progress.
function showResults_Callback(~, ~, handles)
% Declaring Vectors and Matracies. 
wpm = [];
accWord = [];

% Collect the number of games played by user. 
roundGame = str2double(get(handles.numGames,'string'));

% Ensuring there's information to be collected (at least a game is played). 
if roundGame > 0
    % Infromation is being imported from the games that are already played. 
    importedData = importdata('dataFile.txt');
    for j = 1:roundGame
    % Collecting top line of the Matrix as wpm.
    wpm(j) = importedData(1,j);
    % Collecting bottom line of the Matrix as Accuracy. 
    accWord(j) = importedData(2,j);
    end
    % Calling plotResults function to show graphs of results.
    plotResults(wpm,roundGame,accWord);
else 
    % Incase no games are played. 
    msgbox("No Valid Data Yet")
end
