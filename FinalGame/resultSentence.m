function returnWord = resultSentence()
% Read dictionary File. 
dictXls = 'dictionary.xlsx';
% Read the table.
dictVector = readtable(dictXls);
% Assign vector with the table entries. 
dictVector = table2array(dictVector);
% Generate a random number between max and min number of words. 
numRand = randi(9883,1);
% Return the word as a string from the vector index of the random number. 
returnWord = string(dictVector(numRand,1));
% Make it a charachter array. 
returnWord = char(returnWord);
% Make the first letter Captial. 
returnWord(1) = upper(returnWord(1));
% Make the word a string. 
returnWord = string(returnWord);
% Create 5 word sentences. 
for i = 1:5
    % Generate random number between max and min number of words for index. 
    numRand = randi(9883,1);
    % Create a 50/50 chance to be Upper or min for complexity. 
    ranVal = randi([1,2]);
    % Add spaces between words. 
    returnWord = returnWord + " ";
    % If random value is 1, then create the word to be Uppercase. 
     if ranVal == 1
     returnWord = returnWord + upper(string(dictVector(numRand,1)));
     % Else then create the word to be lowercase (as it is). 
     else
     returnWord = returnWord + string(dictVector(numRand,1));
     end
end
% Add period at the end of the loop to create a "sentence". 
returnWord = returnWord + ".";
end
