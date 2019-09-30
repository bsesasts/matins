clc;clear all;close all;
fs = 64;N = 64;
t = 0:1/fs:1-1/fs;
f = 11.2;
x = sin(2*pi*f*t);
tic
y = KFT(x,256);
t1 = toc
tic
y1 = fft(x,256);
t2 = toc
figure;hold on;grid on;
plot(abs(fftshift(y)));
plot(abs(fftshift(y1)),'.');
legend('KFT','FFT');
axis([1,256,-inf,inf]);
text(10,12,['KFT time:',num2str(t1)]);
text(10,10,['FFT time:',num2str(t2)]);
title('ÊÖÐ´FFT³õ²½Êµ¼ù');