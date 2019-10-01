%% ÉýÓàÏÒ¹ö½µÏµÍ³
clc;clear all;close all;
Ts=1;
N_sample=21;
dt=Ts/N_sample;
df=1.0/(100.0*Ts);
t=-10*Ts:dt:10*Ts;
f=-2/Ts:df:2/Ts;
alpha=[0,0.2,0.4,0.6,0.8,1];
for	n=1:length(alpha)
    for	k=1:length(f)
        if	abs(f(k))>0.5*(1+alpha(n))/Ts
            Xf(n,k)=0;
        elseif abs(f(k))<0.5*(1-alpha(n))/Ts
            Xf(n,k)=Ts;
        else
%             Xf(n,k)=0.5*Ts*(1+cos(pi*Ts/(alpha(n)+eps)*(abs(f(k))-0.5*(1-alpha(n))/Ts))); %Èý½ÇºÍ²î¹«Ê½
            Xf(n,k) = Ts*[cos(pi*Ts/(2.*alpha(n)+eps)*(abs(f(k))-  (1-alpha(n))/(2*Ts) )   )]^2;
        end
    end
    xt(n,:)=sinc(pi*t/Ts).*(cos(alpha(n)*pi*t/Ts))./(1-4*alpha(n)^2*t.^2/Ts^2+eps);
end
figure(1);
subplot(211);hold on;grid on;
plot(f,Xf);
axis([-1 1 0 1.2]);
xlabel('f/Ts');
ylabel('ÉýÓàÏÒ¹ö½µÆµÆ×');
legend(regexp(num2str(alpha), '\s+', 'split'));
subplot(212);hold on;grid on;
plot(t,xt);
axis([-10 10 -0.5 1.1]);
xlabel('t');ylabel('ÉýÓàÏÒ¹ö½µ²¨ÐÎ');
legend(regexp(num2str(alpha), '\s+', 'split'));