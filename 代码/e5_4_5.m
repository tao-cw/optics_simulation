A=imread('E:\huatu.png');
B=imread('E:\huatu1.png');
A1=uint16(A);
B1=uint16(B);
C=immultiply(A,B);%调用immultiply函数完成图像A和B的相乘。
C1=immultiply(A1,B1); %调用immultiply函数完成图像A1和B1的相乘。
subplot(1,2,1)
imshow(A);
subplot(1,2,2)
imshow(B);
figure
subplot(1,2,1)
imshow(C);
subplot(1,2,2);
imshow(C1)
