clear all; clc

label_size = 11; line_width = 1;   box_width = 0.5;
title_size = 10; tick_size = 10; text_size = 10;  
scatter_size = 10;  legend_size = 10;  colorbar_size= 10;

p_t_change = load('drought_P_T_change.txt');


% column 1-45_c_n, 2-45_c_f, 3-45_h_n, 4-45_h_f, 5-85_c_n, 6-85_c_f, 7-85_h_n, 8-85_h_f
t_change = nan(6,8);  % in (delta C),  row 1-NW, 2-SW, 3-MW, 4-GP, 5-NE, 6-SE
p_change = nan(6,8);  % in % change 

for i = 1:6
    data_p = p_t_change(p_t_change(:,4)==i,7:15);
    data_t = p_t_change(p_t_change(:,4)==i,16:24);
    
    data_p_mean = mean(data_p, 1);
    data_t_mean = mean(data_t, 1);

    for j = 1:8
        t_change(i,j) = data_t_mean(1,j+1) - data_t_mean(:,1);
        p_change(i,j) = (data_p_mean(:,j+1) - data_p_mean(:,1))./data_p_mean(:,1)*100;
    end
end


% column 1-45_c_n, 2-45_c_f, 3-45_h_n, 4-45_h_f, 5-85_c_n, 6-85_c_f, 7-85_h_n, 8-85_h_f
% change in %
md2ad_d1 = [5.8	7.2	6.4	9.9	6.0	10.7	9.8	13.8;
    10.7	15.3	9.6	14.2	10.4	19.4	9.7	22.3;
    4.5	22.8	9.4	26.6	8.8	35.5	16.3	39.6;
    -1.5	2.2	7.9	0.0	0.4	8.4	6.4	10.7;
    -20.8	-19.0	-11.8	-9.4	-13.7	-11.3	-18.1	-7.8;
    9.2	25.4	21.8	39.0	16.3	46.4	27.1	53.5];

md2hd_d1 = [0.2	1.5	0.6	2.0	1.2	4.0	1.3	4.4;
    2.2	7.1	4.1	7.4	4.3	9.9	5.2	10.4;
    3.1	10.5	4.0	11.6	3.4	18.2	7.3	18.7;
    -2.0	-2.2	-1.4	-3.0	-2.7	1.4	-1.1	0.7;
    -6.0	-5.6	-1.4	-0.5	-1.7	-1.3	-4.4	-1.2;
    2.0	7.3	6.0	13.6	4.9	15.1	8.2	18.7];


%% box plot


region_labels = {'NW', 'SW', 'MW', 'GP', 'NE', 'SE'};

% Assume columns 1–3 are MD→AD regions; 4–6 are MD→HD regions
% You may need to adjust these indices based on your actual region order
data_ad = md2ad_d1';  % Now 8 × 6
data_hd = md2hd_d1';

colors = [ ...
    0.3 0.6 0.9;  % NW - blue
    0.2 0.8 0.6;  % SW - green
    0.9 0.6 0.2;  % MW - orange
    0.7 0.4 0.9;  % GP - purple
    0.9 0.3 0.3;  % NE - red
    0.5 0.5 0.5]; % SE - gray

% Plot boxplots
figure;

subplot(3,3,1);
h1 = boxplot(data_ad, 'Labels', region_labels, 'Colors', 'k', 'Symbol', '');
ylabel('Δ Probability (%)');
box on; grid on;
text(0.02, 0.90, '(a7) All Scenarios', 'FontSize', text_size, 'FontWeight','bold', 'Units', 'normalized')
% Color each box
h = findobj(gca, 'Tag', 'Box');
for j = 1:length(h)
    patch(get(h(j), 'XData'), get(h(j), 'YData'), colors(j,:), 'FaceAlpha', 0.6);
end
yline(0, 'k', 'LineWidth', 1);

subplot(3,3,2);
h2 = boxplot(data_hd, 'Labels', region_labels, 'Colors', 'k', 'Symbol', '');
ylabel('Δ Probability (%)');
box on; grid on;
text(0.02, 0.90, '(b7) All Scenarios', 'FontSize', text_size, 'FontWeight','bold', 'Units', 'normalized')

