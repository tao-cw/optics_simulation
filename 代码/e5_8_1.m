I=imread('E:\4.jpg');
figure
imshow(I);
figure
imhist(I);%调用imhist函数来进行获取直方图。
I1=im2bw(I,130/255); %分割
figure
imshow(I1);
