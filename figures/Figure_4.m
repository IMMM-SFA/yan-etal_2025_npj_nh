clear all; clc

label_size = 11; line_width = 1;   box_width = 0.5;
title_size = 10; tick_size = 10; text_size = 10;  
scatter_size = 10;  legend_size = 10;  colorbar_size= 10;

p_ag_hist = [0.515	0.522	0.482	0.449	0.471	0.466];
p_hy_hist = [0.709	0.770	0.683	0.774	0.773	0.702];

p_ag_45_c_n = [0.546	0.584	0.502	0.443	0.374	0.512];
p_hy_45_c_n = [0.712	0.786	0.705	0.764	0.730	0.720];

p_ag_45_c_f = [0.555	0.623	0.601	0.468	0.385	0.594];
p_hy_45_c_f = [0.724	0.829	0.758	0.763	0.738	0.761];

p_ag_45_h_n = [0.547	0.585	0.530	0.490	0.420	0.571];
p_hy_45_h_n = [0.715	0.803	0.713	0.770	0.762	0.748];

p_ag_45_h_f = [0.573	0.637	0.631	0.468	0.438	0.665];
p_hy_45_h_f = [0.732	0.843	0.768	0.764	0.772	0.804];

p_ag_85_c_n = [0.546	0.588	0.525	0.451	0.409	0.543];
p_hy_85_c_n = [0.720	0.804	0.708	0.760	0.764	0.738];

p_ag_85_c_f = [0.582	0.671	0.679	0.509	0.428	0.702];
p_hy_85_c_f = [0.743	0.869	0.812	0.799	0.769	0.821];

p_ag_85_h_n = [0.567	0.590	0.575	0.484	0.392	0.596];
p_hy_85_h_n = [0.723	0.814	0.737	0.773	0.742	0.763];

p_ag_85_h_f = [0.605	0.705	0.701	0.522	0.460	0.756];
p_hy_85_h_f = [0.748	0.876	0.816	0.790	0.774	0.851];


ag_hist   = load('D1_meteo2agri_density_h.txt');
ag_45_c_n = load('D1_meteo2agri_density_45_c_n.txt');
ag_45_c_f = load('D1_meteo2agri_density_45_c_f.txt');
ag_45_h_n = load('D1_meteo2agri_density_45_h_n.txt');
ag_45_h_f = load('D1_meteo2agri_density_45_h_f.txt');
ag_85_c_n = load('D1_meteo2agri_density_85_c_n.txt');
ag_85_c_f = load('D1_meteo2agri_density_85_c_f.txt');
ag_85_h_n = load('D1_meteo2agri_density_85_h_n.txt');
ag_85_h_f = load('D1_meteo2agri_density_85_h_f.txt');

hy_hist = load('D1_meteo2hydro_density_h.txt');
hy_45_c_n = load('D1_meteo2hydro_density_45_c_n.txt');
hy_45_c_f = load('D1_meteo2hydro_density_45_c_f.txt');
hy_45_h_n = load('D1_meteo2hydro_density_45_h_n.txt');
hy_45_h_f = load('D1_meteo2hydro_density_45_h_f.txt');
hy_85_c_n = load('D1_meteo2hydro_density_85_c_n.txt');
hy_85_c_f = load('D1_meteo2hydro_density_85_c_f.txt');
hy_85_h_n = load('D1_meteo2hydro_density_85_h_n.txt');
hy_85_h_f = load('D1_meteo2hydro_density_85_h_f.txt');

x = ag_hist(:,1);
%%

% 1 - agri C1-NW

subplot(4,3,1)

c = 1;

% scaling factor
a = [p_ag_hist(c), p_ag_45_c_n(c), p_ag_45_c_f(c), p_ag_45_h_n(c), p_ag_45_h_f(c), ...
    p_ag_85_c_n(c), p_ag_85_c_f(c), p_ag_85_h_n(c), p_ag_85_h_f(c)];

b = ag_hist(:, c+1);
f1 = ag_45_c_n(:, c+1);
f2 = ag_45_c_f(:, c+1);
f3 = ag_45_h_n(:, c+1);
f4 = ag_45_h_f(:, c+1);
f5 = ag_85_c_n(:, c+1);
f6 = ag_85_c_f(:, c+1);
f7 = ag_85_h_n(:, c+1);
f8 = ag_85_h_f(:, c+1);

% Smooth the density functions
smoothed_b = smooth(b, 0.05, 'lowess');
smoothed_f1 = smooth(f1, 0.05, 'lowess');
smoothed_f2 = smooth(f2, 0.05, 'lowess');
smoothed_f3 = smooth(f3, 0.05, 'lowess');
smoothed_f4 = smooth(f4, 0.05, 'lowess');
smoothed_f5 = smooth(f5, 0.05, 'lowess');
smoothed_f6 = smooth(f6, 0.05, 'lowess');
smoothed_f7 = smooth(f7, 0.05, 'lowess');
smoothed_f8 = smooth(f8, 0.05, 'lowess');

% Calculate the CDFs using cumulative sums
cdf_b = cumtrapz(x, smoothed_b);
cdf_f1 = cumtrapz(x, smoothed_f1);
cdf_f2 = cumtrapz(x, smoothed_f2);
cdf_f3 = cumtrapz(x, smoothed_f3);
cdf_f4 = cumtrapz(x, smoothed_f4);
cdf_f5 = cumtrapz(x, smoothed_f5);
cdf_f6 = cumtrapz(x, smoothed_f6);
cdf_f7 = cumtrapz(x, smoothed_f7);
cdf_f8 = cumtrapz(x, smoothed_f8);

% Scale the CDFs by their respective probabilities
scaled_cdf_b  = a(1) * cdf_b / max(cdf_b);
scaled_cdf_f1 = a(2) * cdf_f1 / max(cdf_f1);
scaled_cdf_f2 = a(3) * cdf_f2 / max(cdf_f2);
scaled_cdf_f3 = a(4) * cdf_f3 / max(cdf_f3);
scaled_cdf_f4 = a(5) * cdf_f4 / max(cdf_f4);
scaled_cdf_f5 = a(6) * cdf_f5 / max(cdf_f5);
scaled_cdf_f6 = a(7) * cdf_f6 / max(cdf_f6);
scaled_cdf_f7 = a(8) * cdf_f7 / max(cdf_f7);
scaled_cdf_f8 = a(9) * cdf_f8 / max(cdf_f8);

% Plot the scaled CDFs
plot(x, scaled_cdf_b,  'Color', [0 0 0], 'LineWidth', line_width+1); hold on;

plot(x, scaled_cdf_f1, 'Color', [173 216 230]/255, 'LineWidth', line_width); hold on;
plot(x, scaled_cdf_f2, 'Color', [30, 144, 255]/255, 'LineWidth', line_width); hold on;
plot(x, scaled_cdf_f3, 'Color', [135, 206, 250]/255, 'LineWidth', line_width); hold on;
plot(x, scaled_cdf_f4, 'Color', [0, 0, 205]/255, 'LineWidth', line_width); hold on;

plot(x, scaled_cdf_f5, 'Color', [255, 182, 193]/255, 'LineWidth', line_width); hold on;
plot(x, scaled_cdf_f6, 'Color', [255 0 0]/255, 'LineWidth', line_width); hold on;
plot(x, scaled_cdf_f7, 'Color', [250 128 114]/255, 'LineWidth', line_width); hold on;
plot(x, scaled_cdf_f8, 'Color', [139, 0, 0]/255, 'LineWidth', line_width); hold on;

xlim([-2.2,-0.5]);
ylim([0, 0.7])
grid on;

xticks = [-2.0, -1.6, -1.3, -0.8, -0.5];
xticklabels = {'-2.0', '-1.6', '-1.3', '-0.8', '-0.5'};
ax = gca; % Get current axes
ax.XTick = xticks;
ax.XTickLabel = xticklabels;


% Add vertical line 
% xline(-0.5, 'Color', [255 215 0]/255, 'LineWidth',line_width+1, 'LineStyle', '--');
% xline(-0.8, 'Color', [222 184 135]/255, 'LineWidth',line_width+1, 'LineStyle', '--');
% xline(-1.3, 'Color', [255 140 0]/255, 'LineWidth',line_width+1, 'LineStyle', '--');
% xline(-1.6, 'Color', [255 0 0]/255, 'LineWidth',line_width+1, 'LineStyle', '--');
% xline(-2.0, 'Color', [139 0 0]/255, 'LineWidth',line_width+1, 'LineStyle', '--');

% xline(-0.5, 'Color', [0 0 0]/255, 'LineWidth',line_width, 'LineStyle', '--');
xline(-0.8, 'Color', [0 0 0]/255, 'LineWidth',line_width, 'LineStyle', '--');
xline(-1.3, 'Color', [0 0 0]/255, 'LineWidth',line_width, 'LineStyle', '--');
xline(-1.6, 'Color', [0 0 0]/255, 'LineWidth',line_width, 'LineStyle', '--');
xline(-2.0, 'Color', [0 0 0]/255, 'LineWidth',line_width, 'LineStyle', '--');

text(0.88, 0.95, 'D0', 'FontSize', text_size, 'FontWeight','bold', 'Units', 'normalized')
text(0.65, 0.95, 'D1', 'FontSize', text_size, 'FontWeight','bold', 'Units', 'normalized')
text(0.42, 0.95, 'D2', 'FontSize', text_size, 'FontWeight','bold', 'Units', 'normalized')
text(0.23, 0.95, 'D3', 'FontSize', text_size, 'FontWeight','bold', 'Units', 'normalized')
text(0.05, 0.95, 'D4', 'FontSize', text_size, 'FontWeight','bold', 'Units', 'normalized')
text(0.80, 0.10, '(a1) NW', 'FontSize', text_size, 'FontWeight','bold', 'Units', 'normalized')
% legend('Hist.', 'SSP245COLD_NEAR', 'SSP245COLD_FAR', 'SSP245HOT_NEAR', 'SSP245HOT_FAR', ...
%     'SSP585COLD_NEAR', 'SSP585COLD_FAR', 'SSP585HOT_NEAR', 'SSP585HOT_FAR');
set(gca,'FontSize',tick_size);

% xlabel('April Root-Zone Soil Moisture', 'FontSize', label_size); 
ylabel('Probability', 'FontSize', label_size); 


% --------------------------------------------------------------------------------------------------
% 2 - agri C2-SW
subplot(4,3,2)

c = 2;

% scaling factor
a = [p_ag_hist(c), p_ag_45_c_n(c), p_ag_45_c_f(c), p_ag_45_h_n(c), p_ag_45_h_f(c), ...
    p_ag_85_c_n(c), p_ag_85_c_f(c), p_ag_85_h_n(c), p_ag_85_h_f(c)];

