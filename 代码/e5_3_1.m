I=imread('E:\juzi.png');
map=pink(1024);
X=dither(I,map);% 调用dither函数进行图像转化。
subplot(2,1,1);
imshow(I);
subplot(2,1,2);
imshow(X,map)
