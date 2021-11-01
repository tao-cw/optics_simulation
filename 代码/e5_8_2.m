I=imread('E:\flower2.jpg');
figure
imshow(I);
level=graythresh(I); %调用graythresh函数来进行获得分割阈值
BW=im2bw(I,level); %分割
figure
imshow(BW);
