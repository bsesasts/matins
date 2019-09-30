clear;
clc;
for i=1:100
theta=meshgrid(eps:pi/180:pi); 
fai=meshgrid(eps:2*pi/180:2*pi)'; 
lamda = 1000;%²¨³¤
K = 2.*pi./lamda;
L = lamda.*(i.*0.01);%±Û³¤
f2 = abs((cos(K.*L.*cos(theta))-cos(K.*L)))./abs(sin(theta)+eps);
[x,y,z]=sph2cart(fai,pi/2-theta,f2); 
    mesh(x,y,z);  
    pause(0.2);
    m(i)=getframe
end
movie(m,1,1);