b = ag_hist(:, c+1);
f1 = ag_45_c_n(:, c+1);
f2 = ag_45_c_f(:, c+1);
f3 = ag_45_h_n(:, c+1);
f4 = ag_45_h_f(:, c+1);
f5 = ag_85_c_n(:, c+1);
f6 = ag_85_c_f(:, c+1);
f7 = ag_85_h_n(:, c+1);
f8 = ag_85_h_f(:, c+1);

% Smooth the density functions
smoothed_b = smooth(b, 0.05, 'lowess');
smoothed_f1 = smooth(f1, 0.05, 'lowess');
smoothed_f2 = smooth(f2, 0.05, 'lowess');
smoothed_f3 = smooth(f3, 0.05, 'lowess');
smoothed_f4 = smooth(f4, 0.05, 'lowess');
smoothed_f5 = smooth(f5, 0.05, 'lowess');
smoothed_f6 = smooth(f6, 0.05, 'lowess');
smoothed_f7 = smooth(f7, 0.05, 'lowess');
smoothed_f8 = smooth(f8, 0.05, 'lowess');

% Calculate the CDFs using cumulative sums
cdf_b = cumtrapz(x, smoothed_b);
cdf_f1 = cumtrapz(x, smoothed_f1);
cdf_f2 = cumtrapz(x, smoothed_f2);
cdf_f3 = cumtrapz(x, smoothed_f3);
cdf_f4 = cumtrapz(x, smoothed_f4);
cdf_f5 = cumtrapz(x, smoothed_f5);
cdf_f6 = cumtrapz(x, smoothed_f6);
cdf_f7 = cumtrapz(x, smoothed_f7);
cdf_f8 = cumtrapz(x, smoothed_f8);

% Scale the CDFs by their respective probabilities
scaled_cdf_b  = a(1) * cdf_b / max(cdf_b);
scaled_cdf_f1 = a(2) * cdf_f1 / max(cdf_f1);
scaled_cdf_f2 = a(3) * cdf_f2 / max(cdf_f2);
scaled_cdf_f3 = a(4) * cdf_f3 / max(cdf_f3);
scaled_cdf_f4 = a(5) * cdf_f4 / max(cdf_f4);
scaled_cdf_f5 = a(6) * cdf_f5 / max(cdf_f5);
scaled_cdf_f6 = a(7) * cdf_f6 / max(cdf_f6);
scaled_cdf_f7 = a(8) * cdf_f7 / max(cdf_f7);
scaled_cdf_f8 = a(9) * cdf_f8 / max(cdf_f8);

% Plot the scaled CDFs
plot(x, scaled_cdf_b,  'Color', [0 0 0], 'LineWidth', line_width+1); hold on;

plot(x, scaled_cdf_f1, 'Color', [173 216 230]/255, 'LineWidth', line_width); hold on;
plot(x, scaled_cdf_f2, 'Color', [30, 144, 255]/255, 'LineWidth', line_width); hold on;
plot(x, scaled_cdf_f3, 'Color', [135, 206, 250]/255, 'LineWidth', line_width); hold on;
plot(x, scaled_cdf_f4, 'Color', [0, 0, 205]/255, 'LineWidth', line_width); hold on;

plot(x, scaled_cdf_f5, 'Color', [255, 182, 193]/255, 'LineWidth', line_width); hold on;
plot(x, scaled_cdf_f6, 'Color', [255 0 0]/255, 'LineWidth', line_width); hold on;
plot(x, scaled_cdf_f7, 'Color', [250 128 114]/255, 'LineWidth', line_width); hold on;
plot(x, scaled_cdf_f8, 'Color', [139, 0, 0]/255, 'LineWidth', line_width); hold on;

xlim([-2.2,-0.5]);
ylim([0, 0.7])
grid on;

xticks = [-2.0, -1.6, -1.3, -0.8, -0.5];
xticklabels = {'-2.0', '-1.6', '-1.3', '-0.8', '-0.5'};
ax = gca; % Get current axes
ax.XTick = xticks;
ax.XTickLabel = xticklabels;


% Add vertical line 
% xline(-0.5, 'Color', [255 215 0]/255, 'LineWidth',line_width+1, 'LineStyle', '--');
% xline(-0.8, 'Color', [222 184 135]/255, 'LineWidth',line_width+1, 'LineStyle', '--');
% xline(-1.3, 'Color', [255 140 0]/255, 'LineWidth',line_width+1, 'LineStyle', '--');
% xline(-1.6, 'Color', [255 0 0]/255, 'LineWidth',line_width+1, 'LineStyle', '--');
% xline(-2.0, 'Color', [139 0 0]/255, 'LineWidth',line_width+1, 'LineStyle', '--');

% xline(-0.5, 'Color', [0 0 0]/255, 'LineWidth',line_width, 'LineStyle', '--');
xline(-0.8, 'Color', [0 0 0]/255, 'LineWidth',line_width, 'LineStyle', '--');
xline(-1.3, 'Color', [0 0 0]/255, 'LineWidth',line_width, 'LineStyle', '--');
xline(-1.6, 'Color', [0 0 0]/255, 'LineWidth',line_width, 'LineStyle', '--');
xline(-2.0, 'Color', [0 0 0]/255, 'LineWidth',line_width, 'LineStyle', '--');

text(0.88, 0.95, 'D0', 'FontSize', text_size, 'FontWeight','bold', 'Units', 'normalized')
text(0.65, 0.95, 'D1', 'FontSize', text_size, 'FontWeight','bold', 'Units', 'normalized')
text(0.42, 0.95, 'D2', 'FontSize', text_size, 'FontWeight','bold', 'Units', 'normalized')
text(0.23, 0.95, 'D3', 'FontSize', text_size, 'FontWeight','bold', 'Units', 'normalized')
text(0.05, 0.95, 'D4', 'FontSize', text_size, 'FontWeight','bold', 'Units', 'normalized')
text(0.80, 0.10, '(a2) SW', 'FontSize', text_size, 'FontWeight','bold', 'Units', 'normalized')
% legend('Hist.', 'SSP245COLD_NEAR', 'SSP245COLD_FAR', 'SSP245HOT_NEAR', 'SSP245HOT_FAR', ...
%     'SSP585COLD_NEAR', 'SSP585COLD_FAR', 'SSP585HOT_NEAR', 'SSP585HOT_FAR');
set(gca,'FontSize',tick_size);

% xlabel('April Root-Zone Soil Moisture', 'FontSize', label_size); 
% ylabel('Probability', 'FontSize', label_size); 



% --------------------------------------------------------------------------------------------------
% 3 - agri C3-MW
subplot(4,3,3)

c = 3;

% scaling factor
a = [p_ag_hist(c), p_ag_45_c_n(c), p_ag_45_c_f(c), p_ag_45_h_n(c), p_ag_45_h_f(c), ...
    p_ag_85_c_n(c), p_ag_85_c_f(c), p_ag_85_h_n(c), p_ag_85_h_f(c)];

b = ag_hist(:, c+1);
f1 = ag_45_c_n(:, c+1);
f2 = ag_45_c_f(:, c+1);
f3 = ag_45_h_n(:, c+1);
f4 = ag_45_h_f(:, c+1);
f5 = ag_85_c_n(:, c+1);
f6 = ag_85_c_f(:, c+1);
f7 = ag_85_h_n(:, c+1);
f8 = ag_85_h_f(:, c+1);

% Smooth the density functions
smoothed_b = smooth(b, 0.05, 'lowess');
smoothed_f1 = smooth(f1, 0.05, 'lowess');
smoothed_f2 = smooth(f2, 0.05, 'lowess');
smoothed_f3 = smooth(f3, 0.05, 'lowess');
smoothed_f4 = smooth(f4, 0.05, 'lowess');
smoothed_f5 = smooth(f5, 0.05, 'lowess');
smoothed_f6 = smooth(f6, 0.05, 'lowess');
smoothed_f7 = smooth(f7, 0.05, 'lowess');
smoothed_f8 = smooth(f8, 0.05, 'lowess');

% Calculate the CDFs using cumulative sums
cdf_b = cumtrapz(x, smoothed_b);
cdf_f1 = cumtrapz(x, smoothed_f1);
cdf_f2 = cumtrapz(x, smoothed_f2);
cdf_f3 = cumtrapz(x, smoothed_f3);
cdf_f4 = cumtrapz(x, smoothed_f4);
cdf_f5 = cumtrapz(x, smoothed_f5);
cdf_f6 = cumtrapz(x, smoothed_f6);
cdf_f7 = cumtrapz(x, smoothed_f7);
cdf_f8 = cumtrapz(x, smoothed_f8);

% Scale the CDFs by their respective probabilities
scaled_cdf_b  = a(1) * cdf_b / max(cdf_b);
scaled_cdf_f1 = a(2) * cdf_f1 / max(cdf_f1);
scaled_cdf_f2 = a(3) * cdf_f2 / max(cdf_f2);
scaled_cdf_f3 = a(4) * cdf_f3 / max(cdf_f3);
scaled_cdf_f4 = a(5) * cdf_f4 / max(cdf_f4);
scaled_cdf_f5 = a(6) * cdf_f5 / max(cdf_f5);
scaled_cdf_f6 = a(7) * cdf_f6 / max(cdf_f6);
scaled_cdf_f7 = a(8) * cdf_f7 / max(cdf_f7);
scaled_cdf_f8 = a(9) * cdf_f8 / max(cdf_f8);

% Plot the scaled CDFs
plot(x, scaled_cdf_b,  'Color', [0 0 0], 'LineWidth', line_width+1); hold on;

plot(x, scaled_cdf_f1, 'Color', [173 216 230]/255, 'LineWidth', line_width); hold on;
plot(x, scaled_cdf_f2, 'Color', [30, 144, 255]/255, 'LineWidth', line_width); hold on;
plot(x, scaled_cdf_f3, 'Color', [135, 206, 250]/255, 'LineWidth', line_width); hold on;
plot(x, scaled_cdf_f4, 'Color', [0, 0, 205]/255, 'LineWidth', line_width); hold on;

plot(x, scaled_cdf_f5, 'Color', [255, 182, 193]/255, 'LineWidth', line_width); hold on;
plot(x, scaled_cdf_f6, 'Color', [255 0 0]/255, 'LineWidth', line_width); hold on;
plot(x, scaled_cdf_f7, 'Color', [250 128 114]/255, 'LineWidth', line_width); hold on;
plot(x, scaled_cdf_f8, 'Color', [139, 0, 0]/255, 'LineWidth', line_width); hold on;

xlim([-2.2,-0.5]);
ylim([0, 0.7])
grid on;

xticks = [-2.0, -1.6, -1.3, -0.8, -0.5];
xticklabels = {'-2.0', '-1.6', '-1.3', '-0.8', '-0.5'};
ax = gca; % Get current axes
ax.XTick = xticks;
ax.XTickLabel = xticklabels;


