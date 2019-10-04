%% 用矩阵处理线性变化
% Linear transformation use matrix
%% 旋转变换
H = [0 1 ; -1 0]';
X = [linspace(0,1,20);linspace(0,1,20)];
Y = H*X;
figure;hold on;grid on;
plot(X(1,:),X(2,:));
plot(Y(1,:),Y(2,:));
legend('before(1,1)','after(-1 1)');
text(-0.6,0.5,'H=');
text(-0.5,0.5,num2str(H));
k = 1;
axis([-k k -k k]);
%% shear
H = [1 0 ; 1 1]';
X = [linspace(0,1,20);linspace(0,1,20)];
Y = H*X;
figure;hold on;grid on;
plot(X(1,:),X(2,:));
plot(Y(1,:),Y(2,:));
legend('before(1,1)','after');
text(-0.7,0.5,'H=');
text(-0.5,0.5,num2str(H));
k = 2;
axis([-k k -k k]);
%% 任意
H = [1 2 ; 3 1]';
X = [linspace(0,0.3,20);linspace(0,0.4,20)];
Y = H*X;
figure;hold on;grid on;
plot(X(1,:),X(2,:));
plot(Y(1,:),Y(2,:));
legend('before(0.3,0.4)','after');
text(-0.65,0.5,'H=');
text(-0.5,0.5,num2str(H));
k = 2;
axis([-k k -k k]);
%% 变换后的基线性相关的情况
H = [2 1 ; -2 -1]';
X = [linspace(0,1,20);linspace(0,1.5,20)];
Y = H*X;
figure;hold on;grid on;
plot(X(1,:),X(2,:));
plot(Y(1,:),Y(2,:));
legend('before(1,1)','after');
text(-0.7,0.5,'H=');
text(-0.5,0.5,num2str(H));
k = 2;
axis([-k k -k k]);