clear
a=imread('fft2.jpg');%分别读入jpg形式的矩形孔、十字架、伞形孔、字体孔等输入物
figure(1)
imshow(a,[]);
afft=fft2(a);
aa=ifft2(fftshift(afft));
figure(2)
imshow(aa,[])