% Add vertical line 
% xline(-0.5, 'Color', [255 215 0]/255, 'LineWidth',line_width+1, 'LineStyle', '--');
% xline(-0.8, 'Color', [222 184 135]/255, 'LineWidth',line_width+1, 'LineStyle', '--');
% xline(-1.3, 'Color', [255 140 0]/255, 'LineWidth',line_width+1, 'LineStyle', '--');
% xline(-1.6, 'Color', [255 0 0]/255, 'LineWidth',line_width+1, 'LineStyle', '--');
% xline(-2.0, 'Color', [139 0 0]/255, 'LineWidth',line_width+1, 'LineStyle', '--');

% xline(-0.5, 'Color', [0 0 0]/255, 'LineWidth',line_width, 'LineStyle', '--');
xline(-0.8, 'Color', [0 0 0]/255, 'LineWidth',line_width, 'LineStyle', '--');
xline(-1.3, 'Color', [0 0 0]/255, 'LineWidth',line_width, 'LineStyle', '--');
xline(-1.6, 'Color', [0 0 0]/255, 'LineWidth',line_width, 'LineStyle', '--');
xline(-2.0, 'Color', [0 0 0]/255, 'LineWidth',line_width, 'LineStyle', '--');

text(0.88, 0.95, 'D0', 'FontSize', text_size, 'FontWeight','bold', 'Units', 'normalized')
text(0.65, 0.95, 'D1', 'FontSize', text_size, 'FontWeight','bold', 'Units', 'normalized')
text(0.42, 0.95, 'D2', 'FontSize', text_size, 'FontWeight','bold', 'Units', 'normalized')
text(0.23, 0.95, 'D3', 'FontSize', text_size, 'FontWeight','bold', 'Units', 'normalized')
text(0.05, 0.95, 'D4', 'FontSize', text_size, 'FontWeight','bold', 'Units', 'normalized')
text(0.80, 0.10, '(a3) MW', 'FontSize', text_size, 'FontWeight','bold', 'Units', 'normalized')
% legend('Hist.', 'SSP245COLD_NEAR', 'SSP245COLD_FAR', 'SSP245HOT_NEAR', 'SSP245HOT_FAR', ...
%     'SSP585COLD_NEAR', 'SSP585COLD_FAR', 'SSP585HOT_NEAR', 'SSP585HOT_FAR');
set(gca,'FontSize',tick_size);

% xlabel('April Root-Zone Soil Moisture', 'FontSize', label_size); 
% ylabel('Probability', 'FontSize', label_size); 



% --------------------------------------------------------------------------------------------------
% 4 - agri C4-GP
subplot(4,3,4)

c = 4;

% scaling factor
a = [p_ag_hist(c), p_ag_45_c_n(c), p_ag_45_c_f(c), p_ag_45_h_n(c), p_ag_45_h_f(c), ...
    p_ag_85_c_n(c), p_ag_85_c_f(c), p_ag_85_h_n(c), p_ag_85_h_f(c)];

b = ag_hist(:, c+1);
f1 = ag_45_c_n(:, c+1);
f2 = ag_45_c_f(:, c+1);
f3 = ag_45_h_n(:, c+1);
f4 = ag_45_h_f(:, c+1);
f5 = ag_85_c_n(:, c+1);
f6 = ag_85_c_f(:, c+1);
f7 = ag_85_h_n(:, c+1);
f8 = ag_85_h_f(:, c+1);

% Smooth the density functions
smoothed_b = smooth(b, 0.05, 'lowess');
smoothed_f1 = smooth(f1, 0.05, 'lowess');
smoothed_f2 = smooth(f2, 0.05, 'lowess');
smoothed_f3 = smooth(f3, 0.05, 'lowess');
smoothed_f4 = smooth(f4, 0.05, 'lowess');
smoothed_f5 = smooth(f5, 0.05, 'lowess');
smoothed_f6 = smooth(f6, 0.05, 'lowess');
smoothed_f7 = smooth(f7, 0.05, 'lowess');
smoothed_f8 = smooth(f8, 0.05, 'lowess');

% Calculate the CDFs using cumulative sums
cdf_b = cumtrapz(x, smoothed_b);
cdf_f1 = cumtrapz(x, smoothed_f1);
cdf_f2 = cumtrapz(x, smoothed_f2);
cdf_f3 = cumtrapz(x, smoothed_f3);
cdf_f4 = cumtrapz(x, smoothed_f4);
cdf_f5 = cumtrapz(x, smoothed_f5);
cdf_f6 = cumtrapz(x, smoothed_f6);
cdf_f7 = cumtrapz(x, smoothed_f7);
cdf_f8 = cumtrapz(x, smoothed_f8);

% Scale the CDFs by their respective probabilities
scaled_cdf_b  = a(1) * cdf_b / max(cdf_b);
scaled_cdf_f1 = a(2) * cdf_f1 / max(cdf_f1);
scaled_cdf_f2 = a(3) * cdf_f2 / max(cdf_f2);
scaled_cdf_f3 = a(4) * cdf_f3 / max(cdf_f3);
scaled_cdf_f4 = a(5) * cdf_f4 / max(cdf_f4);
scaled_cdf_f5 = a(6) * cdf_f5 / max(cdf_f5);
scaled_cdf_f6 = a(7) * cdf_f6 / max(cdf_f6);
scaled_cdf_f7 = a(8) * cdf_f7 / max(cdf_f7);
scaled_cdf_f8 = a(9) * cdf_f8 / max(cdf_f8);

% Plot the scaled CDFs
plot(x, scaled_cdf_b,  'Color', [0 0 0], 'LineWidth', line_width+1); hold on;

plot(x, scaled_cdf_f1, 'Color', [173 216 230]/255, 'LineWidth', line_width); hold on;
plot(x, scaled_cdf_f2, 'Color', [30, 144, 255]/255, 'LineWidth', line_width); hold on;
plot(x, scaled_cdf_f3, 'Color', [135, 206, 250]/255, 'LineWidth', line_width); hold on;
plot(x, scaled_cdf_f4, 'Color', [0, 0, 205]/255, 'LineWidth', line_width); hold on;

plot(x, scaled_cdf_f5, 'Color', [255, 182, 193]/255, 'LineWidth', line_width); hold on;
plot(x, scaled_cdf_f6, 'Color', [255 0 0]/255, 'LineWidth', line_width); hold on;
plot(x, scaled_cdf_f7, 'Color', [250 128 114]/255, 'LineWidth', line_width); hold on;
plot(x, scaled_cdf_f8, 'Color', [139, 0, 0]/255, 'LineWidth', line_width); hold on;

xlim([-2.2,-0.5]);
ylim([0, 0.7])
grid on;

xticks = [-2.0, -1.6, -1.3, -0.8, -0.5];
xticklabels = {'-2.0', '-1.6', '-1.3', '-0.8', '-0.5'};
ax = gca; % Get current axes
ax.XTick = xticks;
ax.XTickLabel = xticklabels;


% Add vertical line 
% xline(-0.5, 'Color', [255 215 0]/255, 'LineWidth',line_width+1, 'LineStyle', '--');
% xline(-0.8, 'Color', [222 184 135]/255, 'LineWidth',line_width+1, 'LineStyle', '--');
% xline(-1.3, 'Color', [255 140 0]/255, 'LineWidth',line_width+1, 'LineStyle', '--');
% xline(-1.6, 'Color', [255 0 0]/255, 'LineWidth',line_width+1, 'LineStyle', '--');
% xline(-2.0, 'Color', [139 0 0]/255, 'LineWidth',line_width+1, 'LineStyle', '--');

% xline(-0.5, 'Color', [0 0 0]/255, 'LineWidth',line_width, 'LineStyle', '--');
xline(-0.8, 'Color', [0 0 0]/255, 'LineWidth',line_width, 'LineStyle', '--');
xline(-1.3, 'Color', [0 0 0]/255, 'LineWidth',line_width, 'LineStyle', '--');
xline(-1.6, 'Color', [0 0 0]/255, 'LineWidth',line_width, 'LineStyle', '--');
xline(-2.0, 'Color', [0 0 0]/255, 'LineWidth',line_width, 'LineStyle', '--');

text(0.88, 0.95, 'D0', 'FontSize', text_size, 'FontWeight','bold', 'Units', 'normalized')
text(0.65, 0.95, 'D1', 'FontSize', text_size, 'FontWeight','bold', 'Units', 'normalized')
text(0.42, 0.95, 'D2', 'FontSize', text_size, 'FontWeight','bold', 'Units', 'normalized')
text(0.23, 0.95, 'D3', 'FontSize', text_size, 'FontWeight','bold', 'Units', 'normalized')
text(0.05, 0.95, 'D4', 'FontSize', text_size, 'FontWeight','bold', 'Units', 'normalized')
text(0.80, 0.10, '(a4) GP', 'FontSize', text_size, 'FontWeight','bold', 'Units', 'normalized')
% legend('Hist.', 'SSP245COLD_NEAR', 'SSP245COLD_FAR', 'SSP245HOT_NEAR', 'SSP245HOT_FAR', ...
%     'SSP585COLD_NEAR', 'SSP585COLD_FAR', 'SSP585HOT_NEAR', 'SSP585HOT_FAR');
set(gca,'FontSize',tick_size);

% xlabel('April Root-Zone Soil Moisture', 'FontSize', label_size); 
ylabel('Probability', 'FontSize', label_size); 





% --------------------------------------------------------------------------------------------------
% 5 - agri C5-NE
subplot(4,3,5)

c = 5;

% scaling factor
a = [p_ag_hist(c), p_ag_45_c_n(c), p_ag_45_c_f(c), p_ag_45_h_n(c), p_ag_45_h_f(c), ...
    p_ag_85_c_n(c), p_ag_85_c_f(c), p_ag_85_h_n(c), p_ag_85_h_f(c)];

b = ag_hist(:, c+1);
f1 = ag_45_c_n(:, c+1);
f2 = ag_45_c_f(:, c+1);
f3 = ag_45_h_n(:, c+1);
f4 = ag_45_h_f(:, c+1);
f5 = ag_85_c_n(:, c+1);
f6 = ag_85_c_f(:, c+1);
f7 = ag_85_h_n(:, c+1);
f8 = ag_85_h_f(:, c+1);

% Smooth the density functions
smoothed_b = smooth(b, 0.05, 'lowess');
smoothed_f1 = smooth(f1, 0.05, 'lowess');
smoothed_f2 = smooth(f2, 0.05, 'lowess');
smoothed_f3 = smooth(f3, 0.05, 'lowess');
smoothed_f4 = smooth(f4, 0.05, 'lowess');
smoothed_f5 = smooth(f5, 0.05, 'lowess');
smoothed_f6 = smooth(f6, 0.05, 'lowess');
smoothed_f7 = smooth(f7, 0.05, 'lowess');
smoothed_f8 = smooth(f8, 0.05, 'lowess');

