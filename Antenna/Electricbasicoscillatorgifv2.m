clc;clear all;close all;
for i=1:20
sita=meshgrid(eps:pi/180:pi); 
fai=meshgrid(eps:2*pi/180:2*pi)'; 
lamda = 1000;%波长
K = 2.*pi./lamda;
L = lamda./(i);%臂长
f2 = abs((cos(K.*L.*cos(sita))-cos(K.*L)))./abs(sin(sita)+eps);
[x,y,z]=sph2cart(fai,pi/2-sita,f2); 
%subplot(1,1,1),
mesh(x,y,z);  
  m(:,i)=getframe;
end
movie(m,1,10);
%axis([-1 1 -1 1 -1 1]);title('电基本振子空间立体方向图');