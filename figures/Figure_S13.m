%% 
% Define scenarios
scenarios = {'245CN','245CF','245HN','245HF','585CN','585CF','585HN','585HF'};

% Define metrics
metrics = {'Frequency','Total D','Total S','Mean D','Mean S','Mean I'};

% Define data for MD, AD, HD (each 6x8 matrix of % changes)
MD = [ ...
     0.1  -4.0  -3.0  -8.1  -2.4 -14.4  -6.3 -18.2;
    20.9  32.9  30.0  39.6  24.4  50.1  33.3  55.3;
    34.6  60.3  52.5  85.4  43.5 112.4  64.9 159.9;
    21.5  41.2  35.0  55.5  28.9  86.3  43.7 101.7;
    35.5  70.8  58.6 107.3  49.1 165.9  78.3 241.8;
    10.6  18.4  14.6  29.6  12.5  36.1  19.2  59.6];

AD = [ ...
     1.3  -3.7  11.2  -0.1  -0.8   0.0   3.4  -1.0;
     2.2   7.7  12.8   1.9   6.5  17.4  11.9   8.8;
    11.4  25.5  26.5  23.1  20.1  56.1  31.7  52.9;
    -2.1   8.4  -2.9  -5.7   6.4  10.3   4.4  -3.0;
     6.0  23.7   7.4  11.0  20.4  44.1  21.3  30.8;
     7.4  11.1   9.0  13.2  10.1  22.1  12.3  27.7];

HD = [ ...
     1.4   0.1   0.8  -1.7   0.8  -1.2  -0.8  -5.5;
     4.5   9.0  13.2   7.1   6.6  20.2  13.4  14.6;
     8.9  16.9  18.5  16.4  13.2  35.1  22.2  38.5;
     0.7   8.3  15.0   5.9   4.3  24.2  20.8  15.4;
     4.4  17.4  22.3  13.2   9.7  40.5  34.6  37.7;
     2.5   3.7   2.1   6.1   4.6   7.6   5.1  11.5];

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





