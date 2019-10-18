%% corm = cor2corm(cor,x)
% ������غ����������غ�������
% corΪ��غ�����xΪ��ѡ���������ؾ���
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