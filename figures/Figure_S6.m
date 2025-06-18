%% monthly Tair change (abs diff)

clear all; clc;

% Plot monthly change
subplot(3,2,1)

% Define months
months = 1:12;

% Define data (rows = months, columns = variables)
data = [
   13.6	13.6	13.6	12.8	12.6	14.2	14.2	12.4	13.0
12.5	13.2	12.7	11.9	11.6	13.6	13.9	12.0	13.4
13.4	13.5	13.5	13.7	13.3	14.0	15.2	14.0	14.9
13.5	13.9	16.3	15.4	16.8	15.2	18.2	16.1	19.5
12.8	15.2	17.2	15.4	17.5	16.8	18.2	15.7	20.2
12.8	15.0	16.6	15.6	17.7	15.6	18.5	17.2	19.4
12.9	18.5	20.3	18.2	22.5	18.7	23.5	20.2	25.7
13.7	19.2	21.5	20.2	23.8	19.7	23.7	21.4	24.9
12.7	14.3	15.2	15.8	16.8	14.7	16.3	16.0	17.6
13.0	13.0	13.7	13.8	13.1	13.7	13.3	13.7	13.5
12.9	12.9	13.1	13.1	13.2	13.2	13.4	13.3	14.2
13.9	13.8	13.5	13.5	13.1	13.5	13.9	13.1	13.2

];

colors = [
   [173 216 230]/255;  % 245CN (dark blue)
    [30, 144, 255]/255;  % 245CF (medium blue)
   [135, 206, 250]/255;  % 245HN (darker blue)
  [0, 0, 205]/255;  % 245HF (deep blue)
    [255, 182, 193]/255;  % 585CN (light red)
    [255 0 0]/255;  % 585CF (medium red)
    [250 128 114]/255;  % 585HN (dark red)
    [139, 0, 0]/255;  % 585HF (deep red)
];

% Annual data
% annual = [5.6 7.1 8.1 7.6 9.2 7.3 9.6 8.0 11.5];

% Subtract the historical values (column 1) from the rest
change_monthly = data(:,2:end) - data(:,1);
% change_annual = annual(2:end) - annual(1);

% Scenario labels (excluding Hist)
labels = {'245CN', '245CF', '245HN', '245HF', '585CN', '585CF', '585HN', '585HF'};


hold on;
for s = 1:8
    plot(months, change_monthly(:,s), '-o', ...
        'Color', colors(s,:), 'LineWidth', 1.2);
end
hold off;
xlim([1,12])
xlabel('Month');
ylabel('Change from Historical (months)');
title('(a) MD Frequency Change: NW');
legend(labels, 'Location', 'northwest');
grid on;
box on;
% ylim([0, 9])




% Plot monthly change
subplot(3,2,2)

% Define months
months = 1:12;

% Define data (rows = months, columns = variables)
data = [
13.8	14.2	14.8	13.9	14.1	14.5	14.9	13.7	14.6
13.8	14.8	15.0	14.7	14.4	15.1	15.8	14.7	16.3
13.3	14.9	16.0	15.3	15.8	15.7	17.9	15.7	18.7
12.9	16.2	19.6	17.5	19.6	17.7	22.6	18.1	24.0
12.9	17.9	20.8	18.8	22.6	19.0	23.9	19.7	26.3
12.9	19.6	23.6	22.2	26.5	20.7	27.4	23.1	29.8
13.8	22.5	26.9	25.2	31.7	24.1	33.4	26.4	36.6
12.2	24.4	30.9	27.3	33.8	25.5	35.8	30.3	37.0
12.4	20.4	26.2	24.1	29.3	22.6	29.8	25.7	32.1
13.5	15.4	17.4	16.6	17.7	16.1	18.5	17.2	19.5
13.7	14.3	15.6	14.3	14.9	15.0	16.5	14.7	16.5
14.1	14.7	15.5	14.7	15.1	15.3	16.4	15.0	15.9


];

