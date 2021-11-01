A=imread('E:\hua1.jpg');
B=imadd(A,30);%灰度图像与常数30相加
C=imadd(A,100); %灰度图像与常数30相加
figure(1)
imshow(A);
figure(2)
imshow(B);
figure(3)
imshow(C)
