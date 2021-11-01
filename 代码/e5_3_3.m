I=imread('E:\3.jpg');
[X,map]=gray2ind(I,32);% 调用gray2ind函数进行图像转化。
figure
imshow(I);
figure
imshow(X,map)
