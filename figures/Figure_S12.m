%% 
% Define scenarios
scenarios = {'245CN','245CF','245HN','245HF','585CN','585CF','585HN','585HF'};

% Define metrics
metrics = {'Frequency','Total D','Total S','Mean D','Mean S','Mean I'};

% Define data for MD, AD, HD (each 6x8 matrix of % changes)
MD = [ ...
    -1.8 -9.3 -5.0 -14.1 -3.6 -18.9 -8.6 -23.0;
    22.1 45.0 31.7 52.3 30.0 62.6 41.0 66.7;
    37.8 86.9 59.7 119.0 54.0 146.8 82.8 198.6;
    24.3 60.8 38.8 78.4 34.9 101.6 55.1 118.9;
    40.2 107.3 68.5 157.3 59.9 206.9 101.3 293.4;
    11.6 25.1 17.5 36.6 16.2 45.4 23.7 68.4];

AD = [ ...
    -0.3 7.0 1.2 7.7 1.4 10.6 4.3 11.0;
     0.3 28.4 9.8 31.4 11.0 46.7 22.6 47.2;
    10.4 68.4 31.6 83.0 32.0 117.7 62.5 134.1;
     0.6 19.7 6.4 19.6 9.4 30.5 15.9 28.9;
    10.1 55.5 26.2 64.0 29.5 91.7 52.6 102.2;
     6.7 28.3 15.1 35.5 15.0 48.1 26.4 59.2];

HD = [ ...
     0.6  0.7 -1.9 -1.9  0.1 -1.0 -1.8 -2.8;
     6.5 27.7 14.8 32.2 14.9 44.6 22.8 46.6;
    13.5 45.5 26.6 56.7 24.5 77.5 39.9 96.6;
     6.2 32.4 17.8 37.3 15.0 54.8 28.2 66.5;
    13.3 52.9 29.8 63.9 24.6 93.8 46.7 130.0;
     5.0 11.5  7.8 14.2  6.7 18.7 11.1 27.7];

% Plot
figure;
categories = {'MD','AD','HD'};
data = {MD, AD, HD};

for i = 1:3
    subplot(3,1,i)
    bar(data{i}', 'grouped')  % transpose so each group is a scenario
    title([categories{i} ' - Drought Metrics (% Change)'])
    ylabel('% Change')
%     ylim([-10 100])  % adjust as needed
    xticks(1:8)
    xticklabels(scenarios)
    if i==1
        legend(metrics, 'Location','northwest')
    end
    grid on
end

% sgtitle('Drought Statistics across Scenarios')







%% output the plot

fig = gcf;
fig.PaperUnits = 'inches';

% fig.PaperPosition = [0 0 17.7 8];
fig.PaperPosition = [0 0 7 12];
print('ScreenSizeFigure', '-dpng', '-r300')





