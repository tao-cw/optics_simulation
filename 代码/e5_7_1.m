I=imread('E:\huasheng.jpg');
imhist(I);
I0=edge(I,'sobel'); %阈值为默认值的边缘检测
I1=edge(I,'sobel',0.06); %阈值为0.06的边缘检测
I2=edge(I,'sobel',0.04);
I3=edge(I,'sobel',0.02);
figure
imshow(I);
figure
imshow(I0);
figure
imshow(I1);
figure
imshow(I2);
figure
imshow(I3)
