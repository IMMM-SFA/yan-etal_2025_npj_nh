%% 
% Define scenarios
scenarios = {'245CN','245CF','245HN','245HF','585CN','585CF','585HN','585HF'};

% Define metrics
metrics = {'Frequency','Total D','Total S','Mean D','Mean S','Mean I'};

% Define data for MD, AD, HD (each 6x8 matrix of % changes)
MD = [ ...
    -5.2 -13.2 -8.8 -17.4 -9.5 -22.4 -10.9 -26.1;
    31.4 49.9 39.9 55.2 38.4 64.3 44.1 70.3;
    57.5 106.4 81.9 144.3 73.6 175.0 101.2 230.5;
    39.8 76.3 56.7 96.2 55.2 124.2 66.3 152.1;
    67.4 143.4 103.9 210.1 94.9 279.8 132.4 399.1;
    17.3 32.1 25.3 47.3 20.9 55.0 31.4 77.1];

AD = [ ...
     5.0  6.3  5.6 10.8  4.7  7.4  5.8 11.7;
    18.8 32.9 21.4 30.1 24.1 49.6 25.0 48.8;
    33.9 68.0 44.7 71.8 50.5 113.5 57.4 124.9;
    16.2 30.0 33.7 22.4 57.1 51.7 21.4 39.9;
    41.6 85.2 93.4 82.7 144.4 147.7 71.6 129.0;
     9.4 21.2 14.0 23.5 16.8 35.3 18.6 43.6];

HD = [ ...
    -1.8 -0.8 -0.3 -0.9 -1.5 -0.6 -1.7 -1.5;
     8.4 17.9 10.2 15.1 12.6 28.9 12.0 28.4;
     9.3 24.8 14.8 25.9 16.3 45.3 18.6 55.7;
    11.1 20.0 11.6 17.8 15.4 32.2 15.1 34.3;
    12.1 27.3 16.5 29.3 19.3 50.1 22.0 64.9;
     1.3  4.4  3.1  6.8  3.1  9.8  4.6 15.9];

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





