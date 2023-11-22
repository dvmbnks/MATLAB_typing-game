%{
 Inital stages of creating a typing test game. Creating the backbones of
 the project word displayed, compared to user input and a 60 second time. 
%}

% Timer Function provided by Matlab. [Check Bibliography]
t = timer('TimerFcn', 'stat=false;','StartDelay',60);
% Staring the timer. 
start(t)
% Setting inital score.
valScore = 0;

% Setting Stat Value so a while loop can be used during the time. 
stat = true;
while stat == true
    % Getting word from resultWord function (generate random words).
    word = char(resultWord);

    % Displaying the word. 
    disp(word);

    % Collecting User Input
    wordInput = input("Input: ", 's');

    % To ensure the Arrays are compatible. 
    if length(char(wordInput)) <= length(char(word))
        
        % If the input and output are same.
        if char(wordInput) == word
            % Increase in score. 
            valScore = valScore + 1;
        end
    end
end

% Display score. 
fprintf("You scored: %.0f", valScore);
