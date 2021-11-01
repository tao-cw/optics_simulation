A=imread('E:\hua1.jpg');
B=uint8(filter2(fspecial('gaussian'),A));%高斯模糊
C=imabsdiff(A,B);% 调用imabsdiff函数完成图像的相减。
figure
imshow(A);
figure
imshow(B);
figure
imshow(C)