h = findobj(gca, 'Tag', 'Box');
for j = 1:length(h)
    patch(get(h(j), 'XData'), get(h(j), 'YData'), colors(j,:), 'FaceAlpha', 0.6);
end
yline(0, 'k', 'LineWidth', 1);







%% --------------------------------------------------------------------------------
% 1-D0 change, C1-NW

a1 = subplot(4,3,1)

c = 1;

% column 1-45_c_n, 2-45_c_f, 3-45_h_n, 4-45_h_f, 5-85_c_n, 6-85_c_f, 7-85_h_n, 8-85_h_f
p_change_c = p_change(c,:);  % 1x8
t_change_c = t_change(c,:);  % 1x8
p_ag_change = md2ad_d1(c,:);

scatter(p_change_c(1), t_change_c(1), 80, p_ag_change(1), 'filled', 'o', 'MarkerEdgeColor', 'k'); hold on;
scatter(p_change_c(2), t_change_c(2), 100, p_ag_change(2), 'filled', 'square', 'MarkerEdgeColor', 'k'); hold on;
scatter(p_change_c(3), t_change_c(3), 80, p_ag_change(3), 'filled', 'diamond', 'MarkerEdgeColor', 'k'); hold on;
scatter(p_change_c(4), t_change_c(4), 100, p_ag_change(4), 'filled', 'pentagram', 'MarkerEdgeColor', 'k'); hold on;
scatter(p_change_c(5), t_change_c(5), 100, p_ag_change(5), 'filled', '^', 'MarkerEdgeColor', 'k'); hold on;
scatter(p_change_c(6), t_change_c(6), 100, p_ag_change(6), 'filled', 'v', 'MarkerEdgeColor', 'k'); hold on;
scatter(p_change_c(7), t_change_c(7), 100, p_ag_change(7), 'filled', '>', 'MarkerEdgeColor', 'k'); hold on;
scatter(p_change_c(8), t_change_c(8), 100, p_ag_change(8), 'filled', '<', 'MarkerEdgeColor', 'k'); hold on;

colormap(a1, brewermap([],'Reds'));   

% xlabel('Δ Precipitation (%)', 'FontSize', label_size); 
ylabel('Δ Temperature (°C)', 'FontSize', label_size); 
grid on; box on;
colorbar
text(0.02, 0.90, '(a1) NW', 'FontSize', text_size, 'FontWeight','bold', 'Units', 'normalized')







% ----------------------------------------------------------------------------------------------------------------
% 2-D0 change, C2-SW
a2 = subplot(4,3,2)

c = 2;

% column 1-45_c_n, 2-45_c_f, 3-45_h_n, 4-45_h_f, 5-85_c_n, 6-85_c_f, 7-85_h_n, 8-85_h_f
p_change_c = p_change(c,:);  % 1x8
t_change_c = t_change(c,:);  % 1x8
p_ag_change = md2ad_d1(c,:);

scatter(p_change_c(1), t_change_c(1), 80, p_ag_change(1), 'filled', 'o', 'MarkerEdgeColor', 'k'); hold on;
scatter(p_change_c(2), t_change_c(2), 100, p_ag_change(2), 'filled', 'square', 'MarkerEdgeColor', 'k'); hold on;
scatter(p_change_c(3), t_change_c(3), 80, p_ag_change(3), 'filled', 'diamond', 'MarkerEdgeColor', 'k'); hold on;
scatter(p_change_c(4), t_change_c(4), 100, p_ag_change(4), 'filled', 'pentagram', 'MarkerEdgeColor', 'k'); hold on;
scatter(p_change_c(5), t_change_c(5), 100, p_ag_change(5), 'filled', '^', 'MarkerEdgeColor', 'k'); hold on;
scatter(p_change_c(6), t_change_c(6), 100, p_ag_change(6), 'filled', 'v', 'MarkerEdgeColor', 'k'); hold on;
scatter(p_change_c(7), t_change_c(7), 100, p_ag_change(7), 'filled', '>', 'MarkerEdgeColor', 'k'); hold on;
scatter(p_change_c(8), t_change_c(8), 100, p_ag_change(8), 'filled', '<', 'MarkerEdgeColor', 'k'); hold on;
colormap(a2, brewermap([],'Reds'));   