% Calculate the CDFs using cumulative sums
cdf_b = cumtrapz(x, smoothed_b);
cdf_f1 = cumtrapz(x, smoothed_f1);
cdf_f2 = cumtrapz(x, smoothed_f2);
cdf_f3 = cumtrapz(x, smoothed_f3);
cdf_f4 = cumtrapz(x, smoothed_f4);
cdf_f5 = cumtrapz(x, smoothed_f5);
cdf_f6 = cumtrapz(x, smoothed_f6);
cdf_f7 = cumtrapz(x, smoothed_f7);
cdf_f8 = cumtrapz(x, smoothed_f8);

% Scale the CDFs by their respective probabilities
scaled_cdf_b  = a(1) * cdf_b / max(cdf_b);
scaled_cdf_f1 = a(2) * cdf_f1 / max(cdf_f1);
scaled_cdf_f2 = a(3) * cdf_f2 / max(cdf_f2);
scaled_cdf_f3 = a(4) * cdf_f3 / max(cdf_f3);
scaled_cdf_f4 = a(5) * cdf_f4 / max(cdf_f4);
scaled_cdf_f5 = a(6) * cdf_f5 / max(cdf_f5);
scaled_cdf_f6 = a(7) * cdf_f6 / max(cdf_f6);
scaled_cdf_f7 = a(8) * cdf_f7 / max(cdf_f7);
scaled_cdf_f8 = a(9) * cdf_f8 / max(cdf_f8);

% Plot the scaled CDFs
plot(x, scaled_cdf_b,  'Color', [0 0 0], 'LineWidth', line_width+1); hold on;

plot(x, scaled_cdf_f1, 'Color', [173 216 230]/255, 'LineWidth', line_width); hold on;
plot(x, scaled_cdf_f2, 'Color', [30, 144, 255]/255, 'LineWidth', line_width); hold on;
plot(x, scaled_cdf_f3, 'Color', [135, 206, 250]/255, 'LineWidth', line_width); hold on;
plot(x, scaled_cdf_f4, 'Color', [0, 0, 205]/255, 'LineWidth', line_width); hold on;

plot(x, scaled_cdf_f5, 'Color', [255, 182, 193]/255, 'LineWidth', line_width); hold on;
plot(x, scaled_cdf_f6, 'Color', [255 0 0]/255, 'LineWidth', line_width); hold on;
plot(x, scaled_cdf_f7, 'Color', [250 128 114]/255, 'LineWidth', line_width); hold on;
plot(x, scaled_cdf_f8, 'Color', [139, 0, 0]/255, 'LineWidth', line_width); hold on;

xlim([-2.2,-0.5]);
ylim([0, 0.7])
grid on;

xticks = [-2.0, -1.6, -1.3, -0.8, -0.5];
xticklabels = {'-2.0', '-1.6', '-1.3', '-0.8', '-0.5'};
ax = gca; % Get current axes
ax.XTick = xticks;
ax.XTickLabel = xticklabels;


% Add vertical line 
% xline(-0.5, 'Color', [255 215 0]/255, 'LineWidth',line_width+1, 'LineStyle', '--');
% xline(-0.8, 'Color', [222 184 135]/255, 'LineWidth',line_width+1, 'LineStyle', '--');
% xline(-1.3, 'Color', [255 140 0]/255, 'LineWidth',line_width+1, 'LineStyle', '--');
% xline(-1.6, 'Color', [255 0 0]/255, 'LineWidth',line_width+1, 'LineStyle', '--');
% xline(-2.0, 'Color', [139 0 0]/255, 'LineWidth',line_width+1, 'LineStyle', '--');

% xline(-0.5, 'Color', [0 0 0]/255, 'LineWidth',line_width, 'LineStyle', '--');
xline(-0.8, 'Color', [0 0 0]/255, 'LineWidth',line_width, 'LineStyle', '--');
xline(-1.3, 'Color', [0 0 0]/255, 'LineWidth',line_width, 'LineStyle', '--');
xline(-1.6, 'Color', [0 0 0]/255, 'LineWidth',line_width, 'LineStyle', '--');
xline(-2.0, 'Color', [0 0 0]/255, 'LineWidth',line_width, 'LineStyle', '--');

text(0.88, 0.95, 'D0', 'FontSize', text_size, 'FontWeight','bold', 'Units', 'normalized')
text(0.65, 0.95, 'D1', 'FontSize', text_size, 'FontWeight','bold', 'Units', 'normalized')
text(0.42, 0.95, 'D2', 'FontSize', text_size, 'FontWeight','bold', 'Units', 'normalized')
text(0.23, 0.95, 'D3', 'FontSize', text_size, 'FontWeight','bold', 'Units', 'normalized')
text(0.05, 0.95, 'D4', 'FontSize', text_size, 'FontWeight','bold', 'Units', 'normalized')
text(0.80, 0.10, '(a5) NE', 'FontSize', text_size, 'FontWeight','bold', 'Units', 'normalized')
% legend('Hist.', 'SSP245COLD_NEAR', 'SSP245COLD_FAR', 'SSP245HOT_NEAR', 'SSP245HOT_FAR', ...
%     'SSP585COLD_NEAR', 'SSP585COLD_FAR', 'SSP585HOT_NEAR', 'SSP585HOT_FAR');
set(gca,'FontSize',tick_size);

% xlabel('April Root-Zone Soil Moisture', 'FontSize', label_size); 
% ylabel('Probability', 'FontSize', label_size); 


% --------------------------------------------------------------------------------------------------
% 6 - agri C6-SE
subplot(4,3,6)

c = 6;

% scaling factor
a = [p_ag_hist(c), p_ag_45_c_n(c), p_ag_45_c_f(c), p_ag_45_h_n(c), p_ag_45_h_f(c), ...
    p_ag_85_c_n(c), p_ag_85_c_f(c), p_ag_85_h_n(c), p_ag_85_h_f(c)];

b = ag_hist(:, c+1);
f1 = ag_45_c_n(:, c+1);
f2 = ag_45_c_f(:, c+1);
f3 = ag_45_h_n(:, c+1);
f4 = ag_45_h_f(:, c+1);
f5 = ag_85_c_n(:, c+1);
f6 = ag_85_c_f(:, c+1);
f7 = ag_85_h_n(:, c+1);
f8 = ag_85_h_f(:, c+1);

% Smooth the density functions
smoothed_b = smooth(b, 0.05, 'lowess');
smoothed_f1 = smooth(f1, 0.05, 'lowess');
smoothed_f2 = smooth(f2, 0.05, 'lowess');
smoothed_f3 = smooth(f3, 0.05, 'lowess');
smoothed_f4 = smooth(f4, 0.05, 'lowess');
smoothed_f5 = smooth(f5, 0.05, 'lowess');
smoothed_f6 = smooth(f6, 0.05, 'lowess');
smoothed_f7 = smooth(f7, 0.05, 'lowess');
smoothed_f8 = smooth(f8, 0.05, 'lowess');

% Calculate the CDFs using cumulative sums
cdf_b = cumtrapz(x, smoothed_b);
cdf_f1 = cumtrapz(x, smoothed_f1);
cdf_f2 = cumtrapz(x, smoothed_f2);
cdf_f3 = cumtrapz(x, smoothed_f3);
cdf_f4 = cumtrapz(x, smoothed_f4);
cdf_f5 = cumtrapz(x, smoothed_f5);
cdf_f6 = cumtrapz(x, smoothed_f6);
cdf_f7 = cumtrapz(x, smoothed_f7);
cdf_f8 = cumtrapz(x, smoothed_f8);

% Scale the CDFs by their respective probabilities
scaled_cdf_b  = a(1) * cdf_b / max(cdf_b);
scaled_cdf_f1 = a(2) * cdf_f1 / max(cdf_f1);
scaled_cdf_f2 = a(3) * cdf_f2 / max(cdf_f2);
scaled_cdf_f3 = a(4) * cdf_f3 / max(cdf_f3);
scaled_cdf_f4 = a(5) * cdf_f4 / max(cdf_f4);
scaled_cdf_f5 = a(6) * cdf_f5 / max(cdf_f5);
scaled_cdf_f6 = a(7) * cdf_f6 / max(cdf_f6);
scaled_cdf_f7 = a(8) * cdf_f7 / max(cdf_f7);
scaled_cdf_f8 = a(9) * cdf_f8 / max(cdf_f8);

% Plot the scaled CDFs
plot(x, scaled_cdf_b,  'Color', [0 0 0], 'LineWidth', line_width+1); hold on;

plot(x, scaled_cdf_f1, 'Color', [173 216 230]/255, 'LineWidth', line_width); hold on;
plot(x, scaled_cdf_f2, 'Color', [30, 144, 255]/255, 'LineWidth', line_width); hold on;
plot(x, scaled_cdf_f3, 'Color', [135, 206, 250]/255, 'LineWidth', line_width); hold on;
plot(x, scaled_cdf_f4, 'Color', [0, 0, 205]/255, 'LineWidth', line_width); hold on;

plot(x, scaled_cdf_f5, 'Color', [255, 182, 193]/255, 'LineWidth', line_width); hold on;
plot(x, scaled_cdf_f6, 'Color', [255 0 0]/255, 'LineWidth', line_width); hold on;
plot(x, scaled_cdf_f7, 'Color', [250 128 114]/255, 'LineWidth', line_width); hold on;
plot(x, scaled_cdf_f8, 'Color', [139, 0, 0]/255, 'LineWidth', line_width); hold on;

xlim([-2.2,-0.5]);
ylim([0, 0.7])
grid on;

xticks = [-2.0, -1.6, -1.3, -0.8, -0.5];
xticklabels = {'-2.0', '-1.6', '-1.3', '-0.8', '-0.5'};
ax = gca; % Get current axes
ax.XTick = xticks;
ax.XTickLabel = xticklabels;


% Add vertical line 
% xline(-0.5, 'Color', [255 215 0]/255, 'LineWidth',line_width+1, 'LineStyle', '--');
% xline(-0.8, 'Color', [222 184 135]/255, 'LineWidth',line_width+1, 'LineStyle', '--');
% xline(-1.3, 'Color', [255 140 0]/255, 'LineWidth',line_width+1, 'LineStyle', '--');
% xline(-1.6, 'Color', [255 0 0]/255, 'LineWidth',line_width+1, 'LineStyle', '--');
% xline(-2.0, 'Color', [139 0 0]/255, 'LineWidth',line_width+1, 'LineStyle', '--');

% xline(-0.5, 'Color', [0 0 0]/255, 'LineWidth',line_width, 'LineStyle', '--');
xline(-0.8, 'Color', [0 0 0]/255, 'LineWidth',line_width, 'LineStyle', '--');
xline(-1.3, 'Color', [0 0 0]/255, 'LineWidth',line_width, 'LineStyle', '--');
xline(-1.6, 'Color', [0 0 0]/255, 'LineWidth',line_width, 'LineStyle', '--');
xline(-2.0, 'Color', [0 0 0]/255, 'LineWidth',line_width, 'LineStyle', '--');

