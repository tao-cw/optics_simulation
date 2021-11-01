% 平凸透镜光线追迹
clear;clc;
clear all;
n=1.5062;%1064nm 波长折射率，k9 玻璃
d=3; % 透镜中心厚度
R=100;% 透镜凸面曲率半径
Dr=sqrt(R^2-(R-d)^2);% 透镜尺寸(最大半径)
mh=30;
if Dr>10
	hmax=10;
else
	hmax=Dr;
end
h0=linspace(-hmax,hmax,mh);
mz=1000;
z0=20;%初始光线与透镜平面的距离
y=zeros(size(z0));
theta1=asin(hmax/R);
theta2=asin(n*hmax/R);
theta=theta2-theta1;
f=hmax/tan(theta); %透镜的近似焦距
z=linspace(0,f+z0+f/3,mz);
for gh=1:mh
	theta1=asin(h0(gh)/R);
	theta2=asin(n*h0(gh)/R);
	theta=theta2-theta1;
for gz=1:mz
	L=sqrt(R^2-h0(gh)^2)-(R-d);
if z(gz)<=L+z0
	y(gz)=h0(gh);
else
	y(gz)=y(gz-1)-(z(gz)-z(gz-1))*tan(theta);
end
end
plot(z,y,'k');%绘图
hold on;
end
title(['透镜焦距应该为：',num2str(f),' mm'])
