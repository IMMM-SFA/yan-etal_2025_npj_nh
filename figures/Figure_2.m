%% load all data

clear all; clc;

US = load('./us_coor.txt');
SL = load('./sl_coor.txt');

label_size = 10; line_width = 1;   box_width = 0.5;
title_size = 10; tick_size = 10; text_size = 10;  
scatter_size = 10;  legend_size = 10;  colorbar_size= 10;




%% plot one spatial plot only (meteo drought)

% -----------------------------------------------------------------------------
% 1. RCP4.5 cooler near: change in Tair
a1 = subplot(4,4,1)

min1 = 1;max1 = 8;
data = load('./drought_P_T_change.txt'); lon = data(:,3); lat = data(:,2); 

plot(US(:,1), US(:,2),'.','MarkerSize',2,'Color',[169 169 169]/255); hold on; 
% a1 = subplot(6,4,1)

scatter(lon, lat, scatter_size, ((data(:,17)-data(:,16))),...
    'o','filled', 'MarkerEdgeColor',[105 105 105]/255, 'LineWidth',line_width-0.5); hold on;
set(gca,'FontSize',tick_size);
colormap(a1, brewermap([],'YlOrBr'));    
caxis([min1 max1]); 

c= colorbar





xlim([-128 -64]); ylim([22 52]); box on;
xticks = [-120, -110, -100, -90 -80 -70];
yticks = [25, 30, 35, 40, 45, 50];

xticklabels = arrayfun(@(x) sprintf('%d\\circ', x), xticks, 'UniformOutput', false);
yticklabels = arrayfun(@(y) sprintf('%d\\circ', y), yticks, 'UniformOutput', false);

set(gca, 'XTickLabel', xticklabels);
set(gca, 'YTickLabel', yticklabels);
set(gca, 'XTickLabel', {});

% xlabel('Lon. (°)', 'FontSize', label_size); 
% ylabel('Cooler', 'FontSize', label_size, 'FontWeight','bold'); 
box on; 
title('(a1): Changes in Mean Tair (°C)', 'FontSize', title_size);
% text(0.9, 0.15, '(a2): Changes in Total Duration (%)', 'Units', 'normalized', 'Fontsize', text_size )

text(-120, 44, 'NW',  'Fontsize', text_size, 'FontWeight','bold')
text(-117, 38, 'SW',  'Fontsize', text_size, 'FontWeight','bold')
text(-95.5, 46, 'MW',  'Fontsize', text_size, 'FontWeight','bold')
text(-104, 33, 'GP',  'Fontsize', text_size, 'FontWeight','bold')
text(-90.4, 33.4, 'SE',  'Fontsize', text_size, 'FontWeight','bold')
text(-76, 43.3, 'NE',  'Fontsize', text_size, 'FontWeight','bold')

plot([-109 -124.557], [42 42], 'k-', 'LineWidth', line_width);
plot([-109 -109], [31.3435 49], 'k-', 'LineWidth', line_width);
plot([-76 -109], [37 37], 'k-', 'LineWidth', line_width);
plot([-84.8011 -84.8011], [37 46.7578], 'k-', 'LineWidth', line_width);
plot([-94.4381 -94.4381], [29.5785 37], 'k-', 'LineWidth', line_width);


% -----------------------------------------------------------------------------
% 2. RCP4.5 cooler near: change in Precip
a2 = subplot(4,4,2)

min1 = -25;max1 = 25;
data = load('./drought_P_T_change.txt'); lon = data(:,3); lat = data(:,2); 

plot(US(:,1), US(:,2),'.','MarkerSize',2,'Color',[169 169 169]/255); hold on; 
% a1 = subplot(6,4,1)

scatter(lon, lat, scatter_size, ((data(:,8)-data(:,7)))./data(:,7)*100,...
    'o','filled', 'MarkerEdgeColor',[105 105 105]/255, 'LineWidth',line_width-0.5); hold on;
set(gca,'FontSize',tick_size);
colormap(a2, brewermap([],'*RdBu'));    
caxis([min1 max1]); 
c = colorbar

xlim([-128 -64]); ylim([22 52]); box on;
xticks = [-120, -110, -100, -90 -80 -70];
yticks = [25, 30, 35, 40, 45, 50];

xticklabels = arrayfun(@(x) sprintf('%d\\circ', x), xticks, 'UniformOutput', false);
yticklabels = arrayfun(@(y) sprintf('%d\\circ', y), yticks, 'UniformOutput', false);

set(gca, 'XTickLabel', xticklabels);
set(gca, 'YTickLabel', yticklabels);
set(gca, 'XTickLabel', {});
set(gca, 'YTickLabel', {});

% xlabel('Lon. (°)', 'FontSize', label_size); 
% ylabel('Cooler', 'FontSize', label_size, 'FontWeight','bold'); 
box on; 
title('(b1): Changes in Annual Precip. (%)', 'FontSize', title_size);
% text(0.9, 0.15, '(a2): Changes in Total Duration (%)', 'Units', 'normalized', 'Fontsize', text_size )

% text(-120, 44, 'NW',  'Fontsize', text_size, 'FontWeight','bold')
% text(-117, 38, 'SW',  'Fontsize', text_size, 'FontWeight','bold')
% text(-95.5, 46, 'MW',  'Fontsize', text_size, 'FontWeight','bold')
% text(-104, 33, 'GP',  'Fontsize', text_size, 'FontWeight','bold')
% text(-90.4, 33.4, 'SE',  'Fontsize', text_size, 'FontWeight','bold')
% text(-76, 43.3, 'NE',  'Fontsize', text_size, 'FontWeight','bold')

plot([-109 -124.557], [42 42], 'k-', 'LineWidth', line_width);
plot([-109 -109], [31.3435 49], 'k-', 'LineWidth', line_width);
plot([-76 -109], [37 37], 'k-', 'LineWidth', line_width);
plot([-84.8011 -84.8011], [37 46.7578], 'k-', 'LineWidth', line_width);
plot([-94.4381 -94.4381], [29.5785 37], 'k-', 'LineWidth', line_width);




% -----------------------------------------------------------------------------
% 3. RCP8.5 hotter future: change in Tair
a3 = subplot(4,4,3)