text(0.88, 0.95, 'D0', 'FontSize', text_size, 'FontWeight','bold', 'Units', 'normalized')
text(0.65, 0.95, 'D1', 'FontSize', text_size, 'FontWeight','bold', 'Units', 'normalized')
text(0.42, 0.95, 'D2', 'FontSize', text_size, 'FontWeight','bold', 'Units', 'normalized')
text(0.23, 0.95, 'D3', 'FontSize', text_size, 'FontWeight','bold', 'Units', 'normalized')
text(0.05, 0.95, 'D4', 'FontSize', text_size, 'FontWeight','bold', 'Units', 'normalized')
text(0.80, 0.10, '(a6) SE', 'FontSize', text_size, 'FontWeight','bold', 'Units', 'normalized')
% legend('Hist.', 'SSP245COLD_NEAR', 'SSP245COLD_FAR', 'SSP245HOT_NEAR', 'SSP245HOT_FAR', ...
%     'SSP585COLD_NEAR', 'SSP585COLD_FAR', 'SSP585HOT_NEAR', 'SSP585HOT_FAR');
set(gca,'FontSize',tick_size);

% xlabel('April Root-Zone Soil Moisture', 'FontSize', label_size); 
% ylabel('Probability', 'FontSize', label_size); 





% ------------------------------------------------------------------------------------------------------------------
% ------------------------------------------------------------------------------------------------------------------
% 1 - hydro C1-NW

subplot(4,3,7)

c = 1;

% scaling factor
a = [p_hy_hist(c), p_hy_45_c_n(c), p_hy_45_c_f(c), p_hy_45_h_n(c), p_hy_45_h_f(c), ...
    p_hy_85_c_n(c), p_hy_85_c_f(c), p_hy_85_h_n(c), p_hy_85_h_f(c)];

b  = hy_hist(:, c+1);
f1 = hy_45_c_n(:, c+1);
f2 = hy_45_c_f(:, c+1);
f3 = hy_45_h_n(:, c+1);
f4 = hy_45_h_f(:, c+1);
f5 = hy_85_c_n(:, c+1);
f6 = hy_85_c_f(:, c+1);
f7 = hy_85_h_n(:, c+1);
f8 = hy_85_h_f(:, c+1);

% Smooth the density functions
smoothed_b = smooth(b, 0.05, 'lowess');
smoothed_f1 = smooth(f1, 0.05, 'lowess');
smoothed_f2 = smooth(f2, 0.05, 'lowess');
smoothed_f3 = smooth(f3, 0.05, 'lowess');
smoothed_f4 = smooth(f4, 0.05, 'lowess');
smoothed_f5 = smooth(f5, 0.05, 'lowess');
smoothed_f6 = smooth(f6, 0.05, 'lowess');
smoothed_f7 = smooth(f7, 0.05, 'lowess');
smoothed_f8 = smooth(f8, 0.05, 'lowess');

% Calculate the CDFs using cumulative sums
cdf_b = cumtrapz(x, smoothed_b);
cdf_f1 = cumtrapz(x, smoothed_f1);
cdf_f2 = cumtrapz(x, smoothed_f2);
cdf_f3 = cumtrapz(x, smoothed_f3);
cdf_f4 = cumtrapz(x, smoothed_f4);
cdf_f5 = cumtrapz(x, smoothed_f5);
cdf_f6 = cumtrapz(x, smoothed_f6);
cdf_f7 = cumtrapz(x, smoothed_f7);
cdf_f8 = cumtrapz(x, smoothed_f8);

% Scale the CDFs by their respective probabilities
scaled_cdf_b  = a(1) * cdf_b / max(cdf_b);
scaled_cdf_f1 = a(2) * cdf_f1 / max(cdf_f1);
scaled_cdf_f2 = a(3) * cdf_f2 / max(cdf_f2);
scaled_cdf_f3 = a(4) * cdf_f3 / max(cdf_f3);
scaled_cdf_f4 = a(5) * cdf_f4 / max(cdf_f4);
scaled_cdf_f5 = a(6) * cdf_f5 / max(cdf_f5);
scaled_cdf_f6 = a(7) * cdf_f6 / max(cdf_f6);
scaled_cdf_f7 = a(8) * cdf_f7 / max(cdf_f7);
scaled_cdf_f8 = a(9) * cdf_f8 / max(cdf_f8);

% Plot the scaled CDFs
plot(x, scaled_cdf_b,  'Color', [0 0 0], 'LineWidth', line_width+1); hold on;

plot(x, scaled_cdf_f1, 'Color', [173 216 230]/255, 'LineWidth', line_width); hold on;
plot(x, scaled_cdf_f2, 'Color', [30, 144, 255]/255, 'LineWidth', line_width); hold on;
plot(x, scaled_cdf_f3, 'Color', [135, 206, 250]/255, 'LineWidth', line_width); hold on;
plot(x, scaled_cdf_f4, 'Color', [0, 0, 205]/255, 'LineWidth', line_width); hold on;

plot(x, scaled_cdf_f5, 'Color', [255, 182, 193]/255, 'LineWidth', line_width); hold on;
plot(x, scaled_cdf_f6, 'Color', [255 0 0]/255, 'LineWidth', line_width); hold on;
plot(x, scaled_cdf_f7, 'Color', [250 128 114]/255, 'LineWidth', line_width); hold on;
plot(x, scaled_cdf_f8, 'Color', [139, 0, 0]/255, 'LineWidth', line_width); hold on;

xlim([-2.2,-0.5]);
ylim([0, 0.9])
grid on;

xticks = [-2.0, -1.6, -1.3, -0.8, -0.5];
xticklabels = {'-2.0', '-1.6', '-1.3', '-0.8', '-0.5'};
ax = gca; % Get current axes
ax.XTick = xticks;
ax.XTickLabel = xticklabels;


% Add vertical line 
% xline(-0.5, 'Color', [255 215 0]/255, 'LineWidth',line_width+1, 'LineStyle', '--');
% xline(-0.8, 'Color', [222 184 135]/255, 'LineWidth',line_width+1, 'LineStyle', '--');
% xline(-1.3, 'Color', [255 140 0]/255, 'LineWidth',line_width+1, 'LineStyle', '--');
% xline(-1.6, 'Color', [255 0 0]/255, 'LineWidth',line_width+1, 'LineStyle', '--');
% xline(-2.0, 'Color', [139 0 0]/255, 'LineWidth',line_width+1, 'LineStyle', '--');

% xline(-0.5, 'Color', [0 0 0]/255, 'LineWidth',line_width, 'LineStyle', '--');
xline(-0.8, 'Color', [0 0 0]/255, 'LineWidth',line_width, 'LineStyle', '--');
xline(-1.3, 'Color', [0 0 0]/255, 'LineWidth',line_width, 'LineStyle', '--');
xline(-1.6, 'Color', [0 0 0]/255, 'LineWidth',line_width, 'LineStyle', '--');
xline(-2.0, 'Color', [0 0 0]/255, 'LineWidth',line_width, 'LineStyle', '--');

text(0.88, 0.95, 'D0', 'FontSize', text_size, 'FontWeight','bold', 'Units', 'normalized')
text(0.65, 0.95, 'D1', 'FontSize', text_size, 'FontWeight','bold', 'Units', 'normalized')
text(0.42, 0.95, 'D2', 'FontSize', text_size, 'FontWeight','bold', 'Units', 'normalized')
text(0.23, 0.95, 'D3', 'FontSize', text_size, 'FontWeight','bold', 'Units', 'normalized')
text(0.05, 0.95, 'D4', 'FontSize', text_size, 'FontWeight','bold', 'Units', 'normalized')
text(0.80, 0.10, '(b1) NW', 'FontSize', text_size, 'FontWeight','bold', 'Units', 'normalized')
% legend('Hist.', 'SSP245COLD_NEAR', 'SSP245COLD_FAR', 'SSP245HOT_NEAR', 'SSP245HOT_FAR', ...
%     'SSP585COLD_NEAR', 'SSP585COLD_FAR', 'SSP585HOT_NEAR', 'SSP585HOT_FAR');
set(gca,'FontSize',tick_size);

% xlabel('April Root-Zone Soil Moisture', 'FontSize', label_size); 
ylabel('Probability', 'FontSize', label_size); 



% ------------------------------------------------------------------------------------------------------------------
% 2 - hydro C2-SW

subplot(4,3,8)

c = 2;

% scaling factor
a = [p_hy_hist(c), p_hy_45_c_n(c), p_hy_45_c_f(c), p_hy_45_h_n(c), p_hy_45_h_f(c), ...
    p_hy_85_c_n(c), p_hy_85_c_f(c), p_hy_85_h_n(c), p_hy_85_h_f(c)];

b  = hy_hist(:, c+1);
f1 = hy_45_c_n(:, c+1);
f2 = hy_45_c_f(:, c+1);
f3 = hy_45_h_n(:, c+1);
f4 = hy_45_h_f(:, c+1);
f5 = hy_85_c_n(:, c+1);
f6 = hy_85_c_f(:, c+1);
f7 = hy_85_h_n(:, c+1);
f8 = hy_85_h_f(:, c+1);

% Smooth the density functions
smoothed_b = smooth(b, 0.05, 'lowess');
smoothed_f1 = smooth(f1, 0.05, 'lowess');
smoothed_f2 = smooth(f2, 0.05, 'lowess');
smoothed_f3 = smooth(f3, 0.05, 'lowess');
smoothed_f4 = smooth(f4, 0.05, 'lowess');
smoothed_f5 = smooth(f5, 0.05, 'lowess');
smoothed_f6 = smooth(f6, 0.05, 'lowess');
smoothed_f7 = smooth(f7, 0.05, 'lowess');
smoothed_f8 = smooth(f8, 0.05, 'lowess');

% Calculate the CDFs using cumulative sums
cdf_b = cumtrapz(x, smoothed_b);
cdf_f1 = cumtrapz(x, smoothed_f1);
cdf_f2 = cumtrapz(x, smoothed_f2);
cdf_f3 = cumtrapz(x, smoothed_f3);
cdf_f4 = cumtrapz(x, smoothed_f4);
cdf_f5 = cumtrapz(x, smoothed_f5);
cdf_f6 = cumtrapz(x, smoothed_f6);
cdf_f7 = cumtrapz(x, smoothed_f7);
cdf_f8 = cumtrapz(x, smoothed_f8);

% Scale the CDFs by their respective probabilities
scaled_cdf_b  = a(1) * cdf_b / max(cdf_b);
scaled_cdf_f1 = a(2) * cdf_f1 / max(cdf_f1);
scaled_cdf_f2 = a(3) * cdf_f2 / max(cdf_f2);
scaled_cdf_f3 = a(4) * cdf_f3 / max(cdf_f3);
scaled_cdf_f4 = a(5) * cdf_f4 / max(cdf_f4);
scaled_cdf_f5 = a(6) * cdf_f5 / max(cdf_f5);
scaled_cdf_f6 = a(7) * cdf_f6 / max(cdf_f6);
scaled_cdf_f7 = a(8) * cdf_f7 / max(cdf_f7);
scaled_cdf_f8 = a(9) * cdf_f8 / max(cdf_f8);

