%% monthly Tair change (abs diff)

clear all; clc;

% Plot monthly change
subplot(3,2,1)

% Define months
months = 1:12;

% Define data (rows = months, columns = variables)
data = [
8.1	6.4	5.7	5.9	5.0	6.5	5.8	5.2	5.3
8.9	6.9	6.2	5.8	5.4	6.9	6.3	5.9	6.0
11.0	9.2	9.4	9.2	9.7	9.6	11.6	9.5	12.2
12.9	14.4	17.8	16.1	19.7	15.5	21.9	17.3	24.3
13.2	16.8	19.5	18.0	20.7	17.7	21.8	18.8	23.6
10.9	12.6	13.6	12.6	13.4	13.2	14.0	13.2	13.4
10.8	12.9	12.2	11.5	12.4	11.9	13.0	12.1	12.8
10.6	12.0	12.4	11.1	12.1	11.8	12.4	11.9	11.8
12.2	11.8	11.7	12.5	11.6	12.2	11.2	12.1	10.5
10.3	9.3	9.4	9.6	8.6	9.7	8.6	9.4	8.2
12.3	9.8	8.6	9.5	7.9	9.9	7.7	9.1	7.5
9.3	7.9	6.7	7.1	5.7	7.6	6.2	6.6	5.5
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
title('(a) HD Frequency Change: NW');
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
10.2	9.8	10.2	9.4	8.6	10.1	10.0	9.1	9.1
9.6	9.6	9.6	8.9	8.7	9.8	10.1	9.0	9.3
10.9	11.8	12.7	12.1	12.8	12.3	14.8	12.1	15.4
11.7	13.3	15.4	13.8	14.4	14.5	17.1	14.5	16.9
10.5	11.6	12.5	11.9	12.2	12.5	13.9	11.6	14.4
11.8	12.8	13.8	12.9	13.6	13.2	15.0	13.2	15.2
8.4	11.4	13.2	11.8	15.9	12.6	17.0	12.5	20.0
8.6	11.5	13.9	11.8	15.0	11.4	17.1	13.5	18.7
10.2	11.6	15.3	15.2	16.2	13.1	16.5	15.4	18.1
12.0	11.8	11.8	11.7	10.6	11.8	11.2	11.6	10.6
11.4	10.4	10.5	10.2	9.6	10.6	10.7	10.1	9.1
11.5	10.7	10.5	9.8	9.4	10.7	10.7	9.8	9.2



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
title('(b) HD Frequency Change: SW');
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
7.9	7.0	7.7	7.6	7.7	7.6	8.4	7.2	7.2
8.3	7.8	8.6	8.5	8.4	8.4	9.7	8.4	9.3
11.1	11.8	14.3	12.7	15.3	13.1	17.5	13.7	18.0
11.2	12.0	15.7	14.0	16.9	13.4	18.6	14.9	19.2
11.1	12.0	14.7	13.2	14.8	13.2	15.6	13.6	15.3
11.3	12.1	15.2	12.8	14.8	13.4	17.1	14.1	16.7
11.6	14.1	18.6	14.5	19.2	16.2	22.3	17.1	24.9
11.0	15.5	19.9	16.3	21.6	15.7	24.5	18.2	27.7
10.4	12.4	15.4	15.1	18.4	13.1	19.1	16.9	23.5
10.3	10.3	10.6	10.3	10.9	10.5	10.7	11.4	11.6
10.0	8.5	8.3	8.2	7.4	8.7	7.4	8.2	5.3
8.9	7.7	7.8	7.9	7.4	7.9	8.0	7.6	6.6



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
title('(c) HD Frequency Change: MW');
% legend(labels, 'Location', 'northwest');
grid on;
box on;




% Plot monthly change
subplot(3,2,4)

% Define months
months = 1:12;

% Define data (rows = months, columns = variables)
data = [
10.6	9.7	9.9	10.0	9.0	9.6	9.7	9.4	7.3
9.9	10.0	9.5	9.6	8.5	10.1	9.5	9.6	8.1
9.6	9.7	10.2	10.4	9.1	9.9	10.6	9.6	8.5
10.3	10.2	10.0	11.3	9.2	10.2	10.6	10.2	9.1
9.8	10.8	10.2	10.7	9.6	11.1	11.7	10.6	9.7
10.5	11.0	11.3	11.6	11.5	11.9	14.1	12.4	14.1
10.5	13.2	14.2	14.5	15.0	14.0	18.4	15.5	20.9
9.8	13.0	14.8	14.5	17.7	11.7	18.5	15.9	22.7
10.7	11.8	14.2	15.0	16.3	12.1	16.8	15.5	20.9
10.5	11.4	11.6	12.1	11.1	11.8	12.1	12.4	12.1
9.6	8.3	8.0	8.0	6.9	8.3	7.6	8.2	5.3
9.7	8.8	9.1	8.4	7.2	9.0	7.9	8.0	5.2



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
title('(d) HD Frequency Change: GP');
% legend(labels, 'Location', 'northwest');
grid on;
box on;


% Plot monthly change
subplot(3,2,5)

% Define months
months = 1:12;

% Define data (rows = months, columns = variables)
data = [
12.5	10.3	9.6	11.1	10.4	10.8	10.3	9.8	10.1
12.2	10.7	11.3	12.2	13.5	11.6	13.1	11.4	14.5
12.1	13.2	16.7	17.1	21.3	16.0	20.3	16.9	22.5
12.0	11.7	14.1	15.0	17.1	13.3	15.2	14.2	16.5
11.6	9.3	9.2	11.0	10.8	9.8	9.7	11.2	10.5
10.8	8.1	8.9	10.9	10.0	8.1	7.8	9.8	9.9
11.6	9.8	11.5	11.4	13.2	11.1	13.6	10.1	14.6
12.0	11.2	12.6	11.7	15.4	13.2	17.0	12.0	18.9
11.0	10.5	10.9	10.3	11.9	10.8	12.5	9.8	12.9
11.5	10.7	9.7	11.0	11.1	11.2	9.3	10.3	9.5
10.9	9.4	9.5	10.7	9.4	10.9	8.6	10.2	8.3
11.5	9.9	10.0	10.7	10.4	10.6	10.1	9.7	9.3


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
title('(e) HD Frequency Change: NE');
% legend(labels, 'Location', 'northwest');
grid on;
box on;



% Plot monthly change
subplot(3,2,6)

% Define months
months = 1:12;

% Define data (rows = months, columns = variables)
data = [
12.8	13.4	15.1	15.7	17.8	15.1	18.2	15.6	18.5
12.1	13.0	14.2	14.8	18.2	13.9	17.4	15.1	19.6
12.4	12.9	14.3	15.5	18.1	13.4	17.2	15.7	18.8
12.1	12.3	14.1	14.7	16.3	13.3	16.6	14.4	18.0
10.5	10.9	12.4	12.2	14.6	12.1	14.8	13.0	16.2
10.2	10.4	13.0	12.3	14.9	12.1	15.7	14.3	17.8
9.6	10.9	14.6	12.4	16.6	12.1	18.4	13.4	21.4
10.6	12.6	15.7	14.1	19.1	13.2	21.6	14.9	25.9
10.5	11.9	14.2	12.7	15.6	12.4	17.2	12.7	20.4
9.8	10.4	11.4	12.0	13.2	11.6	12.7	11.9	15.3
10.5	11.0	11.9	12.0	13.4	11.6	12.6	12.4	13.7
11.1	11.8	12.9	13.2	14.3	13.4	15.1	13.4	14.8



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
title('(f) HD Frequency Change: SE');
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