min1 = 1;max1 = 8;
data = load('./drought_P_T_change.txt'); lon = data(:,3); lat = data(:,2); 

plot(US(:,1), US(:,2),'.','MarkerSize',2,'Color',[169 169 169]/255); hold on; 
% a1 = subplot(6,4,1)

scatter(lon, lat, scatter_size, ((data(:,24)-data(:,16))),...
    'o','filled', 'MarkerEdgeColor',[105 105 105]/255, 'LineWidth',line_width-0.5); hold on;
set(gca,'FontSize',tick_size);
colormap(a3, brewermap([],'YlOrBr'));    
caxis([min1 max1]); 
c = colorbar

xlim([-128 -64]); ylim([22 52]); box on;
xticks = [-120, -110, -100, -90 -80 -70];
yticks = [25, 30, 35, 40, 45, 50];

xticklabels = arrayfun(@(x) sprintf('%d\\circ', x), xticks, 'UniformOutput', false);
yticklabels = arrayfun(@(y) sprintf('%d\\circ', y), yticks, 'UniformOutput', false);

set(gca, 'XTickLabel', xticklabels);
set(gca, 'YTickLabel', yticklabels);
set(gca, 'XTickLabel', {});
set(gca, 'YTickLabel', {});

% xlabel('Lon. (°)', 'FontSize', label_size); 
% ylabel('Cooler', 'FontSize', label_size, 'FontWeight','bold'); 
box on; 
title('(c1): Changes in Mean Tair (°C)', 'FontSize', title_size);
% text(0.9, 0.15, '(a2): Changes in Total Duration (%)', 'Units', 'normalized', 'Fontsize', text_size )

% text(-120, 44, 'NW',  'Fontsize', text_size, 'FontWeight','bold')
% text(-117, 38, 'SW',  'Fontsize', text_size, 'FontWeight','bold')
% text(-95.5, 46, 'MW',  'Fontsize', text_size, 'FontWeight','bold')
% text(-104, 33, 'GP',  'Fontsize', text_size, 'FontWeight','bold')
% text(-90.4, 33.4, 'SE',  'Fontsize', text_size, 'FontWeight','bold')
% text(-76, 43.3, 'NE',  'Fontsize', text_size, 'FontWeight','bold')

plot([-109 -124.557], [42 42], 'k-', 'LineWidth', line_width);
plot([-109 -109], [31.3435 49], 'k-', 'LineWidth', line_width);
plot([-76 -109], [37 37], 'k-', 'LineWidth', line_width);
plot([-84.8011 -84.8011], [37 46.7578], 'k-', 'LineWidth', line_width);
plot([-94.4381 -94.4381], [29.5785 37], 'k-', 'LineWidth', line_width);


% -----------------------------------------------------------------------------
% 4. RCP8.5 hotter future: change in precipitation
a4 = subplot(4,4,4)

min1 = -25;max1 = 25;
data = load('./drought_P_T_change.txt'); lon = data(:,3); lat = data(:,2); 

plot(US(:,1), US(:,2),'.','MarkerSize',2,'Color',[169 169 169]/255); hold on; 
% a1 = subplot(6,4,1)

scatter(lon, lat, scatter_size, ((data(:,15)-data(:,7)))./data(:,7)*100,...
    'o','filled', 'MarkerEdgeColor',[105 105 105]/255, 'LineWidth',line_width-0.5); hold on;
set(gca,'FontSize',tick_size);
colormap(a4, brewermap([],'RdBu'));    
caxis([min1 max1]); 
c = colorbar

xlim([-128 -64]); ylim([22 52]); box on;
xticks = [-120, -110, -100, -90 -80 -70];
yticks = [25, 30, 35, 40, 45, 50];

xticklabels = arrayfun(@(x) sprintf('%d\\circ', x), xticks, 'UniformOutput', false);
yticklabels = arrayfun(@(y) sprintf('%d\\circ', y), yticks, 'UniformOutput', false);

set(gca, 'XTickLabel', xticklabels);
set(gca, 'YTickLabel', yticklabels);
set(gca, 'XTickLabel', {});
set(gca, 'YTickLabel', {});

% xlabel('Lon. (°)', 'FontSize', label_size); 
% ylabel('Cooler', 'FontSize', label_size, 'FontWeight','bold'); 
box on; 
title('(d1): Changes in Annual Precip. (%)', 'FontSize', title_size);
% text(0.9, 0.15, '(a2): Changes in Total Duration (%)', 'Units', 'normalized', 'Fontsize', text_size )

% text(-120, 44, 'NW',  'Fontsize', text_size, 'FontWeight','bold')
% text(-117, 38, 'SW',  'Fontsize', text_size, 'FontWeight','bold')
% text(-95.5, 46, 'MW',  'Fontsize', text_size, 'FontWeight','bold')
% text(-104, 33, 'GP',  'Fontsize', text_size, 'FontWeight','bold')
% text(-90.4, 33.4, 'SE',  'Fontsize', text_size, 'FontWeight','bold')
% text(-76, 43.3, 'NE',  'Fontsize', text_size, 'FontWeight','bold')

plot([-109 -124.557], [42 42], 'k-', 'LineWidth', line_width);
plot([-109 -109], [31.3435 49], 'k-', 'LineWidth', line_width);
plot([-76 -109], [37 37], 'k-', 'LineWidth', line_width);
plot([-84.8011 -84.8011], [37 46.7578], 'k-', 'LineWidth', line_width);
plot([-94.4381 -94.4381], [29.5785 37], 'k-', 'LineWidth', line_width);






index1 = 7;       % meteo(7);  agri(13);  hydro(19)
index2 = 12;      % meteo(12); agri(18);  hydro(24)

data = load('./drought_chara_historical.txt'); lon = data(:,3); lat = data(:,2); meteo_hist = data(:,index1:index2);

data = load('./drought_chara_45_c_n.txt'); meteo_45_c_n = data(:,index1:index2);
% data = load('./drought_chara_45_c_f.txt'); meteo_45_c_f = data(:,index1:index2);
% data = load('./drought_chara_45_h_n.txt'); meteo_45_h_n = data(:,index1:index2);
% data = load('./drought_chara_45_h_f.txt'); meteo_45_h_f = data(:,index1:index2);
% 
% data = load('./drought_chara_85_c_n.txt'); meteo_85_c_n = data(:,index1:index2);
% data = load('./drought_chara_85_c_f.txt'); meteo_85_c_f = data(:,index1:index2);
% data = load('./drought_chara_85_h_n.txt'); meteo_85_h_n = data(:,index1:index2);
data = load('./drought_chara_85_h_f.txt'); meteo_85_h_f = data(:,index1:index2);