% xlabel('Δ Precipitation (%)', 'FontSize', label_size); 
% ylabel('Δ Temperature (°C)', 'FontSize', label_size); 
grid on; box on;
colorbar
text(0.02, 0.90, '(a2) SW', 'FontSize', text_size, 'FontWeight','bold', 'Units', 'normalized')



% ----------------------------------------------------------------------------------------------------------------
% 3-D0 change, C3-MW
a3 = subplot(4,3,3)

c = 3;

% column 1-45_c_n, 2-45_c_f, 3-45_h_n, 4-45_h_f, 5-85_c_n, 6-85_c_f, 7-85_h_n, 8-85_h_f
p_change_c = p_change(c,:);  % 1x8
t_change_c = t_change(c,:);  % 1x8
p_ag_change = md2ad_d1(c,:);

scatter(p_change_c(1), t_change_c(1), 80, p_ag_change(1), 'filled', 'o', 'MarkerEdgeColor', 'k'); hold on;
scatter(p_change_c(2), t_change_c(2), 100, p_ag_change(2), 'filled', 'square', 'MarkerEdgeColor', 'k'); hold on;
scatter(p_change_c(3), t_change_c(3), 80, p_ag_change(3), 'filled', 'diamond', 'MarkerEdgeColor', 'k'); hold on;
scatter(p_change_c(4), t_change_c(4), 100, p_ag_change(4), 'filled', 'pentagram', 'MarkerEdgeColor', 'k'); hold on;
scatter(p_change_c(5), t_change_c(5), 100, p_ag_change(5), 'filled', '^', 'MarkerEdgeColor', 'k'); hold on;
scatter(p_change_c(6), t_change_c(6), 100, p_ag_change(6), 'filled', 'v', 'MarkerEdgeColor', 'k'); hold on;
scatter(p_change_c(7), t_change_c(7), 100, p_ag_change(7), 'filled', '>', 'MarkerEdgeColor', 'k'); hold on;
scatter(p_change_c(8), t_change_c(8), 100, p_ag_change(8), 'filled', '<', 'MarkerEdgeColor', 'k'); hold on;
colormap(a3, brewermap([],'Reds'));   

% xlabel('Δ Precipitation (%)', 'FontSize', label_size); 
% ylabel('Δ Temperature (°C)', 'FontSize', label_size); 
grid on; box on;
colorbar
text(0.02, 0.90, '(a3) MW', 'FontSize', text_size, 'FontWeight','bold', 'Units', 'normalized')




% ----------------------------------------------------------------------------------------------------------------
% 4-D0 change, C4-GP
a4 = subplot(4,3,4)

c = 4;

% column 1-45_c_n, 2-45_c_f, 3-45_h_n, 4-45_h_f, 5-85_c_n, 6-85_c_f, 7-85_h_n, 8-85_h_f
p_change_c = p_change(c,:);  % 1x8
t_change_c = t_change(c,:);  % 1x8
p_ag_change = md2ad_d1(c,:);

scatter(p_change_c(1), t_change_c(1), 80, p_ag_change(1), 'filled', 'o', 'MarkerEdgeColor', 'k'); hold on;
scatter(p_change_c(2), t_change_c(2), 100, p_ag_change(2), 'filled', 'square', 'MarkerEdgeColor', 'k'); hold on;
scatter(p_change_c(3), t_change_c(3), 80, p_ag_change(3), 'filled', 'diamond', 'MarkerEdgeColor', 'k'); hold on;
scatter(p_change_c(4), t_change_c(4), 100, p_ag_change(4), 'filled', 'pentagram', 'MarkerEdgeColor', 'k'); hold on;
scatter(p_change_c(5), t_change_c(5), 100, p_ag_change(5), 'filled', '^', 'MarkerEdgeColor', 'k'); hold on;
scatter(p_change_c(6), t_change_c(6), 100, p_ag_change(6), 'filled', 'v', 'MarkerEdgeColor', 'k'); hold on;
scatter(p_change_c(7), t_change_c(7), 100, p_ag_change(7), 'filled', '>', 'MarkerEdgeColor', 'k'); hold on;
scatter(p_change_c(8), t_change_c(8), 100, p_ag_change(8), 'filled', '<', 'MarkerEdgeColor', 'k'); hold on;
colormap(a4, brewermap([],'*RdBu'));   
caxis([-10,10])

