clear
imga=imread('fft4.jpg');
grid on
figure(1);
imshow(imga,[ ]);
imgray0=rgb2gray(imga);
imgray1=double(imgray0);
afft=fft2(imgray1);      %傅里叶变换

afftI=fftshift(afft);    % 直流分量移到频谱中心
RR=real(afftI);      % 取傅立叶变换的实部
II=imag(afftI);      % 取傅立叶变换的虚部
A=sqrt(RR.^2+II.^2); % 计算频谱幅值
A=(A-min(min(A)))/(max(max(A))-min(min(A)))*255;    %归一化
figure(2);
imshow(A);        % 显示原图像的象

[m,n]=size(A);
[x,y]=meshgrid(1:n,1:m);
figure(4)
mesh(x,y,A)
