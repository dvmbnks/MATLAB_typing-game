% Function determine a random word from a excel dictionary file. 
function returnWord = resultWord()
% Read the excel file. 
dictXls = 'dictionary.xlsx';
% Read the table. 
dictVector = readtable(dictXls);
% Set table cells as vector elements. 
dictVector = table2array(dictVector);
% generate a number between max and min values of dictionary.
numRand = randi(9883,1);
% Return a final value. 
returnWord = dictVector(numRand,1);
end