% Plot the scaled CDFs
plot(x, scaled_cdf_b,  'Color', [0 0 0], 'LineWidth', line_width+1); hold on;

plot(x, scaled_cdf_f1, 'Color', [173 216 230]/255, 'LineWidth', line_width); hold on;
plot(x, scaled_cdf_f2, 'Color', [30, 144, 255]/255, 'LineWidth', line_width); hold on;
plot(x, scaled_cdf_f3, 'Color', [135, 206, 250]/255, 'LineWidth', line_width); hold on;
plot(x, scaled_cdf_f4, 'Color', [0, 0, 205]/255, 'LineWidth', line_width); hold on;

plot(x, scaled_cdf_f5, 'Color', [255, 182, 193]/255, 'LineWidth', line_width); hold on;
plot(x, scaled_cdf_f6, 'Color', [255 0 0]/255, 'LineWidth', line_width); hold on;
plot(x, scaled_cdf_f7, 'Color', [250 128 114]/255, 'LineWidth', line_width); hold on;
plot(x, scaled_cdf_f8, 'Color', [139, 0, 0]/255, 'LineWidth', line_width); hold on;

xlim([-2.2,-0.5]);
ylim([0, 0.9])
grid on;

xticks = [-2.0, -1.6, -1.3, -0.8, -0.5];
xticklabels = {'-2.0', '-1.6', '-1.3', '-0.8', '-0.5'};
ax = gca; % Get current axes
ax.XTick = xticks;
ax.XTickLabel = xticklabels;


% Add vertical line 
% xline(-0.5, 'Color', [255 215 0]/255, 'LineWidth',line_width+1, 'LineStyle', '--');
% xline(-0.8, 'Color', [222 184 135]/255, 'LineWidth',line_width+1, 'LineStyle', '--');
% xline(-1.3, 'Color', [255 140 0]/255, 'LineWidth',line_width+1, 'LineStyle', '--');
% xline(-1.6, 'Color', [255 0 0]/255, 'LineWidth',line_width+1, 'LineStyle', '--');
% xline(-2.0, 'Color', [139 0 0]/255, 'LineWidth',line_width+1, 'LineStyle', '--');

% xline(-0.5, 'Color', [0 0 0]/255, 'LineWidth',line_width, 'LineStyle', '--');
xline(-0.8, 'Color', [0 0 0]/255, 'LineWidth',line_width, 'LineStyle', '--');
xline(-1.3, 'Color', [0 0 0]/255, 'LineWidth',line_width, 'LineStyle', '--');
xline(-1.6, 'Color', [0 0 0]/255, 'LineWidth',line_width, 'LineStyle', '--');
xline(-2.0, 'Color', [0 0 0]/255, 'LineWidth',line_width, 'LineStyle', '--');

text(0.88, 0.95, 'D0', 'FontSize', text_size, 'FontWeight','bold', 'Units', 'normalized')
text(0.65, 0.95, 'D1', 'FontSize', text_size, 'FontWeight','bold', 'Units', 'normalized')
text(0.42, 0.95, 'D2', 'FontSize', text_size, 'FontWeight','bold', 'Units', 'normalized')
text(0.23, 0.95, 'D3', 'FontSize', text_size, 'FontWeight','bold', 'Units', 'normalized')
text(0.05, 0.95, 'D4', 'FontSize', text_size, 'FontWeight','bold', 'Units', 'normalized')
text(0.80, 0.10, '(b2) SW', 'FontSize', text_size, 'FontWeight','bold', 'Units', 'normalized')
% legend('Hist.', 'SSP245COLD_NEAR', 'SSP245COLD_FAR', 'SSP245HOT_NEAR', 'SSP245HOT_FAR', ...
%     'SSP585COLD_NEAR', 'SSP585COLD_FAR', 'SSP585HOT_NEAR', 'SSP585HOT_FAR');
set(gca,'FontSize',tick_size);

% xlabel('April Root-Zone Soil Moisture', 'FontSize', label_size); 
% ylabel('Probability', 'FontSize', label_size); 




% ------------------------------------------------------------------------------------------------------------------
% 3 - hydro C3-MW

subplot(4,3,9)

c = 3;

% scaling factor
a = [p_hy_hist(c), p_hy_45_c_n(c), p_hy_45_c_f(c), p_hy_45_h_n(c), p_hy_45_h_f(c), ...
    p_hy_85_c_n(c), p_hy_85_c_f(c), p_hy_85_h_n(c), p_hy_85_h_f(c)];

b  = hy_hist(:, c+1);
f1 = hy_45_c_n(:, c+1);
f2 = hy_45_c_f(:, c+1);
f3 = hy_45_h_n(:, c+1);
f4 = hy_45_h_f(:, c+1);
f5 = hy_85_c_n(:, c+1);
f6 = hy_85_c_f(:, c+1);
f7 = hy_85_h_n(:, c+1);
f8 = hy_85_h_f(:, c+1);

% Smooth the density functions
smoothed_b = smooth(b, 0.05, 'lowess');
smoothed_f1 = smooth(f1, 0.05, 'lowess');
smoothed_f2 = smooth(f2, 0.05, 'lowess');
smoothed_f3 = smooth(f3, 0.05, 'lowess');
smoothed_f4 = smooth(f4, 0.05, 'lowess');
smoothed_f5 = smooth(f5, 0.05, 'lowess');
smoothed_f6 = smooth(f6, 0.05, 'lowess');
smoothed_f7 = smooth(f7, 0.05, 'lowess');
smoothed_f8 = smooth(f8, 0.05, 'lowess');

% Calculate the CDFs using cumulative sums
cdf_b = cumtrapz(x, smoothed_b);
cdf_f1 = cumtrapz(x, smoothed_f1);
cdf_f2 = cumtrapz(x, smoothed_f2);
cdf_f3 = cumtrapz(x, smoothed_f3);
cdf_f4 = cumtrapz(x, smoothed_f4);
cdf_f5 = cumtrapz(x, smoothed_f5);
cdf_f6 = cumtrapz(x, smoothed_f6);
cdf_f7 = cumtrapz(x, smoothed_f7);
cdf_f8 = cumtrapz(x, smoothed_f8);

% Scale the CDFs by their respective probabilities
scaled_cdf_b  = a(1) * cdf_b / max(cdf_b);
scaled_cdf_f1 = a(2) * cdf_f1 / max(cdf_f1);
scaled_cdf_f2 = a(3) * cdf_f2 / max(cdf_f2);
scaled_cdf_f3 = a(4) * cdf_f3 / max(cdf_f3);
scaled_cdf_f4 = a(5) * cdf_f4 / max(cdf_f4);
scaled_cdf_f5 = a(6) * cdf_f5 / max(cdf_f5);
scaled_cdf_f6 = a(7) * cdf_f6 / max(cdf_f6);
scaled_cdf_f7 = a(8) * cdf_f7 / max(cdf_f7);
scaled_cdf_f8 = a(9) * cdf_f8 / max(cdf_f8);

% Plot the scaled CDFs
plot(x, scaled_cdf_b,  'Color', [0 0 0], 'LineWidth', line_width+1); hold on;

plot(x, scaled_cdf_f1, 'Color', [173 216 230]/255, 'LineWidth', line_width); hold on;
plot(x, scaled_cdf_f2, 'Color', [30, 144, 255]/255, 'LineWidth', line_width); hold on;
plot(x, scaled_cdf_f3, 'Color', [135, 206, 250]/255, 'LineWidth', line_width); hold on;
plot(x, scaled_cdf_f4, 'Color', [0, 0, 205]/255, 'LineWidth', line_width); hold on;

plot(x, scaled_cdf_f5, 'Color', [255, 182, 193]/255, 'LineWidth', line_width); hold on;
plot(x, scaled_cdf_f6, 'Color', [255 0 0]/255, 'LineWidth', line_width); hold on;
plot(x, scaled_cdf_f7, 'Color', [250 128 114]/255, 'LineWidth', line_width); hold on;
plot(x, scaled_cdf_f8, 'Color', [139, 0, 0]/255, 'LineWidth', line_width); hold on;

xlim([-2.2,-0.5]);
ylim([0, 0.9])
grid on;

xticks = [-2.0, -1.6, -1.3, -0.8, -0.5];
xticklabels = {'-2.0', '-1.6', '-1.3', '-0.8', '-0.5'};
ax = gca; % Get current axes
ax.XTick = xticks;
ax.XTickLabel = xticklabels;


% Add vertical line 
% xline(-0.5, 'Color', [255 215 0]/255, 'LineWidth',line_width+1, 'LineStyle', '--');
% xline(-0.8, 'Color', [222 184 135]/255, 'LineWidth',line_width+1, 'LineStyle', '--');
% xline(-1.3, 'Color', [255 140 0]/255, 'LineWidth',line_width+1, 'LineStyle', '--');
% xline(-1.6, 'Color', [255 0 0]/255, 'LineWidth',line_width+1, 'LineStyle', '--');
% xline(-2.0, 'Color', [139 0 0]/255, 'LineWidth',line_width+1, 'LineStyle', '--');

% xline(-0.5, 'Color', [0 0 0]/255, 'LineWidth',line_width, 'LineStyle', '--');
xline(-0.8, 'Color', [0 0 0]/255, 'LineWidth',line_width, 'LineStyle', '--');
xline(-1.3, 'Color', [0 0 0]/255, 'LineWidth',line_width, 'LineStyle', '--');
xline(-1.6, 'Color', [0 0 0]/255, 'LineWidth',line_width, 'LineStyle', '--');
xline(-2.0, 'Color', [0 0 0]/255, 'LineWidth',line_width, 'LineStyle', '--');

text(0.88, 0.95, 'D0', 'FontSize', text_size, 'FontWeight','bold', 'Units', 'normalized')
text(0.65, 0.95, 'D1', 'FontSize', text_size, 'FontWeight','bold', 'Units', 'normalized')
text(0.42, 0.95, 'D2', 'FontSize', text_size, 'FontWeight','bold', 'Units', 'normalized')
text(0.23, 0.95, 'D3', 'FontSize', text_size, 'FontWeight','bold', 'Units', 'normalized')
text(0.05, 0.95, 'D4', 'FontSize', text_size, 'FontWeight','bold', 'Units', 'normalized')
text(0.80, 0.10, '(b3) MW', 'FontSize', text_size, 'FontWeight','bold', 'Units', 'normalized')
% legend('Hist.', 'SSP245COLD_NEAR', 'SSP245COLD_FAR', 'SSP245HOT_NEAR', 'SSP245HOT_FAR', ...
%     'SSP585COLD_NEAR', 'SSP585COLD_FAR', 'SSP585HOT_NEAR', 'SSP585HOT_FAR');
set(gca,'FontSize',tick_size);