% xlabel('Δ Precipitation (%)', 'FontSize', label_size); 
ylabel('Δ Temperature (°C)', 'FontSize', label_size); 
grid on; box on;
colorbar
text(0.02, 0.90, '(a4) GP', 'FontSize', text_size, 'FontWeight','bold', 'Units', 'normalized')




% ----------------------------------------------------------------------------------------------------------------
% 5-D0 change, C5-NE
a5 = subplot(4,3,5)

c = 5;

% column 1-45_c_n, 2-45_c_f, 3-45_h_n, 4-45_h_f, 5-85_c_n, 6-85_c_f, 7-85_h_n, 8-85_h_f
p_change_c = p_change(c,:);  % 1x8
t_change_c = t_change(c,:);  % 1x8
p_ag_change = md2ad_d1(c,:);

scatter(p_change_c(1), t_change_c(1), 80, p_ag_change(1), 'filled', 'o', 'MarkerEdgeColor', 'k'); hold on;
scatter(p_change_c(2), t_change_c(2), 100, p_ag_change(2), 'filled', 'square', 'MarkerEdgeColor', 'k'); hold on;
scatter(p_change_c(3), t_change_c(3), 80, p_ag_change(3), 'filled', 'diamond', 'MarkerEdgeColor', 'k'); hold on;
scatter(p_change_c(4), t_change_c(4), 100, p_ag_change(4), 'filled', 'pentagram', 'MarkerEdgeColor', 'k'); hold on;
scatter(p_change_c(5), t_change_c(5), 100, p_ag_change(5), 'filled', '^', 'MarkerEdgeColor', 'k'); hold on;
scatter(p_change_c(6), t_change_c(6), 100, p_ag_change(6), 'filled', 'v', 'MarkerEdgeColor', 'k'); hold on;
scatter(p_change_c(7), t_change_c(7), 100, p_ag_change(7), 'filled', '>', 'MarkerEdgeColor', 'k'); hold on;
scatter(p_change_c(8), t_change_c(8), 100, p_ag_change(8), 'filled', '<', 'MarkerEdgeColor', 'k'); hold on;
colormap(a5, brewermap([],'*Blues'));   
% caxis([-7,7])

% xlabel('Δ Precipitation (%)', 'FontSize', label_size); 
% ylabel('Δ Temperature (°C)', 'FontSize', label_size); 
grid on; box on;
colorbar
text(0.02, 0.90, '(a5) NE', 'FontSize', text_size, 'FontWeight','bold', 'Units', 'normalized')






% ----------------------------------------------------------------------------------------------------------------
% 6-D0 change, C6-SE
a6 = subplot(4,3,6)

c = 6;

% column 1-45_c_n, 2-45_c_f, 3-45_h_n, 4-45_h_f, 5-85_c_n, 6-85_c_f, 7-85_h_n, 8-85_h_f
p_change_c = p_change(c,:);  % 1x8
t_change_c = t_change(c,:);  % 1x8
p_ag_change = md2ad_d1(c,:);

scatter(p_change_c(1), t_change_c(1), 80, p_ag_change(1), 'filled', 'o', 'MarkerEdgeColor', 'k'); hold on;
scatter(p_change_c(2), t_change_c(2), 100, p_ag_change(2), 'filled', 'square', 'MarkerEdgeColor', 'k'); hold on;
scatter(p_change_c(3), t_change_c(3), 80, p_ag_change(3), 'filled', 'diamond', 'MarkerEdgeColor', 'k'); hold on;
scatter(p_change_c(4), t_change_c(4), 100, p_ag_change(4), 'filled', 'pentagram', 'MarkerEdgeColor', 'k'); hold on;
scatter(p_change_c(5), t_change_c(5), 100, p_ag_change(5), 'filled', '^', 'MarkerEdgeColor', 'k'); hold on;
scatter(p_change_c(6), t_change_c(6), 100, p_ag_change(6), 'filled', 'v', 'MarkerEdgeColor', 'k'); hold on;
scatter(p_change_c(7), t_change_c(7), 100, p_ag_change(7), 'filled', '>', 'MarkerEdgeColor', 'k'); hold on;
scatter(p_change_c(8), t_change_c(8), 100, p_ag_change(8), 'filled', '<', 'MarkerEdgeColor', 'k'); hold on;
colormap(a6, brewermap([],'Reds'));   

