%% load all data

clear all; clc;

US = load('./us_coor.txt');
SL = load('./sl_coor.txt');

label_size = 10; line_width = 1;   box_width = 0.5;
title_size = 10; tick_size = 10; text_size = 10;  
scatter_size = 10;  legend_size = 10;  colorbar_size= 10;

meteo_hist = load('meteo_hist.txt');
meteo_45_c_n = load('meteo_45_c_n.txt');
meteo_85_h_f = load('meteo_85_h_f.txt');



%% plot one spatial plot only (meteo drought)
lat = meteo_hist(:,2);
lon = meteo_hist(:,3);

% 1. RCP4.5 cooler meteo drought: total duration

a1 = subplot(2,4,1)
min1 = -30; max1 = 30;
index = 8; num_yr = 40;
plot(US(:,1), US(:,2),'.','MarkerSize',2,'Color',[169 169 169]/255); hold on; 
% a1 = subplot(6,4,1)

scatter(lon, lat, scatter_size, (meteo_45_c_n(:,index)*num_yr-meteo_hist(:,index)*num_yr)./(meteo_hist(:,index)*num_yr)*100,...
    'o','filled', 'MarkerEdgeColor',[105 105 105]/255, 'LineWidth',line_width-0.5); hold on;
set(gca,'FontSize',tick_size);
colormap(a1, brewermap([],'*RdBu'));    
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
ylabel('MD-SPI', 'FontSize', label_size, 'FontWeight','bold'); 
box on; 
title('(a1): Changes in Total Duration (%)', 'FontSize', title_size);
text(0.1, 0.1, 'SSP245COLD-NEAR', 'Units', 'normalized', 'Fontsize', text_size )

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



a2 = subplot(2,4,2)
min1 = -30; max1 = 30;
index = 11; num_yr = 40;
plot(US(:,1), US(:,2),'.','MarkerSize',2,'Color',[169 169 169]/255); hold on; 
% a1 = subplot(6,4,1)