% xlabel('April Root-Zone Soil Moisture', 'FontSize', label_size); 
% ylabel('Probability', 'FontSize', label_size); 



% ------------------------------------------------------------------------------------------------------------------
% 4 - hydro C4-GP

subplot(4,3,10)

c = 4;

% scaling factor
a = [p_hy_hist(c), p_hy_45_c_n(c), p_hy_45_c_f(c), p_hy_45_h_n(c), p_hy_45_h_f(c), ...
    p_hy_85_c_n(c), p_hy_85_c_f(c), p_hy_85_h_n(c), p_hy_85_h_f(c)];

b  = hy_hist(:, c+1);
f1 = hy_45_c_n(:, c+1);
f2 = hy_45_c_f(:, c+1);
f3 = hy_45_h_n(:, c+1);
f4 = hy_45_h_f(:, c+1);
f5 = hy_85_c_n(:, c+1);
f6 = hy_85_c_f(:, c+1);
f7 = hy_85_h_n(:, c+1);
f8 = hy_85_h_f(:, c+1);

% Smooth the density functions
smoothed_b = smooth(b, 0.05, 'lowess');
smoothed_f1 = smooth(f1, 0.05, 'lowess');
smoothed_f2 = smooth(f2, 0.05, 'lowess');
smoothed_f3 = smooth(f3, 0.05, 'lowess');
smoothed_f4 = smooth(f4, 0.05, 'lowess');
smoothed_f5 = smooth(f5, 0.05, 'lowess');
smoothed_f6 = smooth(f6, 0.05, 'lowess');
smoothed_f7 = smooth(f7, 0.05, 'lowess');
smoothed_f8 = smooth(f8, 0.05, 'lowess');

% Calculate the CDFs using cumulative sums
cdf_b = cumtrapz(x, smoothed_b);
cdf_f1 = cumtrapz(x, smoothed_f1);
cdf_f2 = cumtrapz(x, smoothed_f2);
cdf_f3 = cumtrapz(x, smoothed_f3);
cdf_f4 = cumtrapz(x, smoothed_f4);
cdf_f5 = cumtrapz(x, smoothed_f5);
cdf_f6 = cumtrapz(x, smoothed_f6);
cdf_f7 = cumtrapz(x, smoothed_f7);
cdf_f8 = cumtrapz(x, smoothed_f8);

% Scale the CDFs by their respective probabilities
scaled_cdf_b  = a(1) * cdf_b / max(cdf_b);
scaled_cdf_f1 = a(2) * cdf_f1 / max(cdf_f1);
scaled_cdf_f2 = a(3) * cdf_f2 / max(cdf_f2);
scaled_cdf_f3 = a(4) * cdf_f3 / max(cdf_f3);
scaled_cdf_f4 = a(5) * cdf_f4 / max(cdf_f4);
scaled_cdf_f5 = a(6) * cdf_f5 / max(cdf_f5);
scaled_cdf_f6 = a(7) * cdf_f6 / max(cdf_f6);
scaled_cdf_f7 = a(8) * cdf_f7 / max(cdf_f7);
scaled_cdf_f8 = a(9) * cdf_f8 / max(cdf_f8);

% Plot the scaled CDFs
plot(x, scaled_cdf_b,  'Color', [0 0 0], 'LineWidth', line_width+1); hold on;

plot(x, scaled_cdf_f1, 'Color', [173 216 230]/255, 'LineWidth', line_width); hold on;
plot(x, scaled_cdf_f2, 'Color', [30, 144, 255]/255, 'LineWidth', line_width); hold on;
plot(x, scaled_cdf_f3, 'Color', [135, 206, 250]/255, 'LineWidth', line_width); hold on;
plot(x, scaled_cdf_f4, 'Color', [0, 0, 205]/255, 'LineWidth', line_width); hold on;

plot(x, scaled_cdf_f5, 'Color', [255, 182, 193]/255, 'LineWidth', line_width); hold on;
plot(x, scaled_cdf_f6, 'Color', [255 0 0]/255, 'LineWidth', line_width); hold on;
plot(x, scaled_cdf_f7, 'Color', [250 128 114]/255, 'LineWidth', line_width); hold on;
plot(x, scaled_cdf_f8, 'Color', [139, 0, 0]/255, 'LineWidth', line_width); hold on;

xlim([-2.2,-0.5]);
ylim([0, 0.9])
grid on;

xticks = [-2.0, -1.6, -1.3, -0.8, -0.5];
xticklabels = {'-2.0', '-1.6', '-1.3', '-0.8', '-0.5'};
ax = gca; % Get current axes
ax.XTick = xticks;
ax.XTickLabel = xticklabels;


% Add vertical line 
% xline(-0.5, 'Color', [255 215 0]/255, 'LineWidth',line_width+1, 'LineStyle', '--');
% xline(-0.8, 'Color', [222 184 135]/255, 'LineWidth',line_width+1, 'LineStyle', '--');
% xline(-1.3, 'Color', [255 140 0]/255, 'LineWidth',line_width+1, 'LineStyle', '--');
% xline(-1.6, 'Color', [255 0 0]/255, 'LineWidth',line_width+1, 'LineStyle', '--');
% xline(-2.0, 'Color', [139 0 0]/255, 'LineWidth',line_width+1, 'LineStyle', '--');

% xline(-0.5, 'Color', [0 0 0]/255, 'LineWidth',line_width, 'LineStyle', '--');
xline(-0.8, 'Color', [0 0 0]/255, 'LineWidth',line_width, 'LineStyle', '--');
xline(-1.3, 'Color', [0 0 0]/255, 'LineWidth',line_width, 'LineStyle', '--');
xline(-1.6, 'Color', [0 0 0]/255, 'LineWidth',line_width, 'LineStyle', '--');
xline(-2.0, 'Color', [0 0 0]/255, 'LineWidth',line_width, 'LineStyle', '--');

text(0.88, 0.95, 'D0', 'FontSize', text_size, 'FontWeight','bold', 'Units', 'normalized')
text(0.65, 0.95, 'D1', 'FontSize', text_size, 'FontWeight','bold', 'Units', 'normalized')
text(0.42, 0.95, 'D2', 'FontSize', text_size, 'FontWeight','bold', 'Units', 'normalized')
text(0.23, 0.95, 'D3', 'FontSize', text_size, 'FontWeight','bold', 'Units', 'normalized')
text(0.05, 0.95, 'D4', 'FontSize', text_size, 'FontWeight','bold', 'Units', 'normalized')
text(0.80, 0.10, '(b4) GP', 'FontSize', text_size, 'FontWeight','bold', 'Units', 'normalized')
% legend('Hist.', 'SSP245COLD_NEAR', 'SSP245COLD_FAR', 'SSP245HOT_NEAR', 'SSP245HOT_FAR', ...
%     'SSP585COLD_NEAR', 'SSP585COLD_FAR', 'SSP585HOT_NEAR', 'SSP585HOT_FAR');
set(gca,'FontSize',tick_size);

xlabel('Mean Intensity', 'FontSize', label_size); 
ylabel('Probability', 'FontSize', label_size); 




% ------------------------------------------------------------------------------------------------------------------
% 5 - hydro C5-NE

subplot(4,3,11)

c = 5;

% scaling factor
a = [p_hy_hist(c), p_hy_45_c_n(c), p_hy_45_c_f(c), p_hy_45_h_n(c), p_hy_45_h_f(c), ...
    p_hy_85_c_n(c), p_hy_85_c_f(c), p_hy_85_h_n(c), p_hy_85_h_f(c)];

b  = hy_hist(:, c+1);
f1 = hy_45_c_n(:, c+1);
f2 = hy_45_c_f(:, c+1);
f3 = hy_45_h_n(:, c+1);
f4 = hy_45_h_f(:, c+1);
f5 = hy_85_c_n(:, c+1);
f6 = hy_85_c_f(:, c+1);
f7 = hy_85_h_n(:, c+1);
f8 = hy_85_h_f(:, c+1);

% Smooth the density functions
smoothed_b = smooth(b, 0.05, 'lowess');
smoothed_f1 = smooth(f1, 0.05, 'lowess');
smoothed_f2 = smooth(f2, 0.05, 'lowess');
smoothed_f3 = smooth(f3, 0.05, 'lowess');
smoothed_f4 = smooth(f4, 0.05, 'lowess');
smoothed_f5 = smooth(f5, 0.05, 'lowess');
smoothed_f6 = smooth(f6, 0.05, 'lowess');
smoothed_f7 = smooth(f7, 0.05, 'lowess');
smoothed_f8 = smooth(f8, 0.05, 'lowess');

% Calculate the CDFs using cumulative sums
cdf_b = cumtrapz(x, smoothed_b);
cdf_f1 = cumtrapz(x, smoothed_f1);
cdf_f2 = cumtrapz(x, smoothed_f2);
cdf_f3 = cumtrapz(x, smoothed_f3);
cdf_f4 = cumtrapz(x, smoothed_f4);
cdf_f5 = cumtrapz(x, smoothed_f5);
cdf_f6 = cumtrapz(x, smoothed_f6);
cdf_f7 = cumtrapz(x, smoothed_f7);
cdf_f8 = cumtrapz(x, smoothed_f8);

% Scale the CDFs by their respective probabilities
scaled_cdf_b  = a(1) * cdf_b / max(cdf_b);
scaled_cdf_f1 = a(2) * cdf_f1 / max(cdf_f1);
scaled_cdf_f2 = a(3) * cdf_f2 / max(cdf_f2);
scaled_cdf_f3 = a(4) * cdf_f3 / max(cdf_f3);
scaled_cdf_f4 = a(5) * cdf_f4 / max(cdf_f4);
scaled_cdf_f5 = a(6) * cdf_f5 / max(cdf_f5);
scaled_cdf_f6 = a(7) * cdf_f6 / max(cdf_f6);
scaled_cdf_f7 = a(8) * cdf_f7 / max(cdf_f7);
scaled_cdf_f8 = a(9) * cdf_f8 / max(cdf_f8);

% Plot the scaled CDFs
plot(x, scaled_cdf_b,  'Color', [0 0 0], 'LineWidth', line_width+1); hold on;

plot(x, scaled_cdf_f1, 'Color', [173 216 230]/255, 'LineWidth', line_width); hold on;
plot(x, scaled_cdf_f2, 'Color', [30, 144, 255]/255, 'LineWidth', line_width); hold on;
plot(x, scaled_cdf_f3, 'Color', [135, 206, 250]/255, 'LineWidth', line_width); hold on;
plot(x, scaled_cdf_f4, 'Color', [0, 0, 205]/255, 'LineWidth', line_width); hold on;