% xlabel('Δ Precipitation (%)', 'FontSize', label_size); 
% ylabel('Δ Temperature (°C)', 'FontSize', label_size); 
grid on; box on;
colorbar
text(0.02, 0.90, '(a6) SE', 'FontSize', text_size, 'FontWeight','bold', 'Units', 'normalized')





% ----------------------------------------------------------------------------------------------------------------
% 1-D0 change, C1-NW: M2H

a7 = subplot(4,3,7)

c = 1;

p_change_c = p_change(c,:);  % 1x8
t_change_c = t_change(c,:);  % 1x8
p_hy_change = md2hd_d1(c,:);

scatter(p_change_c(1), t_change_c(1), 80, p_hy_change(1), 'filled', 'o', 'MarkerEdgeColor', 'k'); hold on;
scatter(p_change_c(2), t_change_c(2), 100, p_hy_change(2), 'filled', 'square', 'MarkerEdgeColor', 'k'); hold on;
scatter(p_change_c(3), t_change_c(3), 80, p_hy_change(3), 'filled', 'diamond', 'MarkerEdgeColor', 'k'); hold on;
scatter(p_change_c(4), t_change_c(4), 100, p_hy_change(4), 'filled', 'pentagram', 'MarkerEdgeColor', 'k'); hold on;
scatter(p_change_c(5), t_change_c(5), 100, p_hy_change(5), 'filled', '^', 'MarkerEdgeColor', 'k'); hold on;
scatter(p_change_c(6), t_change_c(6), 100, p_hy_change(6), 'filled', 'v', 'MarkerEdgeColor', 'k'); hold on;
scatter(p_change_c(7), t_change_c(7), 100, p_hy_change(7), 'filled', '>', 'MarkerEdgeColor', 'k'); hold on;
scatter(p_change_c(8), t_change_c(8), 100, p_hy_change(8), 'filled', '<', 'MarkerEdgeColor', 'k'); hold on;
colormap(a7, brewermap([],'Reds'));   

grid on; box on;
colorbar
text(0.02, 0.90, '(b1) NW', 'FontSize', text_size, 'FontWeight','bold', 'Units', 'normalized')
% xlabel('Δ Precipitation (%)', 'FontSize', label_size); 
ylabel('Δ Temperature (°C)', 'FontSize', label_size); 



% ----------------------------------------------------------------------------------------------------------------
% 1-D0 change, C2-SW: M2H

a8 = subplot(4,3,8)

c = 2;

p_change_c = p_change(c,:);  % 1x8
t_change_c = t_change(c,:);  % 1x8
p_hy_change = md2hd_d1(c,:);

scatter(p_change_c(1), t_change_c(1), 80, p_hy_change(1), 'filled', 'o', 'MarkerEdgeColor', 'k'); hold on;
scatter(p_change_c(2), t_change_c(2), 100, p_hy_change(2), 'filled', 'square', 'MarkerEdgeColor', 'k'); hold on;
scatter(p_change_c(3), t_change_c(3), 80, p_hy_change(3), 'filled', 'diamond', 'MarkerEdgeColor', 'k'); hold on;
scatter(p_change_c(4), t_change_c(4), 100, p_hy_change(4), 'filled', 'pentagram', 'MarkerEdgeColor', 'k'); hold on;
scatter(p_change_c(5), t_change_c(5), 100, p_hy_change(5), 'filled', '^', 'MarkerEdgeColor', 'k'); hold on;
scatter(p_change_c(6), t_change_c(6), 100, p_hy_change(6), 'filled', 'v', 'MarkerEdgeColor', 'k'); hold on;
scatter(p_change_c(7), t_change_c(7), 100, p_hy_change(7), 'filled', '>', 'MarkerEdgeColor', 'k'); hold on;
scatter(p_change_c(8), t_change_c(8), 100, p_hy_change(8), 'filled', '<', 'MarkerEdgeColor', 'k'); hold on;
colormap(a8, brewermap([],'Reds'));   

grid on; box on;
colorbar
text(0.02, 0.90, '(b2) SW', 'FontSize', text_size, 'FontWeight','bold', 'Units', 'normalized')
% xlabel('Δ Precipitation (%)', 'FontSize', label_size); 
% ylabel('Δ Temperature (°C)', 'FontSize', label_size); 



