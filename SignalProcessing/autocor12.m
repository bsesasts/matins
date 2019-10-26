clc;clear;close all;
N=200;x = 1:N;
y11 = cumx2(x);
yxf = fft(x,2*N);
yx2 = 1/N*abs(yxf).^2;
yxi = ifft(yx2);
figure;hold on;grid on;
stem(y11(2:2*N+1),'.');
stem((yxi),'.');
legend('直接{r}(t)','间接{r}_0(t)','interpreter','tex');
function cum2 = cumx2(seq)
[M,N] = size(seq);
for tau1 = -N:N
    base = zeros(M,3*N);
    basea =  base;baseb =base;    % 扩展截取区
    basea(:,(N+1):(2*N)) = basea(:,(N+1):(2*N)) + seq;
    baseb(:,(N+1+tau1):(2*N+tau1)) = baseb(:,(N+1+tau1):(2*N+tau1)) + seq;
    seqa = basea(:,(N +1):(2*N));
    seqb = baseb(:,(N +1):(2*N));
    cum2(tau1+N+1) = mean(seqa.*seqb,'all');
end
end