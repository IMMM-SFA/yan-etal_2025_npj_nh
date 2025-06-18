%% 
% Define scenarios
scenarios = {'245CN','245CF','245HN','245HF','585CN','585CF','585HN','585HF'};

% Define metrics
metrics = {'Frequency','Total D','Total S','Mean D','Mean S','Mean I'};

% Define data for MD, AD, HD (each 6x8 matrix of % changes)
MD = [ ...
     0.3  -1.2  -1.7  -5.7  -1.1  -5.6  -2.1  -9.9;
     4.1  18.4  21.1  36.0  14.6  32.2  16.8  45.1;
    11.1  35.7  34.5  72.1  24.8  71.4  33.7 109.1;
     3.4  20.0  23.1  45.2  15.6  41.8  19.1  65.8;
    10.4  37.7  36.9  84.2  26.0  84.5  36.6 141.6;
     5.6  11.9   8.6  21.2   8.3  24.9  11.5  35.3];

AD = [ ...
   -17.7 -17.9 -12.7 -12.8 -13.1 -14.5 -18.0 -13.6;
   -30.4 -21.9 -12.1  -4.2 -23.1 -10.2 -21.3   0.2;
   -30.3 -10.6  -0.9  27.0 -19.1  18.5  -9.1  46.3;
   -16.1  -9.7  -3.2   2.8 -12.6  -4.5  -8.2   6.4;
   -16.1  -0.3   6.3  31.7 -10.4  19.8   2.1  47.6;
    -1.6   5.4   5.3  20.8   2.0  20.2   7.2  31.2];

HD = [ ...
    -4.0  -4.7  -3.3  -3.8  -1.4  -3.1  -4.5  -4.1;
   -11.7  -5.6   1.7   9.0  -2.3   3.6  -4.4   9.6;
    -8.1   3.3   8.8  26.3   2.6  22.2   2.5  36.9;
    -8.2  -1.5   5.4  13.5  -1.3   6.2  -0.2  15.2;
    -4.7   7.5  12.8  30.9   3.3  24.5   6.9  43.7;
     4.6   7.3   5.7  11.4   4.7  13.9   5.2  18.9];

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