% ----------------------------------------------------------------------------------------------------------------
% 1-D0 change, C3-MW: M2H

a9 = subplot(4,3,9)

c = 3;

p_change_c = p_change(c,:);  % 1x8
t_change_c = t_change(c,:);  % 1x8
p_hy_change = md2hd_d1(c,:);

scatter(p_change_c(1), t_change_c(1), 80, p_hy_change(1), 'filled', 'o', 'MarkerEdgeColor', 'k'); hold on;
scatter(p_change_c(2), t_change_c(2), 100, p_hy_change(2), 'filled', 'square', 'MarkerEdgeColor', 'k'); hold on;
scatter(p_change_c(3), t_change_c(3), 80, p_hy_change(3), 'filled', 'diamond', 'MarkerEdgeColor', 'k'); hold on;
scatter(p_change_c(4), t_change_c(4), 100, p_hy_change(4), 'filled', 'pentagram', 'MarkerEdgeColor', 'k'); hold on;
scatter(p_change_c(5), t_change_c(5), 100, p_hy_change(5), 'filled', '^', 'MarkerEdgeColor', 'k'); hold on;
scatter(p_change_c(6), t_change_c(6), 100, p_hy_change(6), 'filled', 'v', 'MarkerEdgeColor', 'k'); hold on;
scatter(p_change_c(7), t_change_c(7), 100, p_hy_change(7), 'filled', '>', 'MarkerEdgeColor', 'k'); hold on;
scatter(p_change_c(8), t_change_c(8), 100, p_hy_change(8), 'filled', '<', 'MarkerEdgeColor', 'k'); hold on;
colormap(a9, brewermap([],'Reds'));   

grid on; box on;
colorbar
text(0.02, 0.90, '(b3) MW', 'FontSize', text_size, 'FontWeight','bold', 'Units', 'normalized')
% xlabel('Δ Precipitation (%)', 'FontSize', label_size); 
% ylabel('Δ Temperature (°C)', 'FontSize', label_size); 




% ----------------------------------------------------------------------------------------------------------------
% 1-D0 change, C4-GP: M2H

a10 = subplot(4,3,10)

c = 4;

p_change_c = p_change(c,:);  % 1x8
t_change_c = t_change(c,:);  % 1x8
p_hy_change = md2hd_d1(c,:);

scatter(p_change_c(1), t_change_c(1), 80, p_hy_change(1), 'filled', 'o', 'MarkerEdgeColor', 'k'); hold on;
scatter(p_change_c(2), t_change_c(2), 100, p_hy_change(2), 'filled', 'square', 'MarkerEdgeColor', 'k'); hold on;
scatter(p_change_c(3), t_change_c(3), 80, p_hy_change(3), 'filled', 'diamond', 'MarkerEdgeColor', 'k'); hold on;
scatter(p_change_c(4), t_change_c(4), 100, p_hy_change(4), 'filled', 'pentagram', 'MarkerEdgeColor', 'k'); hold on;
scatter(p_change_c(5), t_change_c(5), 100, p_hy_change(5), 'filled', '^', 'MarkerEdgeColor', 'k'); hold on;
scatter(p_change_c(6), t_change_c(6), 100, p_hy_change(6), 'filled', 'v', 'MarkerEdgeColor', 'k'); hold on;
scatter(p_change_c(7), t_change_c(7), 100, p_hy_change(7), 'filled', '>', 'MarkerEdgeColor', 'k'); hold on;
scatter(p_change_c(8), t_change_c(8), 100, p_hy_change(8), 'filled', '<', 'MarkerEdgeColor', 'k'); hold on;
colormap(a10, brewermap([],'*RdBu'));   
caxis([-6,6]) 

grid on; box on;
colorbar
text(0.02, 0.90, '(b4) GP', 'FontSize', text_size, 'FontWeight','bold', 'Units', 'normalized')
xlabel('Δ Precipitation (%)', 'FontSize', label_size); 
ylabel('Δ Temperature (°C)', 'FontSize', label_size); 





% ----------------------------------------------------------------------------------------------------------------
% 1-D0 change, C5-NE: M2H

a11 = subplot(4,3,11)

c = 5;

p_change_c = p_change(c,:);  % 1x8
t_change_c = t_change(c,:);  % 1x8
p_hy_change = md2hd_d1(c,:);

