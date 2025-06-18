%% 
% Define scenarios
scenarios = {'245CN','245CF','245HN','245HF','585CN','585CF','585HN','585HF'};

% Define metrics
metrics = {'Frequency','Total D','Total S','Mean D','Mean S','Mean I'};

% Define data for MD, AD, HD (each 6x8 matrix of % changes)
MD = [ ...
    -1.5 -1.4 -1.4 -2.5 -1.4 -3.1 -1.8 -5.3;
    12.2 18.3 13.8 20.7 16.4 27.2 17.0 31.4;
    22.9 39.3 28.1 50.6 29.8 64.0 37.9 82.6;
    13.9 20.6 15.4 24.2 18.1 31.8 19.4 40.1;
    24.9 42.6 30.1 55.5 31.9 71.0 41.0 96.5;
    8.4  14.3 10.9 20.7 9.2  23.7 14.4 32.3];

AD = [ ...
     2.5  4.3  3.4  7.2  2.6  8.8  5.6  9.8;
     5.6 10.4  6.9 10.5  8.1 15.3 11.5 15.9;
    14.5 30.4 18.9 34.5 20.9 47.9 30.0 57.7;
     2.0  4.7  2.6  1.1  4.5  3.7  4.8  3.2;
    11.1 24.3 14.6 23.3 17.2 33.5 22.5 40.3;
     7.2 15.9 10.9 20.3 9.7 25.6 15.3 33.9];

HD = [ ...
    -6.5 -7.2 -7.2 -7.2 -5.8 -7.2 -7.0 -6.9;
    -0.3  1.3 -1.6  0.1  1.0  6.4  0.1  6.2;
     4.1 12.0  4.9 12.7  7.7 22.3  8.6 27.7;
     6.4  9.5  5.7  8.2  7.0 15.2  7.7 15.0;
    11.6 22.0 13.1 23.5 14.6 34.0 17.7 40.2;
     3.8  8.3  6.0 11.0  5.1 12.5  7.1 17.3];

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