% -----------------------------------------------------------------------------
% 5. RCP4.5 cooler meteo drought: total duration
a5 = subplot(4,4,5)
min1 = -10; max1 = 90;
index = 2; num_yr = 40;
plot(US(:,1), US(:,2),'.','MarkerSize',2,'Color',[169 169 169]/255); hold on; 
% a1 = subplot(6,4,1)

scatter(lon, lat, scatter_size, (meteo_45_c_n(:,index)*num_yr-meteo_hist(:,index)*num_yr)./(meteo_hist(:,index)*num_yr)*100,...
    'o','filled', 'MarkerEdgeColor',[105 105 105]/255, 'LineWidth',line_width-0.5); hold on;
set(gca,'FontSize',tick_size);
colormap(a5, brewermap([],'YlOrBr'));    
caxis([min1 max1]); 
c = colorbar

xlim([-128 -64]); ylim([22 52]); box on;
xticks = [-120, -110, -100, -90 -80 -70];
yticks = [25, 30, 35, 40, 45, 50];

xticklabels = arrayfun(@(x) sprintf('%d\\circ', x), xticks, 'UniformOutput', false);
yticklabels = arrayfun(@(y) sprintf('%d\\circ', y), yticks, 'UniformOutput', false);

set(gca, 'XTickLabel', xticklabels);
set(gca, 'YTickLabel', yticklabels);
set(gca, 'XTickLabel', {});
% set(gca, 'YTickLabel', {});

% xlabel('Lon. (°)', 'FontSize', label_size); 
% ylabel('Cooler', 'FontSize', label_size, 'FontWeight','bold'); 
box on; 
title('(a2): Changes in Total Duration (%)', 'FontSize', title_size);
% text(0.9, 0.15, '(a2): Changes in Total Duration (%)', 'Units', 'normalized', 'Fontsize', text_size )

% text(-120, 44, 'NW',  'Fontsize', text_size, 'FontWeight','bold')
% text(-117, 38, 'SW',  'Fontsize', text_size, 'FontWeight','bold')
% text(-95.5, 46, 'MW',  'Fontsize', text_size, 'FontWeight','bold')
% text(-104, 33, 'GP',  'Fontsize', text_size, 'FontWeight','bold')
% text(-90.4, 33.4, 'SE',  'Fontsize', text_size, 'FontWeight','bold')
% text(-76, 43.3, 'NE',  'Fontsize', text_size, 'FontWeight','bold')

plot([-109 -124.557], [42 42], 'k-', 'LineWidth', line_width);
plot([-109 -109], [31.3435 49], 'k-', 'LineWidth', line_width);
plot([-76 -109], [37 37], 'k-', 'LineWidth', line_width);
plot([-84.8011 -84.8011], [37 46.7578], 'k-', 'LineWidth', line_width);
plot([-94.4381 -94.4381], [29.5785 37], 'k-', 'LineWidth', line_width);


% -----------------------------------------------------------------------------
% 6. RCP4.5 cooler meteo drought: mean severity
a6 = subplot(4,4,6)
min1 = -10; max1 = 90;
index = 5; num_yr = 40;
plot(US(:,1), US(:,2),'.','MarkerSize',2,'Color',[169 169 169]/255); hold on; 
% a1 = subplot(6,4,1)

scatter(lon, lat, scatter_size, (abs(meteo_45_c_n(:,index))-abs(meteo_hist(:,index)))./abs(meteo_hist(:,index))*100,...
    'o','filled', 'MarkerEdgeColor',[105 105 105]/255, 'LineWidth',line_width-0.5); hold on;
set(gca,'FontSize',tick_size);
colormap(a6, brewermap([],'YlOrBr'));    
caxis([min1 max1]); 
c = colorbar

xlim([-128 -64]); ylim([22 52]); box on;
xticks = [-120, -110, -100, -90 -80 -70];
yticks = [25, 30, 35, 40, 45, 50];

xticklabels = arrayfun(@(x) sprintf('%d\\circ', x), xticks, 'UniformOutput', false);
yticklabels = arrayfun(@(y) sprintf('%d\\circ', y), yticks, 'UniformOutput', false);

set(gca, 'XTickLabel', xticklabels);
set(gca, 'YTickLabel', yticklabels);
set(gca, 'XTickLabel', {});
set(gca, 'YTickLabel', {});

% xlabel('Lon. (°)', 'FontSize', label_size); 
% ylabel('Cooler', 'FontSize', label_size, 'FontWeight','bold'); 
box on; 
title('(b2): Changes in Mean Severity (%)', 'FontSize', title_size);
% text(0.9, 0.15, '(a2): Changes in Total Duration (%)', 'Units', 'normalized', 'Fontsize', text_size )

% text(-120, 44, 'NW',  'Fontsize', text_size, 'FontWeight','bold')
% text(-117, 38, 'SW',  'Fontsize', text_size, 'FontWeight','bold')
% text(-95.5, 46, 'MW',  'Fontsize', text_size, 'FontWeight','bold')
% text(-104, 33, 'GP',  'Fontsize', text_size, 'FontWeight','bold')
% text(-90.4, 33.4, 'SE',  'Fontsize', text_size, 'FontWeight','bold')
% text(-76, 43.3, 'NE',  'Fontsize', text_size, 'FontWeight','bold')

plot([-109 -124.557], [42 42], 'k-', 'LineWidth', line_width);
plot([-109 -109], [31.3435 49], 'k-', 'LineWidth', line_width);
plot([-76 -109], [37 37], 'k-', 'LineWidth', line_width);
plot([-84.8011 -84.8011], [37 46.7578], 'k-', 'LineWidth', line_width);
plot([-94.4381 -94.4381], [29.5785 37], 'k-', 'LineWidth', line_width);


