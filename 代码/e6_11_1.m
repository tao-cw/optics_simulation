clear;clc;close all;warning off%图片太大，输出会报警告，取消警告
I=imread('jdk.jpg');%读取图片
I2=rgb2gray(I);%彩色图变为灰度图
figure
imshow(I2)
title('原图');
