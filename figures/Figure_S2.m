%% monthly Tair change (abs diff)

clear all; clc;

% Plot monthly change
subplot(3,2,1)

% Define months
months = 1:12;

% Define data (rows = months, columns = variables)
data = [
    -2.3	-0.9	-0.1	-0.8	0.8	-0.9	1.0	-0.4	2.8;
    -1.9	-0.7	0.2	-0.3	1.2	-0.6	1.3	0.0	3.2;
     0.4	1.7	2.6	2.2	3.7	1.8	3.8	2.4	5.5;
     3.4	4.8	5.8	5.2	6.8	4.9	7.1	5.5	8.7;
     8.0	9.5	10.3	9.9	11.3	9.6	11.8	10.3	13.3;
    11.8	13.3	14.2	13.8	15.3	13.5	15.8	14.2	17.7;
    15.7	17.3	18.5	18.1	19.7	17.7	20.3	18.6	22.5;
    15.7	17.5	18.6	18.2	20.2	17.8	20.6	18.9	23.0;
    12.1	13.9	15.0	14.4	16.3	14.1	16.8	15.1	19.0;
     6.5	8.2	9.2	8.7	10.4	8.5	10.9	9.1	12.7;
     0.7	2.2	3.2	2.8	4.1	2.3	4.6	3.1	6.5;
    -2.8	-1.5	-0.4	-1.0	0.5	-1.2	0.8	-0.6	2.6
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
annual = [5.6 7.1 8.1 7.6 9.2 7.3 9.6 8.0 11.5];

% Subtract the historical values (column 1) from the rest
change_monthly = data(:,2:end) - data(:,1);
change_annual = annual(2:end) - annual(1);

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
ylabel('Change from Historical (°C)');
title('(a) Tair Change: NW');
legend(labels, 'Location', 'northwest');
grid on;
box on;
ylim([0, 9])


% Plot monthly change
subplot(3,2,2)

% Define months
months = 1:12;

% Define data (rows = months, columns = variables)
data = [
    3.4  4.7  5.5  5.0  6.6  4.8  6.7  5.5  8.5;
    3.8  5.1  5.9  5.6  7.1  5.2  6.9  5.9  8.9;
    5.8  7.1  7.9  7.6  9.0  7.2  9.0  7.9 10.8;
    8.8 10.2 10.9 10.4 11.8 10.3 12.3 10.7 13.8;
   12.9 14.2 15.0 14.7 16.0 14.4 16.5 15.1 18.0;
   17.6 19.0 19.9 19.6 20.9 19.2 21.4 19.9 23.1;
   20.6 22.2 23.3 22.8 24.3 22.5 24.9 23.2 26.6;
   20.0 21.7 22.8 22.3 24.0 22.0 24.5 22.8 26.4;
   17.4 19.1 20.2 19.6 21.3 19.3 21.8 20.1 23.7;
   12.4 14.1 15.1 14.7 16.3 14.4 16.9 15.1 18.8;
    6.8  8.4  9.4  9.0 10.4  8.5 10.9  9.3 12.9;
    3.3  4.6  5.6  5.2  6.7  4.9  6.9  5.6  8.8
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
annual = [11.1 12.5 13.5 13.0 14.5 12.7 14.9 13.4 16.7];

% Subtract the historical values (column 1) from the rest
change_monthly = data(:,2:end) - data(:,1);
change_annual = annual(2:end) - annual(1);

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
ylabel('Change from Historical (°C)');
title('(b) Tair Change: SW');
% legend(labels, 'Location', 'northwest');
grid on;
box on;
ylim([0, 9])





% Plot monthly change
subplot(3,2,3)

% Define months
months = 1:12;

% Define data (rows = months, columns = variables)
data = [
   -8.0  -5.9  -4.7  -5.7  -3.5  -5.5  -3.0  -4.9  -1.0;
   -6.1  -4.2  -3.0  -4.1  -2.0  -3.8  -1.2  -3.5   0.7;
    0.0   1.6   2.8   2.2   3.8   1.9   4.4   2.5   6.2;
    7.2   8.6   9.8   9.1  10.7   8.9  11.2   9.5  12.8;
   13.9  15.4  16.4  15.7  17.2  15.7  18.0  16.2  19.5;
   19.4  21.1  22.2  21.7  23.3  21.4  23.9  22.2  26.0;
   22.4  24.2  25.5  25.0  26.9  24.6  27.5  25.6  29.9;
   21.5  23.4  24.8  24.4  26.5  23.7  26.9  25.0  29.6;
   16.5  18.3  19.7  19.5  21.5  18.7  21.7  20.1  24.6;
    8.9  10.6  11.8  11.7  13.6  11.0  13.5  12.1  16.5;
    1.1   2.6   3.8   3.6   5.2   2.9   5.4   4.0   7.7;
   -5.7  -4.0  -2.8  -3.3  -1.5  -3.6  -1.1  -2.7   1.0
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
annual = [7.6 9.3 10.5 10.0 11.8 9.7 12.3 10.5 14.5];

% Subtract the historical values (column 1) from the rest
change_monthly = data(:,2:end) - data(:,1);
change_annual = annual(2:end) - annual(1);

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
ylabel('Change from Historical (°C)');
title('(c) Tair Change: MW');
% legend(labels, 'Location', 'northwest');
grid on;
box on;
ylim([0, 9])




% Plot monthly change
subplot(3,2,4)

% Define months
months = 1:12;

% Define data (rows = months, columns = variables)
data = [
    5.0   6.4   7.2   6.5   8.0   6.6   8.3   7.3   9.9;
    7.0   8.3   9.1   8.5   9.8   8.5  10.1   8.9  11.4;
   11.1  12.4  13.0  12.6  13.7  12.5  14.0  12.8  15.3;
   15.6  16.9  17.7  17.2  18.4  17.1  18.9  17.5  20.2;
   20.2  21.6  22.4  22.0  23.2  21.8  23.9  22.3  25.1;
   24.6  26.0  26.9  26.5  27.9  26.3  28.4  26.8  29.9;
   26.0  27.5  28.5  28.0  29.4  27.8  30.1  28.4  31.6;
   25.7  27.3  28.3  27.7  29.2  27.6  29.8  28.2  31.3;
   22.4  23.9  24.9  24.5  26.0  24.2  26.5  24.9  28.2;
   16.6  18.1  19.2  18.9  20.5  18.4  20.8  19.3  23.1;
   10.5  11.9  12.9  12.6  14.1  12.1  14.3  13.0  16.5;
    5.8   7.0   7.8   7.6   8.9   7.3   9.1   8.1  11.0
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
annual = [15.9 17.3 18.2 17.7 19.1 17.5 19.5 18.1 21.1];

% Subtract the historical values (column 1) from the rest
change_monthly = data(:,2:end) - data(:,1);
change_annual = annual(2:end) - annual(1);

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
ylabel('Change from Historical (°C)');
title('(d) Tair Change: GP');
% legend(labels, 'Location', 'northwest');
grid on;
box on;
ylim([0, 9])



% Plot monthly change
subplot(3,2,5)

% Define months
months = 1:12;

% Define data (rows = months, columns = variables)
data = [
   -4.8  -3.3  -2.0  -2.9  -1.1  -2.7  -0.7  -2.0   0.9;
   -3.3  -1.8  -0.5  -1.4   0.3  -1.3   0.8  -0.8   2.3;
    1.4   2.8   3.9   3.3   4.8   3.1   5.3   3.7   6.7;
    8.5   9.9  10.9  10.3  11.7  10.1  12.3  10.7  13.7;
   14.6  16.0  17.0  16.3  17.7  16.2  18.4  16.7  19.9;
   19.2  20.7  21.7  21.1  22.6  20.9  23.2  21.6  24.9;
   21.5  23.1  24.1  23.7  25.4  23.3  25.7  24.2  27.8;
   20.5  22.1  23.2  22.9  24.6  22.3  24.9  23.2  27.1;
   16.6  18.1  19.2  19.0  20.7  18.4  21.0  19.4  23.4;
   10.2  11.6  12.8  12.6  14.3  12.0  14.3  13.1  17.1;
    3.9   5.4   6.5   6.1   7.7   5.6   7.9   6.6  10.0;
   -1.7  -0.4   0.7   0.3   1.8   0.1   2.1   0.9   3.9
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
annual = [8.9 10.4 11.5 11.0 12.5 10.7 12.9 11.4 14.8];

% Subtract the historical values (column 1) from the rest
change_monthly = data(:,2:end) - data(:,1);
change_annual = annual(2:end) - annual(1);

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
ylabel('Change from Historical (°C)');
title('(e) Tair Change: NE');
% legend(labels, 'Location', 'northwest');
grid on;
box on;
ylim([0, 9])



% Plot monthly change
subplot(3,2,6)

% Define months
months = 1:12;

% Define data (rows = months, columns = variables)
data = [
    5.0   6.2   7.2   6.4   7.7   6.6   8.2   7.2   9.4;
    7.2   8.5   9.4   8.5   9.7   8.8  10.3   9.0  11.3;
   11.2  12.5  13.2  12.6  13.7  12.5  14.3  12.9  15.3;
   15.9  17.2  18.0  17.5  18.7  17.4  19.2  17.8  20.6;
   20.5  21.8  22.7  22.2  23.5  22.0  24.1  22.5  25.6;
   24.3  25.7  26.6  26.1  27.6  25.9  28.1  26.5  29.8;
   25.8  27.3  28.3  27.8  29.4  27.6  29.9  28.2  31.6;
   25.3  26.8  27.9  27.4  29.0  27.1  29.6  27.8  31.4;
   22.2  23.7  24.8  24.5  26.1  24.0  26.5  24.9  28.6;
   16.7  18.2  19.3  19.0  20.6  18.4  20.9  19.4  23.3;
   11.2  12.6  13.6  13.2  14.7  12.7  15.0  13.6  16.9;
    6.8   8.0   8.8   8.4   9.8   8.3  10.1   9.0  11.6
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
annual = [16.0 17.4 18.3 17.8 19.2 17.6 19.7 18.2 21.3];

% Subtract the historical values (column 1) from the rest
change_monthly = data(:,2:end) - data(:,1);
change_annual = annual(2:end) - annual(1);

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
ylabel('Change from Historical (°C)');
title('(f) Tair Change: SE');
% legend(labels, 'Location', 'northwest');
grid on;
box on;
ylim([0, 9])



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





