% ϣ�����ض��źŵĴ��������� 
clc;clear all;close all;
t = 0:0.001:2;
x = sin(2*pi*t);
y = hilbert(x);
figure;hold on;grid on;
plot(t,x);
plot(t,imag(y),'.');
legend('signal','hilbert(signal)');
title('�źż���ϣ�����ر任');
