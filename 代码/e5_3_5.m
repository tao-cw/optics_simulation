I=imread('E:\rgb.png');
X=rgb2gray(I);% 调用rgb2gray函数将RGB图像转化灰度图像。
figure
imshow(I);
figure
imshow(X)
