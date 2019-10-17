function [c1,c2,c3] = ph(dot8)
% Parallel hexahedron
s1 = d2f(dot8(1:4,:));
s2 = d2f(dot8(5:8,:));
c1 = [s1(1,:) ;(s2(1,:))];
c2 = [s1(2,:) ;(s2(2,:))];
c3 = [s1(3,:) ;(s2(3,:))];
end
function surface = d2f(face4)
x1=[face4(1,1),face4(2,1),face4(3,1),face4(4,1),face4(1,1)];
y1=[face4(1,2),face4(2,2),face4(3,2),face4(4,2),face4(1,2)];
z1=[face4(1,3),face4(2,3),face4(3,3),face4(4,3),face4(1,3)];
surface = [x1;y1;z1];
end

% clear all
% 
% d1=[1,0,0];d2=[0,1,0];d3=[-1,0,0];d4=[0,-1,0];
% 
% d5=[2,0,3];d6=[1,1,3];d7=[0,0,3];d8=[1,-1,3];
% 
% % 根据xy的坐标生成底面
% x1=[d1(1),d2(1),d3(1),d4(1),d1(1)];
% y1=[d1(2),d2(2),d3(2),d4(2),d1(2)];
% z1=[d1(3),d2(3),d3(3),d4(3),d1(3)];
% 
% % 根据xy的坐标生成顶面
% x2=[d5(1),d6(1),d7(1),d8(1),d5(1)];
% y2=[d5(2),d6(2),d7(2),d8(2),d5(2)];
% z2=[d5(3),d6(3),d7(3),d8(3),d5(3)];
% 
% x=[x1;x2];y=[y1;y2];z=[z1;z2];
% 
% 
% 
% figure(1)
% mesh(x,y,z)
% colormap(gray(1))
% hidden off
% axis equal
% axis on
% grid on