% Since roundGame has to be integars, accuaracy can change. 

% Test case 1 (Integars)
wpm = [1,2,3];
accWord = [93,94,100];
roundGame = 3;
plotResults(wpm,roundGame,accWord)

% Test Case 2 (Decimals).
wpm = [1,2,3];
accWord = [95.4,93.2,58.3];
roundGame = 3;
plotResults(wpm,roundGame,accWord)

% Test Case 3 (Mathematical Expression).
wpm = [1,2,3];
accWord = [100*pi,10*exp(2),100*(3/4)];
roundGame = 3;
plotResults(wpm,roundGame,accWord)


