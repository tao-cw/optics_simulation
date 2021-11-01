A=imread('E:\3.jpg');
background=imread('E:\background.jpg');%读入背景图像
B=imsubtract(A,background);% 调用imsubtract函数完成图像的相减。
figure
imshow(A);
figure
imshow(background);
figure
imshow(B)
