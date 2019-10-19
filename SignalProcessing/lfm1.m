%% 线调频信号的时域压缩，频域压缩
% 时频信号图，压缩比，时宽参数的计算
clc;clear all;close all;

B = 30*10^7;
T = 4*10^-7;
fs = B*4;
t = -T/2:1/fs:T/2;
f = 200;%暂时不加载频
mu = B/T;   % 调频斜率
x = exp(1i*2*pi*(f*t+1/2*mu*t.^2));
xf = fftshift(fft(x));  % 频谱
xlf = f + mu*t;
tau = 0.1*T;
xr = exp(1i*2*pi*(f*(t-tau)+1/2*mu*(t-tau).^2));% 接收信号，延时
xtf = conv(xr,fliplr(conj(x)),'same');

figure;nfi = 3;
subplot(nfi,2,1);plot(t,real(x));ylabel('发射信号');
subplot(nfi,2,2);plot(t,abs(xf));ylabel('发射信号频谱');
subplot(nfi,2,3);plot(t,xlf);ylabel('发射信号时频');
subplot(nfi,2,4);plot(t,real(xr));ylabel('接收信号');
subplot(nfi,2,5);plot(t,real(xtf));ylabel('脉冲压缩');
subplot(nfi,2,6);hold on;grid on;ylabel('脉冲压缩参量');
xtfdb = db(abs((xtf)/max(xtf)));
plot(t,xtfdb);
plot(0.05*T:0.005*T:0.15*T,-4+0*(0.05*T:0.005*T:0.15*T),'.');
axis([0.05*T 0.15*T -10 0]);
xdd = find(xtfdb >= -4);
tauc = (xdd(length(xdd)) - xdd(1))/length(t)*T;
CR = B*T;
tauct = T/CR;
text(0.05*T,-3,['theory   τ=',num2str(tauct)]);
text(0.05*T,-5,['calculateτ=',num2str(tauc)]);
