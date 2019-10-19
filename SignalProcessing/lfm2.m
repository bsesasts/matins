%% stretch�źŴ���
clc;clear all;close all;
B = 30*10^7;
T = 4*10^-7;
fs = B*4;
t = -T/2:1/fs:T/2;
f = 200;%��ʱ������Ƶ
mu = B/T;   % ��Ƶб��
x = exp(1i*2*pi*(f*t+1/2*mu*t.^2));
% % %% stretch����
tau1 = -0.1*T;tau2 = 0.1*T;
taulist = [-0.3*T,-0.1*T,0.1*T,0.35*T];
xrs = zeros(1,length(x));
for i = 1:length(taulist)
    xrs = xrs + exp(1i*2*pi*(f*(t-taulist(i))+1/2*mu*(t-taulist(i)).^2));
end

xmix1 = x.*conj(xrs);
% xmix1l = filter(hd,xmix1);
xmix1f = fftshift(fft(xmix1));

figure;nfi1=1;
subplot(nfi1,3,1);hold on;grid on;title('�����ź�&�ز��ź�');
plot(t,real(x));
plot(t,real(xrs));
subplot(nfi1,3,2);hold on;grid on;title('�����ź�&�ز��ź�ʱƵͼ');
plot(t,mu*t);
plot(t,mu*(t-taulist'));
subplot(nfi1,3,3);hold on;grid on;title('stretch������');
plot(t,abs(xmix1f));




