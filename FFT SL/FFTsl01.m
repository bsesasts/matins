%--fft频谱泄漏特殊事例，恰好采样到零点sl：Spectrum leakage--%
clc;clear all;close all;
fs = 32;N = 32;
t = 0:1/fs:1-1/fs;
x = sin(2*pi*t);
% figure;
% plot(x);
y = fftshift(fft(x,N));
fx1 = -fs/2:fs/length(y):fs/2-fs/length(y);
figure;
subplot(121);hold on;grid on;
stem(fx1,abs(y));
axis([-fs/2,fs/2,-inf,inf]);
xlabel('f');ylabel('A');title('特殊的频谱泄漏');

t2 = 0:1/fs:1+0.5;
x2 = sin(2*pi*t2);
y2 = fftshift(fft(x2,2*N));

fx2 = -fs/2:fs/length(y2):fs/2-fs/length(y2);
subplot(122);hold on;grid on;
stem(fx1,abs(y)./max(abs(y)));
stem(fx2,abs(y2)./max(abs(y2)),'.');
legend('恰好','补零');
axis([-fs/2,fs/2,-inf,inf]);
xlabel('f');ylabel('A');title('特殊的频谱泄漏-补零');