% -----------------------------------------------------------------------------
% 7. RCP8.5 hotter meteo drought: mean duration
a7 = subplot(4,4,7)
min1 = -10; max1 = 90;
index = 2; num_yr = 40;
plot(US(:,1), US(:,2),'.','MarkerSize',2,'Color',[169 169 169]/255); hold on; 
% a1 = subplot(6,4,1)

scatter(lon, lat, scatter_size, (abs(meteo_85_h_f(:,index))-abs(meteo_hist(:,index)))./abs(meteo_hist(:,index))*100,...
    'o','filled', 'MarkerEdgeColor',[105 105 105]/255, 'LineWidth',line_width-0.5); hold on;
set(gca,'FontSize',tick_size);
colormap(a7, brewermap([],'YlOrBr'));    
caxis([min1 max1]); 
c = colorbar

xlim([-128 -64]); ylim([22 52]); box on;
xticks = [-120, -110, -100, -90 -80 -70];
yticks = [25, 30, 35, 40, 45, 50];

xticklabels = arrayfun(@(x) sprintf('%d\\circ', x), xticks, 'UniformOutput', false);
yticklabels = arrayfun(@(y) sprintf('%d\\circ', y), yticks, 'UniformOutput', false);

set(gca, 'XTickLabel', xticklabels);
set(gca, 'YTickLabel', yticklabels);
set(gca, 'XTickLabel', {});
set(gca, 'YTickLabel', {});

% xlabel('Lon. (°)', 'FontSize', label_size); 
% ylabel('Cooler', 'FontSize', label_size, 'FontWeight','bold'); 
box on; 
title('(c2): Changes in Total Duration (%)', 'FontSize', title_size);
% text(0.9, 0.15, '(a2): Changes in Total Duration (%)', 'Units', 'normalized', 'Fontsize', text_size )

% text(-120, 44, 'NW',  'Fontsize', text_size, 'FontWeight','bold')
% text(-117, 38, 'SW',  'Fontsize', text_size, 'FontWeight','bold')
% text(-95.5, 46, 'MW',  'Fontsize', text_size, 'FontWeight','bold')
% text(-104, 33, 'GP',  'Fontsize', text_size, 'FontWeight','bold')
% text(-90.4, 33.4, 'SE',  'Fontsize', text_size, 'FontWeight','bold')
% text(-76, 43.3, 'NE',  'Fontsize', text_size, 'FontWeight','bold')

plot([-109 -124.557], [42 42], 'k-', 'LineWidth', line_width);
plot([-109 -109], [31.3435 49], 'k-', 'LineWidth', line_width);
plot([-76 -109], [37 37], 'k-', 'LineWidth', line_width);
plot([-84.8011 -84.8011], [37 46.7578], 'k-', 'LineWidth', line_width);
plot([-94.4381 -94.4381], [29.5785 37], 'k-', 'LineWidth', line_width);


% -----------------------------------------------------------------------------
% 8. RCP8.5 hotter meteo drought: mean severity
a8 = subplot(4,4,8)
min1 = -10; max1 = 90;
index = 5; num_yr = 40;
plot(US(:,1), US(:,2),'.','MarkerSize',2,'Color',[169 169 169]/255); hold on; 
% a1 = subplot(6,4,1)

scatter(lon, lat, scatter_size, (abs(meteo_85_h_f(:,index))-abs(meteo_hist(:,index)))./abs(meteo_hist(:,index))*100,...
    'o','filled', 'MarkerEdgeColor',[105 105 105]/255, 'LineWidth',line_width-0.5); hold on;
set(gca,'FontSize',tick_size);
colormap(a8, brewermap([],'YlOrBr'));    
caxis([min1 max1]); 
c = colorbar

xlim([-128 -64]); ylim([22 52]); box on;
xticks = [-120, -110, -100, -90 -80 -70];
yticks = [25, 30, 35, 40, 45, 50];

xticklabels = arrayfun(@(x) sprintf('%d\\circ', x), xticks, 'UniformOutput', false);
yticklabels = arrayfun(@(y) sprintf('%d\\circ', y), yticks, 'UniformOutput', false);

set(gca, 'XTickLabel', xticklabels);
set(gca, 'YTickLabel', yticklabels);
set(gca, 'XTickLabel', {});
set(gca, 'YTickLabel', {});

% xlabel('Lon. (°)', 'FontSize', label_size); 
% ylabel('Cooler', 'FontSize', label_size, 'FontWeight','bold'); 
box on; 
title('(d2): Changes in Mean Severity (%)', 'FontSize', title_size);
% text(0.9, 0.15, '(a2): Changes in Total Duration (%)', 'Units', 'normalized', 'Fontsize', text_size )

% text(-120, 44, 'NW',  'Fontsize', text_size, 'FontWeight','bold')
% text(-117, 38, 'SW',  'Fontsize', text_size, 'FontWeight','bold')
% text(-95.5, 46, 'MW',  'Fontsize', text_size, 'FontWeight','bold')
% text(-104, 33, 'GP',  'Fontsize', text_size, 'FontWeight','bold')
% text(-90.4, 33.4, 'SE',  'Fontsize', text_size, 'FontWeight','bold')
% text(-76, 43.3, 'NE',  'Fontsize', text_size, 'FontWeight','bold')

plot([-109 -124.557], [42 42], 'k-', 'LineWidth', line_width);
plot([-109 -109], [31.3435 49], 'k-', 'LineWidth', line_width);
plot([-76 -109], [37 37], 'k-', 'LineWidth', line_width);
plot([-84.8011 -84.8011], [37 46.7578], 'k-', 'LineWidth', line_width);
plot([-94.4381 -94.4381], [29.5785 37], 'k-', 'LineWidth', line_width);







index1 = 13;       % meteo(7);  agri(13);  hydro(19)
index2 = 18;      % meteo(12); agri(18);  hydro(24)

data = load('./drought_chara_historical.txt'); lon = data(:,3); lat = data(:,2); meteo_hist = data(:,index1:index2);

