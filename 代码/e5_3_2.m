I=imread('E:\2.jpg');
BW=dither(I);% 调用dither函数进行图像转化。
figure
imshow(I);
figure
imshow(BW)