colors = [
   [173 216 230]/255;  % 245CN (dark blue)
    [30, 144, 255]/255;  % 245CF (medium blue)
   [135, 206, 250]/255;  % 245HN (darker blue)
  [0, 0, 205]/255;  % 245HF (deep blue)
    [255, 182, 193]/255;  % 585CN (light red)
    [255 0 0]/255;  % 585CF (medium red)
    [250 128 114]/255;  % 585HN (dark red)
    [139, 0, 0]/255;  % 585HF (deep red)
];

% Annual data
% annual = [11.1 12.5 13.5 13.0 14.5 12.7 14.9 13.4 16.7];

% Subtract the historical values (column 1) from the rest
change_monthly = data(:,2:end) - data(:,1);
% change_annual = annual(2:end) - annual(1);

% Scenario labels (excluding Hist)
labels = {'245CN', '245CF', '245HN', '245HF', '585CN', '585CF', '585HN', '585HF'};


hold on;
for s = 1:8
    plot(months, change_monthly(:,s), '-o', ...
        'Color', colors(s,:), 'LineWidth', 1.2);
end
hold off;
xlim([1,12])
xlabel('Month');
ylabel('Change from Historical (months)');
title('(b) MD Frequency Change: SW');
% legend(labels, 'Location', 'northwest');
grid on;
box on;
% ylim([0, 9])




% Plot monthly change
subplot(3,2,3)

% Define months
months = 1:12;

% Define data (rows = months, columns = variables)
data = [
13.4	14.0	16.2	14.5	14.8	16.1	17.3	14.4	14.7
13.2	14.8	15.6	13.6	14.7	15.2	18.0	14.3	17.2
13.3	14.5	16.2	16.0	17.3	15.2	19.7	16.4	20.3
12.9	13.6	17.1	15.9	18.7	14.9	19.3	16.1	21.3
13.5	14.9	17.7	16.0	18.2	16.2	19.3	16.7	20.7
13.3	16.6	20.9	17.7	22.0	18.3	24.3	19.6	25.8
12.6	20.1	26.1	21.3	29.0	22.2	32.1	25.0	35.2
12.7	22.9	30.3	25.3	34.1	23.8	36.0	28.7	37.9
12.8	18.8	24.5	23.5	28.9	20.2	29.8	26.1	34.6
13.4	15.5	17.5	17.0	20.1	16.1	19.1	19.1	23.1
13.3	13.2	14.8	14.1	14.9	13.6	14.7	14.9	13.4
13.3	13.4	14.0	13.4	13.2	13.9	14.9	13.5	12.7

];

colors = [
   [173 216 230]/255;  % 245CN (dark blue)
    [30, 144, 255]/255;  % 245CF (medium blue)
   [135, 206, 250]/255;  % 245HN (darker blue)
  [0, 0, 205]/255;  % 245HF (deep blue)
    [255, 182, 193]/255;  % 585CN (light red)
    [255 0 0]/255;  % 585CF (medium red)
    [250 128 114]/255;  % 585HN (dark red)
    [139, 0, 0]/255;  % 585HF (deep red)
];

% Annual data
% annual = [7.6 9.3 10.5 10.0 11.8 9.7 12.3 10.5 14.5];

% Subtract the historical values (column 1) from the rest
change_monthly = data(:,2:end) - data(:,1);
% change_annual = annual(2:end) - annual(1);

% Scenario labels (excluding Hist)
labels = {'245CN', '245CF', '245HN', '245HF', '585CN', '585CF', '585HN', '585HF'};


hold on;
for s = 1:8
    plot(months, change_monthly(:,s), '-o', ...
        'Color', colors(s,:), 'LineWidth', 1.2);
end
hold off;
xlim([1,12])
xlabel('Month');
ylabel('Change from Historical (months)');
title('(c) MD Frequency Change: MW');
% legend(labels, 'Location', 'northwest');
grid on;
box on;




% Plot monthly change
subplot(3,2,4)

% Define months
months = 1:12;

