%% 
% Define data
regions = {'NW', 'SW', 'MW', 'GP', 'NE', 'SE'};
scenarios = {'245CN','245CF','245HN','245HF','585CN','585CF','585HN','585HF'};

% Percent change data for MD-AD and MD-HD (6 regions × 8 scenarios each)
MD_AD = [ ...
    10.8,  7.7,  8.0,  2.6, 16.7, 12.0,  9.2, 11.6;  % NW
    46.4, 78.8, 65.8, 82.9, 50.4, 99.7, 67.1,101.5;  % SW
    36.0, 54.0, 51.7, 62.8, 41.6, 66.9, 48.9, 77.4;  % MW
    32.1, 64.6, 38.1, 92.5, 41.6, 98.2, 64.0,140.0;  % GP
    50.6, 79.9, 70.2,100.6, 67.9,100.1, 73.2,122.7;  % NE
    15.7, 23.5, 27.0, 35.9, 18.1, 36.0, 29.6, 42.0]; % SE

MD_HD = [ ...
    29.2, 34.6, 35.0, 37.1, 48.9, 69.1, 44.1, 68.1;  % NW
    88.1,111.8,106.1,148.1, 91.7,145.6,114.3,160.2;  % SW
    33.3, 48.9, 54.3, 61.9, 51.5, 77.1, 50.5, 72.5;  % MW
    54.1,101.7, 59.7,136.2, 51.6,130.2, 66.1,198.2;  % GP
    47.2, 92.9, 89.8,122.7, 50.1,124.0, 87.5,145.3;  % NE
    39.1, 65.6, 57.2, 89.4, 46.3, 95.3, 61.5,110.5]; % SE

% Plot
figure;
for i = 1:length(regions)
    subplot(3,2,i)
    bar([MD_AD(i,:); MD_HD(i,:)]', 'grouped')
    title(regions{i})
    ylabel('% Change')
%     ylim([0 220])  % adjust based on data range
    xticks(1:8)
    xticklabels(scenarios)
    xtickangle(45)
    if i==1; legend({'MD-AD','MD-HD'}, 'Location','northwest'); end
    grid on
end

sgtitle('Percent Change in MD-AD and MD-HD Lag Time')







%% output the plot

fig = gcf;
fig.PaperUnits = 'inches';

% fig.PaperPosition = [0 0 17.7 8];
fig.PaperPosition = [0 0 7 8];
print('ScreenSizeFigure', '-dpng', '-r300')





