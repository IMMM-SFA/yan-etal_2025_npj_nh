% Define data as 3D array: [region, probability, scenario]
% Regions: NW, SW, MW, GP, NE, SE
% Probabilities: AD|D0-MD, D0-AD|D0-MD, ..., D4-AD|D0-MD
% Scenarios: Hist, 245CN, 245CF, 245HN, 245HF, 585CN, 585CF, 585HN, 585HF

data = zeros(6, 6, 9);

% Data matrix: data(region, probability_type, scenario)

% Region 1: NW
data(1,1,:) = [0.4966, 0.530, 0.542, 0.533, 0.557, 0.532, 0.566, 0.554, 0.588]; % AD|D3-MD
data(1,2,:) = [0.1065, 0.087, 0.061, 0.078, 0.061, 0.073, 0.051, 0.065, 0.042]; % D0-AD|D3-MD
data(1,3,:) = [0.1998, 0.187, 0.160, 0.179, 0.159, 0.178, 0.144, 0.169, 0.128]; % D1-AD|D3-MD
data(1,4,:) = [0.0810, 0.091, 0.096, 0.093, 0.097, 0.096, 0.097, 0.099, 0.095]; % D2-AD|D3-MD
data(1,5,:) = [0.0644, 0.085, 0.105, 0.091, 0.108, 0.094, 0.116, 0.104, 0.125]; % D3-AD|D3-MD
data(1,6,:) = [0.0449, 0.080, 0.120, 0.092, 0.133, 0.091, 0.158, 0.116, 0.198]; % D4-AD|D3-MD

% Region 2: SW
data(2,1,:) = [0.5137, 0.574, 0.608, 0.573, 0.614, 0.577, 0.647, 0.576, 0.670];
data(2,2,:) = [0.0912, 0.088, 0.071, 0.078, 0.084, 0.070, 0.064, 0.079, 0.069];
data(2,3,:) = [0.2101, 0.213, 0.194, 0.199, 0.198, 0.194, 0.180, 0.196, 0.188];
data(2,4,:) = [0.0909, 0.105, 0.114, 0.105, 0.107, 0.111, 0.117, 0.105, 0.121];
data(2,5,:) = [0.0720, 0.093, 0.117, 0.100, 0.109, 0.108, 0.134, 0.102, 0.137];
data(2,6,:) = [0.0495, 0.075, 0.112, 0.091, 0.115, 0.093, 0.152, 0.094, 0.156];

% Region 3: MW
data(3,1,:) = [0.4688, 0.495, 0.593, 0.522, 0.621, 0.519, 0.667, 0.566, 0.681];
data(3,2,:) = [0.0891, 0.054, 0.031, 0.044, 0.028, 0.038, 0.024, 0.030, 0.030];
data(3,3,:) = [0.1848, 0.159, 0.119, 0.142, 0.110, 0.133, 0.095, 0.113, 0.110];
data(3,4,:) = [0.0804, 0.095, 0.102, 0.097, 0.101, 0.097, 0.097, 0.098, 0.104];
data(3,5,:) = [0.0662, 0.096, 0.143, 0.111, 0.153, 0.115, 0.167, 0.138, 0.170];
data(3,6,:) = [0.0483, 0.091, 0.197, 0.128, 0.229, 0.135, 0.284, 0.188, 0.267];

% Region 4: GP
data(4,1,:) = [0.4357, 0.434, 0.459, 0.480, 0.458, 0.445, 0.497, 0.478, 0.504];
data(4,2,:) = [0.1336, 0.087, 0.067, 0.082, 0.066, 0.059, 0.061, 0.061, 0.073];
data(4,3,:) = [0.2000, 0.178, 0.171, 0.189, 0.164, 0.166, 0.162, 0.170, 0.169];
data(4,4,:) = [0.0557, 0.072, 0.085, 0.086, 0.084, 0.086, 0.092, 0.091, 0.088];
data(4,5,:) = [0.0326, 0.057, 0.075, 0.071, 0.077, 0.076, 0.092, 0.083, 0.086];
data(4,6,:) = [0.0138, 0.040, 0.060, 0.051, 0.066, 0.058, 0.090, 0.072, 0.087];

