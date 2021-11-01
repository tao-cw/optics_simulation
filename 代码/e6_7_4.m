clc; 
clear all;
close all;
I=imread('ban.jpg');
figure(1)
subplot(1,3,1)
imshow(I)%显示原始光斑
title('原始光斑')
I1=imadjust(I,[0.2,0.6],[]);
subplot(1,3,2)
imshow(I1)%亮度调整后的光斑 
title('亮度调整后的图像') 
I2=rgb2gray(I1);%转换为灰度光斑
level=graythresh(I2);%求分割阈值
I3=im2bw(I2,level);%二值化
subplot(1,3,3)
imshow(I3);   %显示二值化光斑
title('二值化光斑')
I4=medfilt2(I3);
figure(2)
subplot(2,2,1)
imshow(I4)%中值滤波后的光斑
title('中值滤波后的光斑')
I5=bwmorph(I4,'open');%对二值噪声图像进行二值形态学开运算
subplot(2,2,2)
imshow(I5)%显示开运算后的光斑
title('开运算后的光斑')
I6=bwmorph(I5,'close');   %对开运算后的光斑进行形态学闭运算
subplot(2,2,3)
imshow(I6) %显示闭运算后的光斑
title('闭运算后的光斑')
L=bwlabel(I6); %标注二进制图像中已连接的部分
stats = regionprops(L, {'Area', 'ConvexHull', 'MajorAxisLength', ...
'MinorAxisLength', 'Eccentricity', 'Centroid'});
%度量图像区域属性，标注矩阵L中每一个标注区域的一系列属性。L中不同的正整数元素对应不同的区域。
A=[];
for i=1:length(stats)
A=[A stats(i).Area]; %计算出在图像各个区域中像素总个数。
end
[mA,ind]=max(A);
I7=I6;
I7(find(L~=ind))=0;
subplot(2,2,4)
imshow(I7);%显示经过处理后的光斑
hold on;
temp=stats(ind).ConvexHull; %'ConvexHull'矩阵包含某区域的最小凸多边形。此矩阵的每一行存储此多边形一个顶点的xy坐标。
t=linspace(0, 2*pi,1000);
c1=stats(ind).Centroid;%给出每个区域的质心
a1=stats(ind).MajorAxisLength;%椭圆的长轴长度
b1=stats(ind).MinorAxisLength;%椭圆的短轴长度
d1=stats(ind).Eccentricity;%椭圆的离心率
x1=c1(1)+d1*b1*cos(t);
y1=c1(2)+d1*a1*sin(t);
m=plot(x1, y1, 'r-');%绘制拟合圆
title('拟合圆')
x2=x1(1,1);
y2=y1(1,1);
x3=x1(1,30);
y3=y1(1,30);
x4=x1(1,80);
y4=y1(1,80);
a=2*(x3-x2);
b=2*(y3-y2);
n=(x3*x3+y3*y3-x2*x2-y2*y2);
d=2*(x4-x3);
e=2*(y4-y3);
f=(x4*x4+y4*y4-x3*x3-y3*y3);
x0=(b*f-e*n)/(b*d-e*a+eps)                  % 求圆心x坐标
y0=(d*n-a*f)/(b*d-e*a+eps)                  % 求圆心y坐标
r0=sqrt((x0-x2)*(x0-x2)+(y0-y2)*(y0-y2))    % 求半径
