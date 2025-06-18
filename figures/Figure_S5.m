%% monthly Tair change (abs diff)

clear all; clc;

% Plot monthly change
subplot(3,2,1)

% Define months
months = 1:12;

% Define data (rows = months, columns = variables)
data = [
194	195	197	200	205	193	195	204	205
155	155	159	162	166	155	157	162	163
165	167	168	168	174	165	164	167	169
124	126	123	124	126	123	121	122	122
88	89	87	90	90	86	89	90	90
61	62	62	62	64	62	64	61	68
24	23	24	25	25	24	25	24	29
24	24	25	26	28	25	28	27	34
49	51	53	50	55	51	57	52	64
116	119	120	118	125	118	127	120	131
209	213	215	212	218	212	217	212	219
210	211	215	217	222	214	216	220	223
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
annual = [1420	1435	1447	1454	1497	1427	1459	1462	1517];

% Subtract the historical values (column 1) from the rest
change_monthly = (data(:,2:end) - data(:,1));
change_annual = (annual(2:end) - annual(1))./annual(1)*100;

% Scenario labels (excluding Hist)
labels = {'245CN', '245CF', '245HN', '245HF', '585CN', '585CF', '585HN', '585HF'};

% Plot each bar individually
for i = 1:length(change_annual)
    bar(i, change_annual(i), 'FaceColor', colors(i,:), 'DisplayName', labels{i});hold on;
end


xticks(1:8)
xticklabels(labels)
xlabel('Scenario')
ylabel('Change from Historical (%)');
title('(a) Precip. Change: NW');

% Add legend
legend('Location', 'northwest', 'Orientation', 'vertical');

box on; grid on;



% Plot monthly change
subplot(3,2,2)

% Define months
months = 1:12;

% Define data (rows = months, columns = variables)
data = [
138	139	139	145	155	138	143	151	161
129	128	129	134	143	127	131	135	141
118	117	117	118	124	115	112	118	118
58	57	55	56	57	55	52	56	54
34	33	32	33	33	32	32	34	32
14	14	13	13	14	13	13	14	13
25	21	19	21	16	19	13	19	9
28	24	19	22	17	24	13	20	9
24	23	20	19	19	22	18	19	16
45	48	48	49	53	48	51	48	57
93	96	93	97	100	93	95	97	104
143	146	143	150	153	145	144	151	157

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
annual = [850	845	829	858	884	832	817	862	871];

% Subtract the historical values (column 1) from the rest
change_monthly = data(:,2:end) - data(:,1);
change_annual = (annual(2:end) - annual(1))./annual(1)*100;

% Scenario labels (excluding Hist)
labels = {'245CN', '245CF', '245HN', '245HF', '585CN', '585CF', '585HN', '585HF'};

% Plot each bar individually
for i = 1:length(change_annual)
    bar(i, change_annual(i), 'FaceColor', colors(i,:), 'DisplayName', labels{i});hold on;
end


xticks(1:8)
xticklabels(labels)
xlabel('Scenario')
ylabel('Change from Historical (%)');
title('(b) Precip. Change: SW');
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
44	45	44	45	47	44	45	47	52
48	49	48	49	51	48	48	49	52
70	73	72	70	72	72	69	71	73
90	94	90	91	89	92	91	92	91
105	107	103	108	106	105	106	107	107
87	85	79	85	82	81	76	82	77
64	56	46	57	44	52	36	51	30
51	41	32	39	27	41	22	34	15
56	54	47	47	41	52	40	44	29
63	65	66	65	65	66	67	62	66
57	62	62	64	68	62	67	63	79
51	54	54	55	58	53	55	56	66

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
annual = [786	786	743	774	750	768	721	758	737];

% Subtract the historical values (column 1) from the rest
change_monthly = data(:,2:end) - data(:,1);
change_annual = (annual(2:end) - annual(1))./annual(1)*100;

% Scenario labels (excluding Hist)
labels = {'245CN', '245CF', '245HN', '245HF', '585CN', '585CF', '585HN', '585HF'};

% Plot each bar individually
for i = 1:length(change_annual)
    bar(i, change_annual(i), 'FaceColor', colors(i,:), 'DisplayName', labels{i});hold on;
end


xticks(1:8)
xticklabels(labels)
xlabel('Scenario')
ylabel('Change from Historical (%)');
title('(c) Precip. Change: MW');
% legend(labels, 'Location', 'northwest');
grid on;
box on;
% ylim([0, 9])




% Plot monthly change
subplot(3,2,4)

% Define months
months = 1:12;

% Define data (rows = months, columns = variables)
data = [
   44	49	50	50	56	49	56	51	69
48	51	57	52	60	52	61	55	68
59	63	67	62	71	64	69	67	81
59	61	63	62	67	62	66	65	73
80	79	84	82	89	79	78	83	88
61	59	58	57	57	56	52	56	46
56	50	47	49	43	50	38	46	30
55	49	45	44	38	53	38	42	27
60	61	54	50	50	59	50	50	40
65	66	68	64	68	64	68	66	67
50	56	59	56	65	57	66	57	74
47	53	54	55	63	52	60	56	78

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
annual = [685	697	707	685	727	696	701	693	743];

% Subtract the historical values (column 1) from the rest
change_monthly = data(:,2:end) - data(:,1);
change_annual = (annual(2:end) - annual(1))./annual(1)*100;

% Scenario labels (excluding Hist)
labels = {'245CN', '245CF', '245HN', '245HF', '585CN', '585CF', '585HN', '585HF'};

% Plot each bar individually
for i = 1:length(change_annual)
    bar(i, change_annual(i), 'FaceColor', colors(i,:), 'DisplayName', labels{i});hold on;
end


xticks(1:8)
xticklabels(labels)
xlabel('Scenario')
ylabel('Change from Historical (%)');
title('(d) Precip. Change: GP');
% legend(labels, 'Location', 'northwest');
grid on;
box on;
% ylim([0, 9])



% Plot monthly change
subplot(3,2,5)

% Define months
months = 1:12;

% Define data (rows = months, columns = variables)
data = [
84	86	86	81	81	85	85	86	85
83	85	82	80	76	83	79	80	78
107	111	108	104	102	108	106	105	105
112	116	114	112	110	116	114	113	113
129	138	141	132	136	135	144	132	140
127	144	142	132	140	144	153	140	151
129	139	136	136	135	136	126	149	131
108	113	110	116	102	107	94	117	93
103	110	112	113	112	106	113	118	114
88	93	99	94	97	92	106	95	110
87	94	95	91	98	90	100	93	104
92	94	94	92	95	92	96	96	104

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
annual = [1249	1323	1319	1285	1287	1296	1316	1325	1328];

% Subtract the historical values (column 1) from the rest
change_monthly = data(:,2:end) - data(:,1);
change_annual = (annual(2:end) - annual(1))./annual(1)*100;

% Scenario labels (excluding Hist)
labels = {'245CN', '245CF', '245HN', '245HF', '585CN', '585CF', '585HN', '585HF'};

% Plot each bar individually
for i = 1:length(change_annual)
    bar(i, change_annual(i), 'FaceColor', colors(i,:), 'DisplayName', labels{i});hold on;
end


xticks(1:8)
xticklabels(labels)
xlabel('Scenario')
ylabel('Change from Historical (%)');
title('(e) Precip. Change: NE');
% legend(labels, 'Location', 'northwest');
grid on;
box on;
% ylim([0, 9])



% Plot monthly change
subplot(3,2,6)

% Define months
months = 1:12;

% Define data (rows = months, columns = variables)
data = [
104	107	107	106	103	104	107	105	111
102	104	104	101	97	103	103	102	103
117	121	119	114	115	119	118	116	119
109	111	108	107	103	109	102	109	100
119	117	113	114	105	115	103	111	99
144	146	136	139	130	138	124	128	117
150	148	129	144	125	143	111	144	99
139	133	122	131	109	132	93	129	79
116	117	112	118	112	114	103	118	95
95	99	100	94	93	96	100	96	92
96	101	100	96	101	99	103	97	106
106	109	111	107	112	107	110	109	123

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
annual = [1398	1413	1361	1372	1303	1378	1279	1364	1244];

% Subtract the historical values (column 1) from the rest
change_monthly = data(:,2:end) - data(:,1);
change_annual = (annual(2:end) - annual(1))./annual(1)*100;

% Scenario labels (excluding Hist)
labels = {'245CN', '245CF', '245HN', '245HF', '585CN', '585CF', '585HN', '585HF'};

% Plot each bar individually
for i = 1:length(change_annual)
    bar(i, change_annual(i), 'FaceColor', colors(i,:), 'DisplayName', labels{i});hold on;
end


xticks(1:8)
xticklabels(labels)
xlabel('Scenario')
ylabel('Change from Historical (%)');
title('(f) Precip. Change: SE');
% legend(labels, 'Location', 'northwest');
grid on;
box on;
% ylim([0, 9])



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





