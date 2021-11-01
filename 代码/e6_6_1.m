P=imread('D:\shuzi.jpg');
imshow(P)
P1=im2bw(P);
P2 = ~P1;
s=size(P2)
I= imread('D:\2.png');
I1=im2bw(I);
I2= ~I1;
C=fftshift(ifft2(fft2(P2).*conj(fft2(I2))));
figure;
imshow(C);
thresh=170;
figure;
imshow(C>thresh);
F=conj(C).*C;
figure;
mesh(F);
