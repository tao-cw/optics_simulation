A=imread('E:\hua1.jpg');
B=imread('E:\rice.jpg');
C1=imadd(A,B,'uint16');%调用imadd函数完成图像的相加，结果保存为16位格式。
C2=imadd(A,B); %结果保存为8位格式。
figure(1)
subplot(1,2,1);
imshow(A);
subplot(1,2,2);
imshow(B);
figure(2)
subplot(1,2,1);
imshow(C1,[]);
subplot(1,2,2);
imshow(C2)