data = load('./drought_chara_45_c_n.txt'); meteo_45_c_n = data(:,index1:index2);
% data = load('./drought_chara_45_c_f.txt'); meteo_45_c_f = data(:,index1:index2);
% data = load('./drought_chara_45_h_n.txt'); meteo_45_h_n = data(:,index1:index2);
% data = load('./drought_chara_45_h_f.txt'); meteo_45_h_f = data(:,index1:index2);
% 
% data = load('./drought_chara_85_c_n.txt'); meteo_85_c_n = data(:,index1:index2);
% data = load('./drought_chara_85_c_f.txt'); meteo_85_c_f = data(:,index1:index2);
% data = load('./drought_chara_85_h_n.txt'); meteo_85_h_n = data(:,index1:index2);
data = load('./drought_chara_85_h_f.txt'); meteo_85_h_f = data(:,index1:index2);


% -----------------------------------------------------------------------------
% 9. RCP4.5 cooler agri drought: total duration
a9 = subplot(4,4,9)
min1 = -80; max1 = 80;
index = 2; num_yr = 40;
plot(US(:,1), US(:,2),'.','MarkerSize',2,'Color',[169 169 169]/255); hold on; 
% a1 = subplot(6,4,1)

scatter(lon, lat, scatter_size, (meteo_45_c_n(:,index)*num_yr-meteo_hist(:,index)*num_yr)./(meteo_hist(:,index)*num_yr)*100,...
    'o','filled', 'MarkerEdgeColor',[105 105 105]/255, 'LineWidth',line_width-0.5); hold on;
set(gca,'FontSize',tick_size);
colormap(a9, brewermap([],'*RdBu'));    
caxis([min1 max1]); 
c = colorbar

xlim([-128 -64]); ylim([22 52]); box on;
xticks = [-120, -110, -100, -90 -80 -70];
yticks = [25, 30, 35, 40, 45, 50];

xticklabels = arrayfun(@(x) sprintf('%d\\circ', x), xticks, 'UniformOutput', false);
yticklabels = arrayfun(@(y) sprintf('%d\\circ', y), yticks, 'UniformOutput', false);

set(gca, 'XTickLabel', xticklabels);
set(gca, 'YTickLabel', yticklabels);
set(gca, 'XTickLabel', {});
% set(gca, 'YTickLabel', {});

% xlabel('Lon. (°)', 'FontSize', label_size); 
% ylabel('Cooler', 'FontSize', label_size, 'FontWeight','bold'); 
box on; 
title('(a3): Changes in Total Duration (%)', 'FontSize', title_size);
% text(0.9, 0.15, '(a2): Changes in Total Duration (%)', 'Units', 'normalized', 'Fontsize', text_size )

% text(-120, 44, 'NW',  'Fontsize', text_size, 'FontWeight','bold')
% text(-117, 38, 'SW',  'Fontsize', text_size, 'FontWeight','bold')
% text(-95.5, 46, 'MW',  'Fontsize', text_size, 'FontWeight','bold')
% text(-104, 33, 'GP',  'Fontsize', text_size, 'FontWeight','bold')
% text(-90.4, 33.4, 'SE',  'Fontsize', text_size, 'FontWeight','bold')
% text(-76, 43.3, 'NE',  'Fontsize', text_size, 'FontWeight','bold')

plot([-109 -124.557], [42 42], 'k-', 'LineWidth', line_width);
plot([-109 -109], [31.3435 49], 'k-', 'LineWidth', line_width);
plot([-76 -109], [37 37], 'k-', 'LineWidth', line_width);
plot([-84.8011 -84.8011], [37 46.7578], 'k-', 'LineWidth', line_width);
plot([-94.4381 -94.4381], [29.5785 37], 'k-', 'LineWidth', line_width);


% -----------------------------------------------------------------------------
% 10. RCP4.5 cooler agri drought: mean severity
a10 = subplot(4,4,10)
min1 = -80; max1 = 80;
index = 5; num_yr = 40;
plot(US(:,1), US(:,2),'.','MarkerSize',2,'Color',[169 169 169]/255); hold on; 
% a1 = subplot(6,4,1)

scatter(lon, lat, scatter_size, (meteo_45_c_n(:,index)*num_yr-meteo_hist(:,index)*num_yr)./(meteo_hist(:,index)*num_yr)*100,...
    'o','filled', 'MarkerEdgeColor',[105 105 105]/255, 'LineWidth',line_width-0.5); hold on;
set(gca,'FontSize',tick_size);
colormap(a10, brewermap([],'*RdBu'));    
caxis([min1 max1]); 
c = colorbar

xlim([-128 -64]); ylim([22 52]); box on;
xticks = [-120, -110, -100, -90 -80 -70];
yticks = [25, 30, 35, 40, 45, 50];

xticklabels = arrayfun(@(x) sprintf('%d\\circ', x), xticks, 'UniformOutput', false);
yticklabels = arrayfun(@(y) sprintf('%d\\circ', y), yticks, 'UniformOutput', false);

set(gca, 'XTickLabel', xticklabels);
set(gca, 'YTickLabel', yticklabels);
set(gca, 'XTickLabel', {});
set(gca, 'YTickLabel', {});

% xlabel('Lon. (°)', 'FontSize', label_size); 
% ylabel('Cooler', 'FontSize', label_size, 'FontWeight','bold'); 
box on; 
title('(b3): Changes in Mean Severity (%)', 'FontSize', title_size);
% text(0.9, 0.15, '(a2): Changes in Total Duration (%)', 'Units', 'normalized', 'Fontsize', text_size )

% text(-120, 44, 'NW',  'Fontsize', text_size, 'FontWeight','bold')
% text(-117, 38, 'SW',  'Fontsize', text_size, 'FontWeight','bold')
% text(-95.5, 46, 'MW',  'Fontsize', text_size, 'FontWeight','bold')
% text(-104, 33, 'GP',  'Fontsize', text_size, 'FontWeight','bold')
% text(-90.4, 33.4, 'SE',  'Fontsize', text_size, 'FontWeight','bold')
% text(-76, 43.3, 'NE',  'Fontsize', text_size, 'FontWeight','bold')

plot([-109 -124.557], [42 42], 'k-', 'LineWidth', line_width);
plot([-109 -109], [31.3435 49], 'k-', 'LineWidth', line_width);
plot([-76 -109], [37 37], 'k-', 'LineWidth', line_width);
plot([-84.8011 -84.8011], [37 46.7578], 'k-', 'LineWidth', line_width);
plot([-94.4381 -94.4381], [29.5785 37], 'k-', 'LineWidth', line_width);


