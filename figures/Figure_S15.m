%% 
% Define scenarios
scenarios = {'245CN','245CF','245HN','245HF','585CN','585CF','585HN','585HF'};

% Define metrics
metrics = {'Frequency','Total D','Total S','Mean D','Mean S','Mean I'};

% Define data for MD, AD, HD (each 6x8 matrix of % changes)
MD = [ ...
    -1.7  -6.2  -5.0 -15.5  -3.8 -16.1  -6.8 -23.8;
    14.5  32.0  27.3  48.6  22.3  52.6  31.0  65.7;
    25.4  60.9  47.6  99.9  39.5 116.9  59.9 171.9;
    16.4  40.8  33.6  76.3  26.8  82.8  40.5 122.4;
    27.4  71.8  55.1 137.5  44.7 160.4  71.7 267.2;
     8.2  17.8  12.2  26.7  11.1  32.4  16.8  50.2];

AD = [ ...
     5.8  11.7   8.8   9.7   8.8  11.3   7.9   5.7;
    12.2  41.4  37.4  73.7  27.5  82.8  44.9 104.2;
    25.7  78.4  70.4 152.7  48.2 170.5  88.1 241.0;
     5.5  25.6  26.0  66.2  16.5  79.5  35.6 191.6;
    17.2  57.9  55.3 147.8  34.6 177.2  75.3 462.6;
     8.4  20.3  17.0  36.5  12.6  40.7  22.4  59.4];

HD = [ ...
     4.0   5.9   4.5   4.0   5.5   5.9   3.7   1.4;
     6.1  23.1  21.4  44.2  15.7  47.7  25.6  63.7;
    10.5  36.6  30.0  66.0  24.2  76.4  37.3 108.6;
     2.8  18.9  22.9  43.6  12.0  44.1  25.9  75.9;
     6.8  30.8  28.8  63.7  19.0  69.9  35.3 118.0;
     3.7   9.7   7.0  11.9   6.1  16.1   7.5  22.4];

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





