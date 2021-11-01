%对角方向滤波器；
clear
Y1=imread('fft.jpg');
J1=fftshift(fft2(rgb2gray(Y1)));
[m,n]=size(J1);
J2=zeros(m,n);
T=zeros(m,n);
for i=80:m-80
    for j=110:n-70
    if abs(i-(n-j))<=40
            T(i,j)=1;
    else
        T(i,j)=0;

    end
    J2(i,j)=T(i,j)*J1(i,j);
    end
end
figure
subplot(3,2,1);imshow(Y1);title('原物象');
subplot(3,2,2);imshow(abs(J1),[]);title('物体的场');
J11=uint8(real(ifft2(ifftshift(J2))));
subplot(3,2,3);imshow(T,[]);title('方向滤波器')
subplot(3,2,4);imshow(abs(J2),[]);title('滤波后物体的场');
subplot(3,2,5);imshow(J11,[]);title('通过滤波器后的物体')