% -----------------------------------------------------------------------------
% 11. RCP8.5 hotter agri drought: total duration
a11 = subplot(4,4,11)
min1 = -80; max1 = 80;
index = 2; num_yr = 40;
plot(US(:,1), US(:,2),'.','MarkerSize',2,'Color',[169 169 169]/255); hold on; 
% a1 = subplot(6,4,1)

scatter(lon, lat, scatter_size, (meteo_85_h_f(:,index)*num_yr-meteo_hist(:,index)*num_yr)./(meteo_hist(:,index)*num_yr)*100,...
    'o','filled', 'MarkerEdgeColor',[105 105 105]/255, 'LineWidth',line_width-0.5); hold on;
set(gca,'FontSize',tick_size);
colormap(a11, brewermap([],'*RdBu'));    
caxis([min1 max1]); 
c = colorbar

xlim([-128 -64]); ylim([22 52]); box on;
xticks = [-120, -110, -100, -90 -80 -70];
yticks = [25, 30, 35, 40, 45, 50];

xticklabels = arrayfun(@(x) sprintf('%d\\circ', x), xticks, 'UniformOutput', false);
yticklabels = arrayfun(@(y) sprintf('%d\\circ', y), yticks, 'UniformOutput', false);

set(gca, 'XTickLabel', xticklabels);
set(gca, 'YTickLabel', yticklabels);
set(gca, 'XTickLabel', {});
set(gca, 'YTickLabel', {});

% xlabel('Lon. (°)', 'FontSize', label_size); 
% ylabel('Cooler', 'FontSize', label_size, 'FontWeight','bold'); 
box on; 
title('(c3): Changes in Total Duration (%)', 'FontSize', title_size);
% text(0.9, 0.15, '(a2): Changes in Total Duration (%)', 'Units', 'normalized', 'Fontsize', text_size )

% text(-120, 44, 'NW',  'Fontsize', text_size, 'FontWeight','bold')
% text(-117, 38, 'SW',  'Fontsize', text_size, 'FontWeight','bold')
% text(-95.5, 46, 'MW',  'Fontsize', text_size, 'FontWeight','bold')
% text(-104, 33, 'GP',  'Fontsize', text_size, 'FontWeight','bold')
% text(-90.4, 33.4, 'SE',  'Fontsize', text_size, 'FontWeight','bold')
% text(-76, 43.3, 'NE',  'Fontsize', text_size, 'FontWeight','bold')

plot([-109 -124.557], [42 42], 'k-', 'LineWidth', line_width);
plot([-109 -109], [31.3435 49], 'k-', 'LineWidth', line_width);
plot([-76 -109], [37 37], 'k-', 'LineWidth', line_width);
plot([-84.8011 -84.8011], [37 46.7578], 'k-', 'LineWidth', line_width);
plot([-94.4381 -94.4381], [29.5785 37], 'k-', 'LineWidth', line_width);



% -----------------------------------------------------------------------------
% 12. RCP8.5 hotter agri drought: mean severity
a12 = subplot(4,4,12)
min1 = -80; max1 = 80;
index = 5; num_yr = 40;
plot(US(:,1), US(:,2),'.','MarkerSize',2,'Color',[169 169 169]/255); hold on; 
% a1 = subplot(6,4,1)

scatter(lon, lat, scatter_size, (meteo_85_h_f(:,index)*num_yr-meteo_hist(:,index)*num_yr)./(meteo_hist(:,index)*num_yr)*100,...
    'o','filled', 'MarkerEdgeColor',[105 105 105]/255, 'LineWidth',line_width-0.5); hold on;
set(gca,'FontSize',tick_size);
colormap(a12, brewermap([],'*RdBu'));    
caxis([min1 max1]); 
c = colorbar

xlim([-128 -64]); ylim([22 52]); box on;
xticks = [-120, -110, -100, -90 -80 -70];
yticks = [25, 30, 35, 40, 45, 50];

xticklabels = arrayfun(@(x) sprintf('%d\\circ', x), xticks, 'UniformOutput', false);
yticklabels = arrayfun(@(y) sprintf('%d\\circ', y), yticks, 'UniformOutput', false);

set(gca, 'XTickLabel', xticklabels);
set(gca, 'YTickLabel', yticklabels);
set(gca, 'XTickLabel', {});
set(gca, 'YTickLabel', {});

% xlabel('Lon. (°)', 'FontSize', label_size); 
% ylabel('Cooler', 'FontSize', label_size, 'FontWeight','bold'); 
box on; 
title('(d3): Changes in Mean Severity (%)', 'FontSize', title_size);
% text(0.9, 0.15, '(a2): Changes in Total Duration (%)', 'Units', 'normalized', 'Fontsize', text_size )

% text(-120, 44, 'NW',  'Fontsize', text_size, 'FontWeight','bold')
% text(-117, 38, 'SW',  'Fontsize', text_size, 'FontWeight','bold')
% text(-95.5, 46, 'MW',  'Fontsize', text_size, 'FontWeight','bold')
% text(-104, 33, 'GP',  'Fontsize', text_size, 'FontWeight','bold')
% text(-90.4, 33.4, 'SE',  'Fontsize', text_size, 'FontWeight','bold')
% text(-76, 43.3, 'NE',  'Fontsize', text_size, 'FontWeight','bold')

plot([-109 -124.557], [42 42], 'k-', 'LineWidth', line_width);
plot([-109 -109], [31.3435 49], 'k-', 'LineWidth', line_width);
plot([-76 -109], [37 37], 'k-', 'LineWidth', line_width);
plot([-84.8011 -84.8011], [37 46.7578], 'k-', 'LineWidth', line_width);
plot([-94.4381 -94.4381], [29.5785 37], 'k-', 'LineWidth', line_width);






index1 = 19;       % meteo(7);  agri(13);  hydro(19)
index2 = 24;      % meteo(12); agri(18);  hydro(24)

data = load('./drought_chara_historical.txt'); lon = data(:,3); lat = data(:,2); meteo_hist = data(:,index1:index2);

