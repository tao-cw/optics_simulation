clear;clc;close all
I=rgb2gray(imread('齿轮.jpg'));
%进行简单的形态学处理以减少识别错误
SE =strel('ball',5,5);%调用SE = strel('ball',R,H,N)函数来实现球形结构元素
I2 =imdilate(I,SE);%膨胀
I2 =imerode(I2,SE);  %腐蚀
BW =edge(I2,'Canny');%提取边界
imshow(BW)    %显示图像
[c,r]=imfindcircles(BW,[20,300],'ObjectPolarity','dark');%找到半径为20~300像素的圆
viscircles(c,r,'LineStyle','--');%在图中描绘出圆
