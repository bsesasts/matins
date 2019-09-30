%% 双坐标轴的使用，可选的一种方法，适用简单图形
clc;clear all;close all;
t1 = 0:0.1:10;
y1 = cos(2*pi*0.22*t1);
t2 = 0:0.1:15;
y2 = sin(2*pi*0.23*t2);
hl1 = line(t1,y1,'Color','r');
ax1 = gca;
set(ax1,'XColor','b','YColor','b')
ax2 = axes('Position',get(ax1,'Position'),...
'XAxisLocation','top',...
'YAxisLocation','right',...
'Color','none',...
'XColor','k','YColor','k');
hl2 = line(t2,y2,'Color','k','Parent',ax2);
grid on;