scatter(lon, lat, scatter_size, (meteo_45_c_n(:,index)-meteo_hist(:,index))./(meteo_hist(:,index))*100,...
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
% set(gca, 'YTickLabel', {});

% xlabel('Lon. (°)', 'FontSize', label_size); 
% ylabel('MD-SPI', 'FontSize', label_size, 'FontWeight','bold'); 
box on; 
title('(a2): Changes in Mean Severity (%)', 'FontSize', title_size);
text(0.1, 0.1, 'SSP245COLD-NEAR', 'Units', 'normalized', 'Fontsize', text_size )

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




a3 = subplot(2,4,3)
min1 = -100; max1 = 100;
index = 8; num_yr = 40;
plot(US(:,1), US(:,2),'.','MarkerSize',2,'Color',[169 169 169]/255); hold on; 
% a1 = subplot(6,4,1)

scatter(lon, lat, scatter_size, (meteo_85_h_f(:,index)*num_yr-meteo_hist(:,index)*num_yr)./(meteo_hist(:,index)*num_yr)*100,...
    'o','filled', 'MarkerEdgeColor',[105 105 105]/255, 'LineWidth',line_width-0.5); hold on;
set(gca,'FontSize',tick_size);
colormap(a3, brewermap([],'*RdBu'));    
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
% ylabel('MD-SPI', 'FontSize', label_size, 'FontWeight','bold'); 
box on; 
title('(a3): Changes in Total Duration (%)', 'FontSize', title_size);
text(0.1, 0.1, 'SSP585HOT-FAR', 'Units', 'normalized', 'Fontsize', text_size )

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





a4 = subplot(2,4,4)
min1 = -200; max1 = 200;
index = 11; num_yr = 40;
plot(US(:,1), US(:,2),'.','MarkerSize',2,'Color',[169 169 169]/255); hold on; 
% a1 = subplot(6,4,1)

scatter(lon, lat, scatter_size, (meteo_85_h_f(:,index)-meteo_hist(:,index))./(meteo_hist(:,index))*100,...
    'o','filled', 'MarkerEdgeColor',[105 105 105]/255, 'LineWidth',line_width-0.5); hold on;
set(gca,'FontSize',tick_size);
colormap(a4, brewermap([],'*RdBu'));    
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
% ylabel('MD-SPI', 'FontSize', label_size, 'FontWeight','bold'); 
box on; 
title('(a4): Changes in Mean Severity (%)', 'FontSize', title_size);
text(0.1, 0.1, 'SSP585HOT-FAR', 'Units', 'normalized', 'Fontsize', text_size )

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




a5 = subplot(2,4,5)
min1 = -30; max1 = 30;
index = 14; num_yr = 40;
plot(US(:,1), US(:,2),'.','MarkerSize',2,'Color',[169 169 169]/255); hold on; 
% a1 = subplot(6,4,1)

scatter(lon, lat, scatter_size, (meteo_45_c_n(:,index)*num_yr-meteo_hist(:,index)*num_yr)./(meteo_hist(:,index)*num_yr)*100,...
    'o','filled', 'MarkerEdgeColor',[105 105 105]/255, 'LineWidth',line_width-0.5); hold on;
set(gca,'FontSize',tick_size);
colormap(a5, brewermap([],'*RdBu'));    
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
ylabel('MD-SPEI', 'FontSize', label_size, 'FontWeight','bold'); 
box on; 
title('(b1): Changes in Total Duration (%)', 'FontSize', title_size);
text(0.1, 0.1, 'SSP245COLD-NEAR', 'Units', 'normalized', 'Fontsize', text_size )

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



a6 = subplot(2,4,6)
min1 = -30; max1 = 30;
index = 17; num_yr = 40;
plot(US(:,1), US(:,2),'.','MarkerSize',2,'Color',[169 169 169]/255); hold on; 
% a1 = subplot(6,4,1)

scatter(lon, lat, scatter_size, (meteo_45_c_n(:,index)-meteo_hist(:,index))./(meteo_hist(:,index))*100,...
    'o','filled', 'MarkerEdgeColor',[105 105 105]/255, 'LineWidth',line_width-0.5); hold on;
set(gca,'FontSize',tick_size);
colormap(a6, brewermap([],'*RdBu'));    
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
% ylabel('MD-SPI', 'FontSize', label_size, 'FontWeight','bold'); 
box on; 
title('(b2): Changes in Mean Severity (%)', 'FontSize', title_size);
text(0.1, 0.1, 'SSP245COLD-NEAR', 'Units', 'normalized', 'Fontsize', text_size )

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




a7 = subplot(2,4,7)
min1 = -100; max1 = 100;
index = 14; num_yr = 40;
plot(US(:,1), US(:,2),'.','MarkerSize',2,'Color',[169 169 169]/255); hold on; 
% a1 = subplot(6,4,1)

scatter(lon, lat, scatter_size, (meteo_85_h_f(:,index)*num_yr-meteo_hist(:,index)*num_yr)./(meteo_hist(:,index)*num_yr)*100,...
    'o','filled', 'MarkerEdgeColor',[105 105 105]/255, 'LineWidth',line_width-0.5); hold on;
set(gca,'FontSize',tick_size);
colormap(a7, brewermap([],'*RdBu'));    
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
% ylabel('MD-SPI', 'FontSize', label_size, 'FontWeight','bold'); 
box on; 
title('(b3): Changes in Total Duration (%)', 'FontSize', title_size);
text(0.1, 0.1, 'SSP585HOT-FAR', 'Units', 'normalized', 'Fontsize', text_size )

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





a8 = subplot(2,4,8)
min1 = -200; max1 = 200;
index = 17; num_yr = 40;
plot(US(:,1), US(:,2),'.','MarkerSize',2,'Color',[169 169 169]/255); hold on; 
% a1 = subplot(6,4,1)

scatter(lon, lat, scatter_size, (meteo_85_h_f(:,index)-meteo_hist(:,index))./(meteo_hist(:,index))*100,...
    'o','filled', 'MarkerEdgeColor',[105 105 105]/255, 'LineWidth',line_width-0.5); hold on;
set(gca,'FontSize',tick_size);
colormap(a8, brewermap([],'*RdBu'));    
caxis([min1 max1]); 
c = colorbar

% min1 = -10; max1 = 90;
% colormap(a8, brewermap([],'YlOrBr'));    
% caxis([min1 max1]); 
% c = colorbar

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
% ylabel('MD-SPI', 'FontSize', label_size, 'FontWeight','bold'); 
box on; 
title('(b4): Changes in Mean Severity (%)', 'FontSize', title_size);
text(0.1, 0.1, 'SSP585HOT-FAR', 'Units', 'normalized', 'Fontsize', text_size )

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
fig.PaperPosition = [0 0 20 5];
print('ScreenSizeFigure', '-dpng', '-r300')