% Define data (rows = months, columns = variables)
data = [
13.5	14.3	15.0	13.8	13.9	14.2	14.3	14.0	12.5
13.0	14.6	14.3	14.2	13.5	14.7	14.4	14.1	14.2
13.5	14.3	14.4	15.3	14.7	14.6	15.8	14.4	14.7
13.9	15.6	16.2	17.0	16.2	16.4	18.5	16.0	18.2
13.3	15.7	16.4	15.8	16.4	15.9	20.3	15.8	19.3
13.3	16.5	18.0	17.3	19.8	17.8	23.6	19.8	28.3
13.2	19.8	22.8	21.6	25.9	20.3	28.7	23.3	32.7
12.5	19.4	24.9	22.9	29.5	19.3	30.0	24.2	33.8
13.5	17.5	21.9	22.1	26.2	17.9	26.1	23.7	31.0
14.5	18.0	19.2	19.3	20.3	18.7	21.2	19.9	23.7
12.6	13.4	14.1	13.5	13.9	13.6	14.4	14.1	14.8
13.6	13.1	14.3	13.7	13.2	14.3	14.5	13.4	11.5

];

colors = [
   [173 216 230]/255;  % 245CN (dark blue)
    [30, 144, 255]/255;  % 245CF (medium blue)
   [135, 206, 250]/255;  % 245HN (darker blue)
  [0, 0, 205]/255;  % 245HF (deep blue)
    [255, 182, 193]/255;  % 585CN (light red)
    [255 0 0]/255;  % 585CF (medium red)
    [250 128 114]/255;  % 585HN (dark red)
    [139, 0, 0]/255;  % 585HF (deep red)
];

% Annual data
% annual = [15.9 17.3 18.2 17.7 19.1 17.5 19.5 18.1 21.1];

% Subtract the historical values (column 1) from the rest
change_monthly = data(:,2:end) - data(:,1);
% change_annual = annual(2:end) - annual(1);

% Scenario labels (excluding Hist)
labels = {'245CN', '245CF', '245HN', '245HF', '585CN', '585CF', '585HN', '585HF'};


hold on;
for s = 1:8
    plot(months, change_monthly(:,s), '-o', ...
        'Color', colors(s,:), 'LineWidth', 1.2);
end
hold off;
xlim([1,12])
xlabel('Month');
ylabel('Change from Historical (months)');
title('(d) MD Frequency Change: GP');
% legend(labels, 'Location', 'northwest');
grid on;
box on;


% Plot monthly change
subplot(3,2,5)

% Define months
months = 1:12;

% Define data (rows = months, columns = variables)
data = [
13.6	13.6	15.6	16.0	17.6	14.9	16.6	14.7	18.2
12.7	12.9	15.5	15.2	18.4	14.2	17.2	15.9	19.0
13.0	13.4	15.4	16.2	18.7	14.9	18.1	16.2	19.8
12.3	13.3	15.2	15.1	17.9	13.7	17.2	15.2	19.6
12.9	12.0	12.9	14.2	15.4	13.1	14.2	15.2	17.7
12.8	11.7	13.7	15.4	16.1	11.7	13.9	14.4	17.2
13.1	13.8	16.9	16.5	19.7	15.7	21.2	14.5	23.5
12.9	15.5	18.7	16.5	22.8	18.3	25.6	16.9	27.2
13.6	14.6	15.9	14.7	17.8	16.0	18.5	14.3	20.4
13.2	14.2	14.0	15.6	16.2	14.7	14.5	15.4	16.5
12.2	12.0	13.4	14.1	13.4	13.9	12.4	13.7	13.4
13.2	13.8	14.7	15.2	15.1	14.4	14.8	13.5	14.0

];

colors = [
   [173 216 230]/255;  % 245CN (dark blue)
    [30, 144, 255]/255;  % 245CF (medium blue)
   [135, 206, 250]/255;  % 245HN (darker blue)
  [0, 0, 205]/255;  % 245HF (deep blue)
    [255, 182, 193]/255;  % 585CN (light red)
    [255 0 0]/255;  % 585CF (medium red)
    [250 128 114]/255;  % 585HN (dark red)
    [139, 0, 0]/255;  % 585HF (deep red)
];