% Region 5: NE
data(5,1,:) = [0.4607, 0.367, 0.378, 0.412, 0.431, 0.401, 0.420, 0.383, 0.450];
data(5,2,:) = [0.1008, 0.076, 0.062, 0.058, 0.038, 0.076, 0.043, 0.066, 0.035];
data(5,3,:) = [0.1902, 0.146, 0.136, 0.139, 0.115, 0.150, 0.120, 0.135, 0.108];
data(5,4,:) = [0.0733, 0.058, 0.064, 0.072, 0.076, 0.065, 0.074, 0.063, 0.077];
data(5,5,:) = [0.0564, 0.047, 0.058, 0.070, 0.088, 0.057, 0.082, 0.058, 0.096];
data(5,6,:) = [0.0400, 0.039, 0.058, 0.074, 0.113, 0.054, 0.101, 0.061, 0.134];

% Region 6: SE
data(6,1,:) = [0.4524, 0.498, 0.581, 0.559, 0.653, 0.533, 0.688, 0.585, 0.737];
data(6,2,:) = [0.1137, 0.097, 0.068, 0.071, 0.043, 0.073, 0.047, 0.066, 0.039];
data(6,3,:) = [0.2014, 0.195, 0.186, 0.190, 0.152, 0.193, 0.165, 0.185, 0.142];
data(6,4,:) = [0.0682, 0.083, 0.109, 0.106, 0.120, 0.102, 0.129, 0.110, 0.126];
data(6,5,:) = [0.0454, 0.069, 0.111, 0.102, 0.154, 0.092, 0.164, 0.113, 0.184];
data(6,6,:) = [0.0236, 0.055, 0.109, 0.090, 0.184, 0.073, 0.182, 0.112, 0.246];



% Calculate percent change relative to Hist (dimension 3 index = 1)
hist_vals = data(:,:,1);
pct_change = 100 * (data - hist_vals) ./ hist_vals;

region_labels = {'NW','SW','MW','GP','NE','SE'};
prob_labels = {'AD|D3-MD','D0-AD|D3-MD','D1-AD|D3-MD','D2-AD|D3-MD','D3-AD|D3-MD','D4-AD|D3-MD'};
scenario_labels = {'245CN','245CF','245HN','245HF','585CN','585CF','585HN','585HF'};

% Define custom colors
% Colors based on U.S. Drought Monitor standards
custom_colors = [
    [0.5, 0.5, 0.5];     % AD|D0-MD - gray
    [1.0, 1.0, 0.0];     % D0 - yellow
    [1.0, 0.84, 0.0];    % D1 - gold (more distinct than light orange)
    [1.0, 0.4, 0.0];     % D2 - darker orange
    [1.0, 0.0, 0.0];     % D3 - red
    [0.55, 0.0, 0.0];    % D4 - dark red
];
figure;
for r = 1:6
    subplot(3,2,r);
    hold on;
%     yline(0, 'k-', 'LineWidth', 1, 'HandleVisibility', 'off'); % horizontal zero line
    for p = 1:6
        plot(1:8, squeeze(pct_change(r,p,2:end)), '-o', ...
             'Color', custom_colors(p,:), ...
             'DisplayName', prob_labels{p}, ...
             'LineWidth', 1);
    end
    xticks(1:8);
    xticklabels(scenario_labels);
    xtickangle(45);
    ylabel('% Change from Hist');
    title(['Region: ', region_labels{r}]);
    if r == 1
        legend('Location','best'); legend boxoff
    end
    grid on;
    hold off; box on;
%     ylim([-50, 200])
end

%% output the plot

fig = gcf;
fig.PaperUnits = 'inches';

% fig.PaperPosition = [0 0 17.7 8];
fig.PaperPosition = [0 0 10 12];
print('ScreenSizeFigure', '-dpng', '-r300')
