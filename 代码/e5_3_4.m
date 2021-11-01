I=imread('E:\juzi.png');
X=im2bw(I,0.5);% 调用im2bw函数进行图像转化。
figure
imshow(I);
figure
imshow(X)
