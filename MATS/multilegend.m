%% ��legend���ٴ�����ʹ���ַ����ָ�
clc;clear all;close all;
t = 0:0.001:0.1;
f = [10.1,13.1,19.1];
y = sin(2*pi.*f.'.*t);
figure;
plot(t,y);
legend(regexp(num2str(f), '\s+', 'split'));   % �ָ��־Ϊһ�����߶���ո�num2str����ַ����������ÿո�����ģ�Ȼ�����зֳɵ����ģ��Ϳ�������legend����
title('multilegend');
% ע��һ���е�������legend���������������ڴ����Ķ���ʾ��figure��Ч�������ܺ�
