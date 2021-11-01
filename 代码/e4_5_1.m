clear
x=linspace(-0.0023,0.0023,500);
y=linspace(-0.0023,0.0023,500);
[xx,yy]=meshgrid(x,y);
xr=0.1;yr=0;zr=0.1;   %R点位置
x0=0;y0=0;z0=0.5;     %0点位置
Lr=sqrt(xr^2+yr^2+zr^2);
L0=sqrt(x0^2+y0^2+z0^2);
Fir=-pi/(0.6328*(10^-5)*Lr)*[xx.^2+yy.^2-2*(xx.*xr+yy.*yr)];
Fi0=-pi/(0.6328*(10^-5)*L0)*[xx.^2+yy.^2-2*(xx.*x0+yy.*y0)];
zz=0.5+0.5*[cos(Fi0-Fir)];%全息透镜的透过率函数
I=zz;
J=mat2gray(I);
imshow(J);
