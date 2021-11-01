%具体参数都是根据实际要求得到
clear;clc
I=imread('ceshi2.png');%读图
I2=rgb2gray(I);%灰度图
%预处理
BW=edge(I2,'canny',0.3);%边缘检测
BW = imdilate(BW,ones(4));%膨胀
BW = bwareaopen(BW,2000);%去杂散点
BW = imfill(BW,'holes');%填充内部所有
%标记连通区域
[L,num] = bwlabel(BW);%标记连通区域
%绘图
subplot(1,2,1);
imshow(I2);
title('灰度图');
subplot(1,2,2)
imshow(BW);
title('模板');
figure
for n=1:num
    subplot(2,2,n);
    imshow(uint8(L==n).*I2);%将四个模块分开
end
