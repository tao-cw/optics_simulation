clear;
N=input('Number of samples(enter from 100 to 500)=');%N:抽样数
L=10*10^-3;
Ld=input('请输入波长 [毫米]=');
Ld=Ld*10^-6;
ko=(2*pi)/Ld;
wo=input('请输入束腰 [毫米]=');
wo=wo*10^-3;
z_ray=(ko*wo^2)/2*10^3;
z_ray=z_ray*10^-3;
z=input('请输入传输距离z[米]=');
dx=L/N;
for n=1:N+1
    for m=1:N+1
           %Space axis 
            x(m)=(m-1)*dx-L/2;
            y(n)=(n-1)*dx-L/2;
            %空域中的高斯光束
                Gau(n,m)=exp(-(x(m)^2+y(n)^2)/(wo^2));%Frequency axis 
            Kx(m)=(2*pi*(m-1))/(N*dx)-((2*pi*(N))/(N*dx))/2;
               Ky(n)=(2*pi*(n-1))/(N*dx)-((2*pi*(N))/(N*dx))/2;
            %自由空间传输函数
            H(n,m)=exp(j/(2*ko)*z*(Kx(m)^2+Ky(n)^2));
    end
end
%频域中的高斯光束
FGau=fft2(Gau);
FGau=fftshift(FGau);
%频域中传输的高斯光束
FGau_pro=FGau.*H; 
Gau_pro=ifft2(FGau_pro);
x=x*10^3;
y=y*10^3;
figure(1);
mesh(x,y,abs(Gau))
title('高斯光强分布')
xlabel('x [毫米]')
ylabel('y [毫米]')
axis([min(x) max(x) min(y) max(y) 0 1])
axis square
figure(2);
mesh(x,y,abs(Gau_pro))
title(['传播',num2str(z),'米后的高斯光束'])
xlabel('x [毫米]')
ylabel('y [毫米]')
axis([min(x) max(x) min(y) max(y) 0 1])
axis square
