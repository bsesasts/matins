%% �ߵ�Ƶ�źŵ�ʱ��ѹ����Ƶ��ѹ��
% ʱƵ�ź�ͼ��ѹ���ȣ�ʱ������ļ���
clc;clear all;close all;

B = 30*10^7;
T = 4*10^-7;
fs = B*4;
t = -T/2:1/fs:T/2;
f = 200;%��ʱ������Ƶ
mu = B/T;   % ��Ƶб��
x = exp(1i*2*pi*(f*t+1/2*mu*t.^2));
xf = fftshift(fft(x));  % Ƶ��
xlf = f + mu*t;
tau = 0.1*T;
xr = exp(1i*2*pi*(f*(t-tau)+1/2*mu*(t-tau).^2));% �����źţ���ʱ
xtf = conv(xr,fliplr(conj(x)),'same');

figure;nfi = 3;
subplot(nfi,2,1);plot(t,real(x));ylabel('�����ź�');
subplot(nfi,2,2);plot(t,abs(xf));ylabel('�����ź�Ƶ��');
subplot(nfi,2,3);plot(t,xlf);ylabel('�����ź�ʱƵ');
subplot(nfi,2,4);plot(t,real(xr));ylabel('�����ź�');
subplot(nfi,2,5);plot(t,real(xtf));ylabel('����ѹ��');
subplot(nfi,2,6);hold on;grid on;ylabel('����ѹ������');
xtfdb = db(abs((xtf)/max(xtf)));
plot(t,xtfdb);
plot(0.05*T:0.005*T:0.15*T,-4+0*(0.05*T:0.005*T:0.15*T),'.');
axis([0.05*T 0.15*T -10 0]);
xdd = find(xtfdb >= -4);
tauc = (xdd(length(xdd)) - xdd(1))/length(t)*T;
CR = B*T;
tauct = T/CR;
text(0.05*T,-3,['theory   ��=',num2str(tauct)]);
text(0.05*T,-5,['calculate��=',num2str(tauc)]);