scatter(p_change_c(1), t_change_c(1), 80, p_hy_change(1), 'filled', 'o', 'MarkerEdgeColor', 'k'); hold on;
scatter(p_change_c(2), t_change_c(2), 100, p_hy_change(2), 'filled', 'square', 'MarkerEdgeColor', 'k'); hold on;
scatter(p_change_c(3), t_change_c(3), 80, p_hy_change(3), 'filled', 'diamond', 'MarkerEdgeColor', 'k'); hold on;
scatter(p_change_c(4), t_change_c(4), 100, p_hy_change(4), 'filled', 'pentagram', 'MarkerEdgeColor', 'k'); hold on;
scatter(p_change_c(5), t_change_c(5), 100, p_hy_change(5), 'filled', '^', 'MarkerEdgeColor', 'k'); hold on;
scatter(p_change_c(6), t_change_c(6), 100, p_hy_change(6), 'filled', 'v', 'MarkerEdgeColor', 'k'); hold on;
scatter(p_change_c(7), t_change_c(7), 100, p_hy_change(7), 'filled', '>', 'MarkerEdgeColor', 'k'); hold on;
scatter(p_change_c(8), t_change_c(8), 100, p_hy_change(8), 'filled', '<', 'MarkerEdgeColor', 'k'); hold on;
colormap(a11, brewermap([],'*Blues'));   
% caxis([-6,6]) 

grid on; box on;
colorbar
text(0.02, 0.90, '(b5) NE', 'FontSize', text_size, 'FontWeight','bold', 'Units', 'normalized')
xlabel('Δ Precipitation (%)', 'FontSize', label_size); 
% ylabel('Δ Temperature (°C)', 'FontSize', label_size); 




% ----------------------------------------------------------------------------------------------------------------
% 1-D0 change, C6-SE: M2H

a12 = subplot(4,3,12)

c = 6;

p_change_c = p_change(c,:);  % 1x8
t_change_c = t_change(c,:);  % 1x8
p_hy_change = md2hd_d1(c,:);

scatter(p_change_c(1), t_change_c(1), 80, p_hy_change(1), 'filled', 'o', 'MarkerEdgeColor', 'k'); hold on;
scatter(p_change_c(2), t_change_c(2), 100, p_hy_change(2), 'filled', 'square', 'MarkerEdgeColor', 'k'); hold on;
scatter(p_change_c(3), t_change_c(3), 80, p_hy_change(3), 'filled', 'diamond', 'MarkerEdgeColor', 'k'); hold on;
scatter(p_change_c(4), t_change_c(4), 100, p_hy_change(4), 'filled', 'pentagram', 'MarkerEdgeColor', 'k'); hold on;
scatter(p_change_c(5), t_change_c(5), 100, p_hy_change(5), 'filled', '^', 'MarkerEdgeColor', 'k'); hold on;
scatter(p_change_c(6), t_change_c(6), 100, p_hy_change(6), 'filled', 'v', 'MarkerEdgeColor', 'k'); hold on;
scatter(p_change_c(7), t_change_c(7), 100, p_hy_change(7), 'filled', '>', 'MarkerEdgeColor', 'k'); hold on;
scatter(p_change_c(8), t_change_c(8), 100, p_hy_change(8), 'filled', '<', 'MarkerEdgeColor', 'k'); hold on;
colormap(a12, brewermap([],'Reds'));   
% caxis([-6,6]) 

grid on; box on;
colorbar
text(0.02, 0.90, '(b6) SE', 'FontSize', text_size, 'FontWeight','bold', 'Units', 'normalized')
xlabel('Δ Precipitation (%)', 'FontSize', label_size); 
% ylabel('Δ Temperature (°C)', 'FontSize', label_size); 






% all_axes = [a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12];  % assuming all 12 subplots are defined
% 
% for i = 1:length(all_axes)
%     axes(all_axes(i));
%     cb = colorbar;
%     cb.Position(3) = cb.Position(3) * 0.4;  % shrink width
% end

%% output the plot

fig = gcf;
fig.PaperUnits = 'inches';

% fig.PaperPosition = [0 0 17.7 8];
fig.PaperPosition = [0 0 13 10];
print('ScreenSizeFigure', '-dpng', '-r300')








