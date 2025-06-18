%% monthly Tair change (abs diff)

clear all; clc;

% Plot monthly change
subplot(3,2,1)

% Define months
months = 1:12;

% Define data (rows = months, columns = variables)
data = [
11.3	7.7	6.2	7.2	4.6	7.5	4.7	6.3	3.3
11.2	7.9	6.4	6.9	4.8	8.0	5.1	6.4	4.0
10.9	7.9	7.0	7.3	6.5	7.9	7.4	7.1	7.6
11.1	11.3	13.6	12.3	15.0	11.8	17.1	13.4	18.8
11.5	16.0	18.8	16.8	20.0	16.9	21.7	18.0	23.7
11.2	14.3	16.2	14.3	16.6	15.1	17.7	15.8	19.1
10.8	14.3	16.3	14.8	17.1	15.0	18.2	16.6	19.0
10.6	14.6	16.1	14.9	17.3	14.8	17.7	16.8	18.1
10.3	14.8	15.9	15.5	16.8	14.9	16.5	16.7	16.3
11.3	13.0	13.5	14.0	13.8	13.2	13.2	14.0	13.0
10.7	9.5	9.4	9.9	8.7	9.8	8.5	9.8	8.0
11.2	8.2	7.0	7.4	5.6	7.9	5.6	7.1	4.1


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
title('(a) AD Frequency Change: NW');
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
12.4	12.0	12.7	11.7	11.5	12.3	13.1	11.6	11.6
11.7	11.2	11.6	10.7	10.1	11.3	12.0	10.3	10.9
11.1	11.7	12.6	11.3	11.8	12.3	13.9	11.7	13.5
12.0	14.4	16.2	14.9	16.4	15.2	18.8	15.4	19.2
11.7	14.7	16.6	15.1	16.5	15.5	19.4	15.7	20.1
11.7	15.0	16.3	15.2	17.0	15.7	19.3	15.6	20.1
11.6	15.5	17.6	16.0	18.3	16.3	20.6	16.7	22.5
10.6	15.7	18.6	16.1	19.3	16.7	22.8	17.7	24.0
10.2	15.4	18.8	17.1	19.4	16.8	21.8	17.9	22.6
11.4	14.5	16.5	15.4	16.5	15.0	18.3	16.5	18.1
11.2	12.8	14.1	12.5	13.0	12.8	15.1	13.1	14.3
11.8	11.8	12.6	11.8	11.5	12.1	13.6	11.6	11.8



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
title('(b) AD Frequency Change: SW');
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
11.0	5.5	3.9	4.4	2.6	4.8	2.7	4.0	1.7
11.2	4.3	3.2	3.8	2.3	3.9	2.4	3.3	1.3
11.0	4.8	4.4	4.7	3.8	4.8	4.8	4.5	3.7
10.5	8.8	11.4	10.3	11.7	10.1	13.7	10.7	13.1
10.9	12.6	16.9	14.1	17.4	14.5	19.4	15.6	19.5
10.4	12.7	17.5	13.9	17.6	14.9	20.0	15.8	19.9
10.5	13.9	19.7	15.5	20.6	16.5	24.2	18.2	24.9
10.9	16.8	23.8	17.9	24.8	18.9	28.9	21.2	29.7
10.8	16.9	24.7	20.2	26.7	18.9	29.5	23.4	32.0
11.0	15.4	20.6	18.7	23.4	17.1	25.1	21.4	28.1
10.8	12.3	15.7	13.7	16.6	13.6	17.3	15.8	17.8
10.7	7.5	7.9	7.2	7.1	8.0	7.5	8.2	6.3


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
title('(c) AD Frequency Change: MW');
% legend(labels, 'Location', 'northwest');
grid on;
box on;




% Plot monthly change
subplot(3,2,4)

% Define months
months = 1:12;

% Define data (rows = months, columns = variables)
data = [
11.3	9.6	9.7	10.2	8.5	9.9	9.9	10.1	7.7
11.4	9.2	8.9	9.6	8.0	9.3	9.0	9.4	7.0
11.0	9.9	9.6	10.7	8.7	9.9	9.8	10.0	7.8
11.3	10.8	11.3	11.5	9.7	11.2	11.5	11.0	9.3
11.4	11.3	11.6	12.2	10.1	12.2	12.3	11.0	10.2
11.7	12.2	12.4	13.1	11.3	13.1	13.5	12.1	11.4
11.6	13.0	13.8	13.5	12.8	13.9	15.5	13.6	14.0
11.1	12.7	13.9	14.2	13.5	13.3	16.3	14.2	16.0
11.2	13.3	14.8	15.4	15.7	13.6	17.3	16.2	18.5
12.0	13.8	15.7	16.9	16.9	14.5	18.3	17.5	20.5
11.7	13.3	14.1	15.0	14.5	13.7	16.2	15.5	15.6
11.3	11.3	11.4	12.0	10.7	11.2	12.0	12.6	10.2


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
title('(d) AD Frequency Change: GP');
% legend(labels, 'Location', 'northwest');
grid on;
box on;


% Plot monthly change
subplot(3,2,5)

% Define months
months = 1:12;

% Define data (rows = months, columns = variables)
data = [
11.3	5.5	4.0	5.5	3.9	5.2	3.3	4.2	2.9
11.1	4.1	2.5	4.2	2.2	3.5	1.9	2.9	1.7
10.9	4.0	3.9	4.8	4.0	4.0	3.4	3.7	3.8
10.6	7.2	9.5	10.2	11.9	8.4	11.1	9.5	12.7
10.7	9.0	10.7	11.5	13.2	9.7	12.3	11.3	14.8
10.6	7.9	9.2	11.3	12.1	8.5	10.4	10.8	13.2
10.6	8.2	11.0	12.3	13.8	9.3	12.3	11.4	14.6
11.6	10.0	13.1	13.4	16.4	11.6	16.5	12.5	18.5
11.7	11.2	13.1	13.2	16.5	13.0	17.4	12.0	18.3
11.6	10.7	12.0	12.4	15.4	12.4	14.8	11.4	15.9
11.4	9.4	9.9	11.5	13.0	10.9	11.9	9.9	13.3
10.9	6.7	6.4	7.6	7.8	7.5	6.8	6.7	6.9


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
title('(e) AD Frequency Change: NE');
% legend(labels, 'Location', 'northwest');
grid on;
box on;



% Plot monthly change
subplot(3,2,6)

% Define months
months = 1:12;

% Define data (rows = months, columns = variables)
data = [
11.1	10.4	12.3	12.7	15.1	11.9	15.7	13.1	17.1
10.5	10.0	11.8	12.0	15.1	11.7	15.3	12.7	16.7
10.5	11.1	13.3	13.9	17.2	12.5	16.6	14.1	18.4
10.5	11.4	14.0	14.5	17.9	12.6	17.7	14.3	20.2
10.8	12.3	15.1	15.1	19.3	13.7	19.9	15.9	22.6
11.0	12.4	16.2	15.5	20.3	14.5	21.3	17.5	23.6
11.1	13.2	18.0	16.6	21.7	16.0	23.3	19.0	26.0
11.7	14.5	19.8	18.2	24.1	16.4	26.3	19.4	29.2
11.7	14.8	19.6	17.8	23.5	16.4	26.3	18.8	29.4
11.3	13.8	18.2	16.9	21.7	15.8	24.2	17.6	27.7
11.3	12.9	16.3	15.6	20.0	14.5	21.1	16.3	25.1
11.2	12.3	15.0	14.9	18.3	14.0	19.2	15.3	21.3


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
title('(f) AD Frequency Change: SE');
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