data = load('./drought_chara_45_c_n.txt'); meteo_45_c_n = data(:,index1:index2);
% data = load('./drought_chara_45_c_f.txt'); meteo_45_c_f = data(:,index1:index2);
% data = load('./drought_chara_45_h_n.txt'); meteo_45_h_n = data(:,index1:index2);
% data = load('./drought_chara_45_h_f.txt'); meteo_45_h_f = data(:,index1:index2);
% 
% data = load('./drought_chara_85_c_n.txt'); meteo_85_c_n = data(:,index1:index2);
% data = load('./drought_chara_85_c_f.txt'); meteo_85_c_f = data(:,index1:index2);
% data = load('./drought_chara_85_h_n.txt'); meteo_85_h_n = data(:,index1:index2);
data = load('./drought_chara_85_h_f.txt'); meteo_85_h_f = data(:,index1:index2);




% -----------------------------------------------------------------------------
% 13. RCP4.5 cooler hydro drought: total duration
a13 = subplot(4,4,13)
min1 = -80; max1 = 80;
index = 2; num_yr = 40;
plot(US(:,1), US(:,2),'.','MarkerSize',2,'Color',[169 169 169]/255); hold on; 
% a1 = subplot(6,4,1)

scatter(lon, lat, scatter_size, (meteo_45_c_n(:,index)*num_yr-meteo_hist(:,index)*num_yr)./(meteo_hist(:,index)*num_yr)*100,...
    'o','filled', 'MarkerEdgeColor',[105 105 105]/255, 'LineWidth',line_width-0.5); hold on;
set(gca,'FontSize',tick_size);
colormap(a13, brewermap([],'*RdBu'));    
caxis([min1 max1]); 
c = colorbar

xlim([-128 -64]); ylim([22 52]); box on;
xticks = [-120, -110, -100, -90 -80 -70];
yticks = [25, 30, 35, 40, 45, 50];

xticklabels = arrayfun(@(x) sprintf('%d\\circ', x), xticks, 'UniformOutput', false);
yticklabels = arrayfun(@(y) sprintf('%d\\circ', y), yticks, 'UniformOutput', false);

set(gca, 'XTickLabel', xticklabels);
set(gca, 'YTickLabel', yticklabels);
% set(gca, 'XTickLabel', {});
% set(gca, 'YTickLabel', {});

% xlabel('Lon. (°)', 'FontSize', label_size); 
% ylabel('Cooler', 'FontSize', label_size, 'FontWeight','bold'); 
box on; 
title('(a4): Changes in Total Duration (%)', 'FontSize', title_size);
% text(0.9, 0.15, '(a2): Changes in Total Duration (%)', 'Units', 'normalized', 'Fontsize', text_size )

% text(-120, 44, 'NW',  'Fontsize', text_size, 'FontWeight','bold')
% text(-117, 38, 'SW',  'Fontsize', text_size, 'FontWeight','bold')
% text(-95.5, 46, 'MW',  'Fontsize', text_size, 'FontWeight','bold')
% text(-104, 33, 'GP',  'Fontsize', text_size, 'FontWeight','bold')
% text(-90.4, 33.4, 'SE',  'Fontsize', text_size, 'FontWeight','bold')
% text(-76, 43.3, 'NE',  'Fontsize', text_size, 'FontWeight','bold')

plot([-109 -124.557], [42 42], 'k-', 'LineWidth', line_width);
plot([-109 -109], [31.3435 49], 'k-', 'LineWidth', line_width);
plot([-76 -109], [37 37], 'k-', 'LineWidth', line_width);
plot([-84.8011 -84.8011], [37 46.7578], 'k-', 'LineWidth', line_width);
plot([-94.4381 -94.4381], [29.5785 37], 'k-', 'LineWidth', line_width);




% -----------------------------------------------------------------------------
% 14. RCP4.5 cooler hydro drought: mean severity
a14 = subplot(4,4,14)
min1 = -80; max1 = 80;
index = 5; num_yr = 40;
plot(US(:,1), US(:,2),'.','MarkerSize',2,'Color',[169 169 169]/255); hold on; 
% a1 = subplot(6,4,1)

scatter(lon, lat, scatter_size, (meteo_45_c_n(:,index)*num_yr-meteo_hist(:,index)*num_yr)./(meteo_hist(:,index)*num_yr)*100,...
    'o','filled', 'MarkerEdgeColor',[105 105 105]/255, 'LineWidth',line_width-0.5); hold on;
set(gca,'FontSize',tick_size);
colormap(a14, brewermap([],'*RdBu'));    
caxis([min1 max1]); 
c = colorbar

xlim([-128 -64]); ylim([22 52]); box on;
xticks = [-120, -110, -100, -90 -80 -70];
yticks = [25, 30, 35, 40, 45, 50];

xticklabels = arrayfun(@(x) sprintf('%d\\circ', x), xticks, 'UniformOutput', false);
yticklabels = arrayfun(@(y) sprintf('%d\\circ', y), yticks, 'UniformOutput', false);

set(gca, 'XTickLabel', xticklabels);
% set(gca, 'YTickLabel', yticklabels);
% set(gca, 'XTickLabel', {});
% set(gca, 'YTickLabel', {});
set(gca, 'YTickLabel', {});

% xlabel('Lon. (°)', 'FontSize', label_size); 
% ylabel('Cooler', 'FontSize', label_size, 'FontWeight','bold'); 
box on; 
title('(b4): Changes in Mean Severity (%)', 'FontSize', title_size);
% text(0.9, 0.15, '(a2): Changes in Total Duration (%)', 'Units', 'normalized', 'Fontsize', text_size )

% text(-120, 44, 'NW',  'Fontsize', text_size, 'FontWeight','bold')
% text(-117, 38, 'SW',  'Fontsize', text_size, 'FontWeight','bold')
% text(-95.5, 46, 'MW',  'Fontsize', text_size, 'FontWeight','bold')
% text(-104, 33, 'GP',  'Fontsize', text_size, 'FontWeight','bold')
% text(-90.4, 33.4, 'SE',  'Fontsize', text_size, 'FontWeight','bold')
% text(-76, 43.3, 'NE',  'Fontsize', text_size, 'FontWeight','bold')

plot([-109 -124.557], [42 42], 'k-', 'LineWidth', line_width);
plot([-109 -109], [31.3435 49], 'k-', 'LineWidth', line_width);
plot([-76 -109], [37 37], 'k-', 'LineWidth', line_width);
plot([-84.8011 -84.8011], [37 46.7578], 'k-', 'LineWidth', line_width);
plot([-94.4381 -94.4381], [29.5785 37], 'k-', 'LineWidth', line_width);


