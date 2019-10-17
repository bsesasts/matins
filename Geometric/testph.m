clc;close all;clear all;
d = [1,0,0;0,1,0;-1,0,0;0,-1,0;1,0,1;0,1,1;-1,0,1;0,-1,1];
[x,y,z] = ph(d);
figure(1);
mesh(x,y,z);
colormap(gray(1));hidden off;axis equal;axis on;grid on;