plot(x, scaled_cdf_f5, 'Color', [255, 182, 193]/255, 'LineWidth', line_width); hold on;
plot(x, scaled_cdf_f6, 'Color', [255 0 0]/255, 'LineWidth', line_width); hold on;
plot(x, scaled_cdf_f7, 'Color', [250 128 114]/255, 'LineWidth', line_width); hold on;
plot(x, scaled_cdf_f8, 'Color', [139, 0, 0]/255, 'LineWidth', line_width); hold on;

xlim([-2.2,-0.5]);
ylim([0, 0.9])
grid on;

xticks = [-2.0, -1.6, -1.3, -0.8, -0.5];
xticklabels = {'-2.0', '-1.6', '-1.3', '-0.8', '-0.5'};
ax = gca; % Get current axes
ax.XTick = xticks;
ax.XTickLabel = xticklabels;


% Add vertical line 
% xline(-0.5, 'Color', [255 215 0]/255, 'LineWidth',line_width+1, 'LineStyle', '--');
% xline(-0.8, 'Color', [222 184 135]/255, 'LineWidth',line_width+1, 'LineStyle', '--');
% xline(-1.3, 'Color', [255 140 0]/255, 'LineWidth',line_width+1, 'LineStyle', '--');
% xline(-1.6, 'Color', [255 0 0]/255, 'LineWidth',line_width+1, 'LineStyle', '--');
% xline(-2.0, 'Color', [139 0 0]/255, 'LineWidth',line_width+1, 'LineStyle', '--');

% xline(-0.5, 'Color', [0 0 0]/255, 'LineWidth',line_width, 'LineStyle', '--');
xline(-0.8, 'Color', [0 0 0]/255, 'LineWidth',line_width, 'LineStyle', '--');
xline(-1.3, 'Color', [0 0 0]/255, 'LineWidth',line_width, 'LineStyle', '--');
xline(-1.6, 'Color', [0 0 0]/255, 'LineWidth',line_width, 'LineStyle', '--');
xline(-2.0, 'Color', [0 0 0]/255, 'LineWidth',line_width, 'LineStyle', '--');

text(0.88, 0.95, 'D0', 'FontSize', text_size, 'FontWeight','bold', 'Units', 'normalized')
text(0.65, 0.95, 'D1', 'FontSize', text_size, 'FontWeight','bold', 'Units', 'normalized')
text(0.42, 0.95, 'D2', 'FontSize', text_size, 'FontWeight','bold', 'Units', 'normalized')
text(0.23, 0.95, 'D3', 'FontSize', text_size, 'FontWeight','bold', 'Units', 'normalized')
text(0.05, 0.95, 'D4', 'FontSize', text_size, 'FontWeight','bold', 'Units', 'normalized')
text(0.80, 0.10, '(b5) NE', 'FontSize', text_size, 'FontWeight','bold', 'Units', 'normalized')
% legend('Hist.', 'SSP245COLD_NEAR', 'SSP245COLD_FAR', 'SSP245HOT_NEAR', 'SSP245HOT_FAR', ...
%     'SSP585COLD_NEAR', 'SSP585COLD_FAR', 'SSP585HOT_NEAR', 'SSP585HOT_FAR');
set(gca,'FontSize',tick_size);

xlabel('Mean Intensity', 'FontSize', label_size); 
% ylabel('Probability', 'FontSize', label_size); 













% ------------------------------------------------------------------------------------------------------------------
% 6 - hydro C6-SE

subplot(4,3,12)

c = 6;

% scaling factor
a = [p_hy_hist(c), p_hy_45_c_n(c), p_hy_45_c_f(c), p_hy_45_h_n(c), p_hy_45_h_f(c), ...
    p_hy_85_c_n(c), p_hy_85_c_f(c), p_hy_85_h_n(c), p_hy_85_h_f(c)];

b  = hy_hist(:, c+1);
f1 = hy_45_c_n(:, c+1);
f2 = hy_45_c_f(:, c+1);
f3 = hy_45_h_n(:, c+1);
f4 = hy_45_h_f(:, c+1);
f5 = hy_85_c_n(:, c+1);
f6 = hy_85_c_f(:, c+1);
f7 = hy_85_h_n(:, c+1);
f8 = hy_85_h_f(:, c+1);

% Smooth the density functions
smoothed_b = smooth(b, 0.05, 'lowess');
smoothed_f1 = smooth(f1, 0.05, 'lowess');
smoothed_f2 = smooth(f2, 0.05, 'lowess');
smoothed_f3 = smooth(f3, 0.05, 'lowess');
smoothed_f4 = smooth(f4, 0.05, 'lowess');
smoothed_f5 = smooth(f5, 0.05, 'lowess');
smoothed_f6 = smooth(f6, 0.05, 'lowess');
smoothed_f7 = smooth(f7, 0.05, 'lowess');
smoothed_f8 = smooth(f8, 0.05, 'lowess');

% Calculate the CDFs using cumulative sums
cdf_b = cumtrapz(x, smoothed_b);
cdf_f1 = cumtrapz(x, smoothed_f1);
cdf_f2 = cumtrapz(x, smoothed_f2);
cdf_f3 = cumtrapz(x, smoothed_f3);
cdf_f4 = cumtrapz(x, smoothed_f4);
cdf_f5 = cumtrapz(x, smoothed_f5);
cdf_f6 = cumtrapz(x, smoothed_f6);
cdf_f7 = cumtrapz(x, smoothed_f7);
cdf_f8 = cumtrapz(x, smoothed_f8);

% Scale the CDFs by their respective probabilities
scaled_cdf_b  = a(1) * cdf_b / max(cdf_b);
scaled_cdf_f1 = a(2) * cdf_f1 / max(cdf_f1);
scaled_cdf_f2 = a(3) * cdf_f2 / max(cdf_f2);
scaled_cdf_f3 = a(4) * cdf_f3 / max(cdf_f3);
scaled_cdf_f4 = a(5) * cdf_f4 / max(cdf_f4);
scaled_cdf_f5 = a(6) * cdf_f5 / max(cdf_f5);
scaled_cdf_f6 = a(7) * cdf_f6 / max(cdf_f6);
scaled_cdf_f7 = a(8) * cdf_f7 / max(cdf_f7);
scaled_cdf_f8 = a(9) * cdf_f8 / max(cdf_f8);

% Plot the scaled CDFs
h1 = plot(x, scaled_cdf_b,  'Color', [0 0 0], 'LineWidth', line_width+1); hold on;

h2 = plot(x, scaled_cdf_f1, 'Color', [173 216 230]/255, 'LineWidth', line_width); hold on;
h4 = plot(x, scaled_cdf_f2, 'Color', [30, 144, 255]/255, 'LineWidth', line_width); hold on;
h3 = plot(x, scaled_cdf_f3, 'Color', [135, 206, 250]/255, 'LineWidth', line_width); hold on;
h5 = plot(x, scaled_cdf_f4, 'Color', [0, 0, 205]/255, 'LineWidth', line_width); hold on;

h6 = plot(x, scaled_cdf_f5, 'Color', [255, 182, 193]/255, 'LineWidth', line_width); hold on;
h8 = plot(x, scaled_cdf_f6, 'Color', [255 0 0]/255, 'LineWidth', line_width); hold on;
h7 = plot(x, scaled_cdf_f7, 'Color', [250 128 114]/255, 'LineWidth', line_width); hold on;
h9 = plot(x, scaled_cdf_f8, 'Color', [139, 0, 0]/255, 'LineWidth', line_width); hold on;

xlim([-2.2,-0.5]);
ylim([0, 0.9])
grid on;

xticks = [-2.0, -1.6, -1.3, -0.8, -0.5];
xticklabels = {'-2.0', '-1.6', '-1.3', '-0.8', '-0.5'};
ax = gca; % Get current axes
ax.XTick = xticks;
ax.XTickLabel = xticklabels;

lgd = legend([h1, h2, h3, h4, h5, h6, h7, h8, h9], {'Hist.', 'SSP245COLD-NEAR', 'SSP245HOT-NEAR', 'SSP245COLD-FAR', 'SSP245HOT-FAR', ...
    'SSP585COLD-NEAR', 'SSP585HOT-NEAR', 'SSP585COLD-FAR', 'SSP585HOT-FAR'})
lgd.FontSize = 12;
lgd.Orientation = 'vertical';

% Add vertical line 
% xline(-0.5, 'Color', [255 215 0]/255, 'LineWidth',line_width+1, 'LineStyle', '--');
% xline(-0.8, 'Color', [222 184 135]/255, 'LineWidth',line_width+1, 'LineStyle', '--');
% xline(-1.3, 'Color', [255 140 0]/255, 'LineWidth',line_width+1, 'LineStyle', '--');
% xline(-1.6, 'Color', [255 0 0]/255, 'LineWidth',line_width+1, 'LineStyle', '--');
% xline(-2.0, 'Color', [139 0 0]/255, 'LineWidth',line_width+1, 'LineStyle', '--');

% xline(-0.5, 'Color', [0 0 0]/255, 'LineWidth',line_width, 'LineStyle', '--');
xline(-0.8, 'Color', [0 0 0]/255, 'LineWidth',line_width, 'LineStyle', '--');
xline(-1.3, 'Color', [0 0 0]/255, 'LineWidth',line_width, 'LineStyle', '--');
xline(-1.6, 'Color', [0 0 0]/255, 'LineWidth',line_width, 'LineStyle', '--');
xline(-2.0, 'Color', [0 0 0]/255, 'LineWidth',line_width, 'LineStyle', '--');

text(0.88, 0.95, 'D0', 'FontSize', text_size, 'FontWeight','bold', 'Units', 'normalized')
text(0.65, 0.95, 'D1', 'FontSize', text_size, 'FontWeight','bold', 'Units', 'normalized')
text(0.42, 0.95, 'D2', 'FontSize', text_size, 'FontWeight','bold', 'Units', 'normalized')
text(0.23, 0.95, 'D3', 'FontSize', text_size, 'FontWeight','bold', 'Units', 'normalized')
text(0.05, 0.95, 'D4', 'FontSize', text_size, 'FontWeight','bold', 'Units', 'normalized')
text(0.80, 0.10, '(b6) SE', 'FontSize', text_size, 'FontWeight','bold', 'Units', 'normalized')
% legend('Hist.', 'SSP245COLD_NEAR', 'SSP245COLD_FAR', 'SSP245HOT_NEAR', 'SSP245HOT_FAR', ...
%     'SSP585COLD_NEAR', 'SSP585COLD_FAR', 'SSP585HOT_NEAR', 'SSP585HOT_FAR');
set(gca,'FontSize',tick_size);

xlabel('Mean Intensity', 'FontSize', label_size); 
% ylabel('Probability', 'FontSize', label_size); 






%% output the plot

fig = gcf;
fig.PaperUnits = 'inches';

% fig.PaperPosition = [0 0 17.7 8];
fig.PaperPosition = [0 0 15 12];
print('ScreenSizeFigure', '-dpng', '-r300')