% -----------------------------------------------------------------------------
% 15. RCP8.5 hotter hydro drought: total duration
a15 = subplot(4,4,15)
min1 = -80; max1 = 80;
index = 2; num_yr = 40;
plot(US(:,1), US(:,2),'.','MarkerSize',2,'Color',[169 169 169]/255); hold on; 
% a1 = subplot(6,4,1)

scatter(lon, lat, scatter_size, (meteo_85_h_f(:,index)*num_yr-meteo_hist(:,index)*num_yr)./(meteo_hist(:,index)*num_yr)*100,...
    'o','filled', 'MarkerEdgeColor',[105 105 105]/255, 'LineWidth',line_width-0.5); hold on;
set(gca,'FontSize',tick_size);
colormap(a15, brewermap([],'*RdBu'));    
caxis([min1 max1]); 
c = colorbar

xlim([-128 -64]); ylim([22 52]); box on;
xticks = [-120, -110, -100, -90 -80 -70];
yticks = [25, 30, 35, 40, 45, 50];

xticklabels = arrayfun(@(x) sprintf('%d\\circ', x), xticks, 'UniformOutput', false);
yticklabels = arrayfun(@(y) sprintf('%d\\circ', y), yticks, 'UniformOutput', false);

set(gca, 'XTickLabel', xticklabels);
% set(gca, 'YTickLabel', yticklabels);
% set(gca, 'XTickLabel', {});
% set(gca, 'YTickLabel', {});
set(gca, 'YTickLabel', {});


% xlabel('Lon. (°)', 'FontSize', label_size); 
% ylabel('Cooler', 'FontSize', label_size, 'FontWeight','bold'); 
box on; 
title('(c4): Changes in Total Duration (%)', 'FontSize', title_size);
% text(0.9, 0.15, '(a2): Changes in Total Duration (%)', 'Units', 'normalized', 'Fontsize', text_size )

% text(-120, 44, 'NW',  'Fontsize', text_size, 'FontWeight','bold')
% text(-117, 38, 'SW',  'Fontsize', text_size, 'FontWeight','bold')
% text(-95.5, 46, 'MW',  'Fontsize', text_size, 'FontWeight','bold')
% text(-104, 33, 'GP',  'Fontsize', text_size, 'FontWeight','bold')
% text(-90.4, 33.4, 'SE',  'Fontsize', text_size, 'FontWeight','bold')
% text(-76, 43.3, 'NE',  'Fontsize', text_size, 'FontWeight','bold')

plot([-109 -124.557], [42 42], 'k-', 'LineWidth', line_width);
plot([-109 -109], [31.3435 49], 'k-', 'LineWidth', line_width);
plot([-76 -109], [37 37], 'k-', 'LineWidth', line_width);
plot([-84.8011 -84.8011], [37 46.7578], 'k-', 'LineWidth', line_width);
plot([-94.4381 -94.4381], [29.5785 37], 'k-', 'LineWidth', line_width);



% -----------------------------------------------------------------------------
% 16. RCP8.5 hotter hydro drought: mean severity
a16 = subplot(4,4,16)
min1 = -80; max1 = 80;
index = 5; num_yr = 40;
plot(US(:,1), US(:,2),'.','MarkerSize',2,'Color',[169 169 169]/255); hold on; 
% a1 = subplot(6,4,1)

scatter(lon, lat, scatter_size, (meteo_85_h_f(:,index)*num_yr-meteo_hist(:,index)*num_yr)./(meteo_hist(:,index)*num_yr)*100,...
    'o','filled', 'MarkerEdgeColor',[105 105 105]/255, 'LineWidth',line_width-0.5); hold on;
set(gca,'FontSize',tick_size);
colormap(a16, brewermap([],'*RdBu'));    
caxis([min1 max1]); 
c = colorbar

xlim([-128 -64]); ylim([22 52]); box on;
xticks = [-120, -110, -100, -90 -80 -70];
yticks = [25, 30, 35, 40, 45, 50];

xticklabels = arrayfun(@(x) sprintf('%d\\circ', x), xticks, 'UniformOutput', false);
yticklabels = arrayfun(@(y) sprintf('%d\\circ', y), yticks, 'UniformOutput', false);

set(gca, 'XTickLabel', xticklabels);
% set(gca, 'YTickLabel', yticklabels);
% set(gca, 'XTickLabel', {});
set(gca, 'YTickLabel', {});



% xlabel('Lon. (°)', 'FontSize', label_size); 
% ylabel('Cooler', 'FontSize', label_size, 'FontWeight','bold'); 
box on; 
title('(d4): Changes in Mean Severity (%)', 'FontSize', title_size);
% text(0.9, 0.15, '(a2): Changes in Total Duration (%)', 'Units', 'normalized', 'Fontsize', text_size )

% text(-120, 44, 'NW',  'Fontsize', text_size, 'FontWeight','bold')
% text(-117, 38, 'SW',  'Fontsize', text_size, 'FontWeight','bold')
% text(-95.5, 46, 'MW',  'Fontsize', text_size, 'FontWeight','bold')
% text(-104, 33, 'GP',  'Fontsize', text_size, 'FontWeight','bold')
% text(-90.4, 33.4, 'SE',  'Fontsize', text_size, 'FontWeight','bold')
% text(-76, 43.3, 'NE',  'Fontsize', text_size, 'FontWeight','bold')

plot([-109 -124.557], [42 42], 'k-', 'LineWidth', line_width);
plot([-109 -109], [31.3435 49], 'k-', 'LineWidth', line_width);
plot([-76 -109], [37 37], 'k-', 'LineWidth', line_width);
plot([-84.8011 -84.8011], [37 46.7578], 'k-', 'LineWidth', line_width);
plot([-94.4381 -94.4381], [29.5785 37], 'k-', 'LineWidth', line_width);
%% output the plot

fig = gcf;
fig.PaperUnits = 'inches';

% fig.PaperPosition = [0 0 17.7 8];
fig.PaperPosition = [0 0 20 10];
print('ScreenSizeFigure', '-dpng', '-r300')





