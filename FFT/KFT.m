% clc;clear all;close all;
function [kft] = KFT( signal,Nii)
%% 确保数据长度，FFT点数为2的幂次
if (Nii-2^floor(log2(Nii)))~=0
    Nii = 2^((floor(log2(Nii)))+1);
end
if length(signal)<Nii
    signal = [signal zeros(1,Nii-length(signal))];
end
%% 输入倒序调整
M = log2(Nii);
va = dec2bin(Nii);
vx = dec2bin(0:Nii-1);
vr = fliplr(vx);
vd = bin2dec(vr);
for i = 1:Nii
    sto(i) = signal(vd(i)+1); %#ok<AGROW>
end
%% 蝶形运算
for m = 1:M
    for l = 0:(Nii/(2^m)-1)
        for k = 0:(2^(m-1)-1)
            v1 = l*2^m+k+1;
            v2 = l*2^m+k+2^(m-1)+1;
            p = 2^(M-m)* (l*2^m+k);
            W = exp(-1*j*2*pi*p/Nii);
            if m ==1
                X(m,v1) = sto(v1) + W*sto(v2);
                X(m,v2) =sto(v1) - W*sto(v2);
            else
                X(m,v1) = X(m-1,v1) + W*X(m-1,v2);
                X(m,v2) = X(m-1,v1) - W*X(m-1,v2);
            end
        end
    end
end
kft = X(M,:);
end