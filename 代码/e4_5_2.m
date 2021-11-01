close all;
clc;clear
A=zeros(64);
A(15:20,20:40)=1;A(15:50,20:25)=1;
A(45:50,20:40)=1;A(30:34,20:35)=1;
% ppp=exp(rand(64)*pi*2*i);A=A.*ppp;
figure;
imshow(abs(A),[]);
Fa=fft2(fftshift(A));
Fs=fftshift(Fa);
Am=abs(Fs);   % 幅度
Ph=angle(Fs); % 相位
s=11;
cgh=zeros(64*s);
th=max(max(abs(Fs)));
qq=th/1.2;
Am(Am>qq)=qq;
q=1:s;w=(s+1)/2;
for m=1:64;
    for n=1:64;
        h=round(Am(m,n)/qq*(w-1)-0.5);
        md=zeros(s);
        if h>0;
            td=ones(h*2+1,3);
            Pm=round(Ph(m,n)/pi*3);
            kz=Pm+w;
            md(w-h:w+h,kz-1:kz+1)=td;
        end
        cgh((m-1)*s+q,(n-1)*s+q)=md;
    end
end
figure;imshow(cgh,[]);  % 迂回位相编码结果
Re=ifft2(cgh);  Re=fftshift(Re);
figure;imshow(abs(Re),[]); % 再现图像
