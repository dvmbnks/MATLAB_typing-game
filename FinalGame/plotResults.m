function  plotResults(wpm,roundGame,accWord)
% Create the figure to plot within with title RESULTS.
figure('Name','RESULTS!')
% Create a tiled layout in the figure. 
tiledlayout(2,1)

% Top plot
nexttile
% Create a bar graph with games played and WPM. 
bar(1:roundGame,wpm(1:roundGame));
% Label the x and y axis
xlabel('Games Played') 
ylabel('Words Per Min')
% Label the title of the first graph. 
title('WPM')

% Bottom plot
nexttile
% Create a bar graph with games played and Accuracy. 
h = bar(1:roundGame,accWord(1:roundGame));
% Set colour of the graph to be red. 
h.FaceColor= 'r';
% Label x and y
xlabel('Games Played') 
ylabel('Accuracy') 
% Set Title.
title('ACCURACY')
end


