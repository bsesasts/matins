%% 多legend快速创建，使用字符串分割
clc;clear all;close all;
t = 0:0.001:0.1;
f = [10.1,13.1,19.1];
y = sin(2*pi.*f.'.*t);
figure;
plot(t,y);
legend(regexp(num2str(f), '\s+', 'split'));   % 分割标志为一个或者多个空格，num2str后的字符串本就是用空格隔开的，然后再切分成单个的，就可以用在legend上了
title('multilegend');
% 注：一般中等数量的legend可这样创建，过于大量的都显示在figure上效果并不很好