% Annual data
% annual = [8.9 10.4 11.5 11.0 12.5 10.7 12.9 11.4 14.8];

% Subtract the historical values (column 1) from the rest
change_monthly = data(:,2:end) - data(:,1);
% change_annual = annual(2:end) - annual(1);

% Scenario labels (excluding Hist)
labels = {'245CN', '245CF', '245HN', '245HF', '585CN', '585CF', '585HN', '585HF'};


hold on;
for s = 1:8
    plot(months, change_monthly(:,s), '-o', ...
        'Color', colors(s,:), 'LineWidth', 1.2);
end
hold off;
xlim([1,12])
xlabel('Month');
ylabel('Change from Historical (months)');
title('(e) MD Frequency Change: NE');
% legend(labels, 'Location', 'northwest');
grid on;
box on;



% Plot monthly change
subplot(3,2,6)

% Define months
months = 1:12;

% Define data (rows = months, columns = variables)
data = [
12.9	13.8	15.1	13.9	16.4	15.3	16.2	14.9	16.4
13.2	14.3	15.2	15.4	17.6	14.7	16.5	15.6	17.6
13.4	14.3	16.1	16.7	17.9	14.5	17.7	16.4	19.4
13.2	14.5	16.7	15.9	19.0	15.3	19.3	15.7	22.1
13.0	15.7	18.6	17.6	21.6	17.1	22.4	19.0	25.5
13.1	14.6	18.6	17.2	21.2	16.7	22.9	20.1	26.1
13.3	17.7	23.4	20.1	26.1	19.2	28.3	21.8	31.4
12.6	16.9	21.4	19.6	26.1	17.8	29.1	20.4	32.6
12.7	16.0	18.9	17.0	20.6	16.2	22.9	16.5	26.5
13.5	14.5	15.8	17.2	18.8	16.0	17.5	16.9	22.0
13.5	14.5	15.1	15.4	16.6	14.7	16.1	15.9	17.6
12.7	12.7	13.6	14.2	14.7	14.1	15.4	14.2	13.4

];

colors = [
   [173 216 230]/255;  % 245CN (dark blue)
    [30, 144, 255]/255;  % 245CF (medium blue)
   [135, 206, 250]/255;  % 245HN (darker blue)
  [0, 0, 205]/255;  % 245HF (deep blue)
    [255, 182, 193]/255;  % 585CN (light red)
    [255 0 0]/255;  % 585CF (medium red)
    [250 128 114]/255;  % 585HN (dark red)
    [139, 0, 0]/255;  % 585HF (deep red)
];

% Annual data
% annual = [16.0 17.4 18.3 17.8 19.2 17.6 19.7 18.2 21.3];

% Subtract the historical values (column 1) from the rest
change_monthly = data(:,2:end) - data(:,1);
% change_annual = annual(2:end) - annual(1);

% Scenario labels (excluding Hist)
labels = {'245CN', '245CF', '245HN', '245HF', '585CN', '585CF', '585HN', '585HF'};


hold on;
for s = 1:8
    plot(months, change_monthly(:,s), '-o', ...
        'Color', colors(s,:), 'LineWidth', 1.2);
end
hold off;
xlim([1,12])
xlabel('Month');
ylabel('Change from Historical (months)');
title('(f) MD Frequency Change: SE');
% legend(labels, 'Location', 'northwest');
grid on;
box on;


% % Plot annual change
% subplot(3,2,2)
% bar(change_annual);
% set(gca, 'XTickLabel', labels, 'XTick', 1:8, 'XTickLabelRotation', 45);
% ylabel('Annual Change from Historical (°C)');
% title('Annual Temperature Change from Historical');
% grid on;














%% output the plot

fig = gcf;
fig.PaperUnits = 'inches';

% fig.PaperPosition = [0 0 17.7 8];
fig.PaperPosition = [0 0 10 12];
print('ScreenSizeFigure', '-dpng', '-r300')





