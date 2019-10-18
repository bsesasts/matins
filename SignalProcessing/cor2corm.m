%% corm = cor2corm(cor,x)
% 输入相关函数，输出相关函数矩阵
% cor为相关函数，x为可选长度组成相关矩阵
% Correlation matrix
function corm = cor2corm(cor,x)
if nargin==2
    cn = x;
else
    cn = (length(cor)+1)/2;
end
corm = zeros(cn,cn);
for m = 1:cn
    for n = 1:cn
        corm(m,n) = cor(max(m,n)-min(m,n)+1);
    end
end
end