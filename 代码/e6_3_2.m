%¸ßË¹¹âÊøÍ¸¾µ½¹ÃæÑÜÉäÊýÖµ¼ÆËã
clear;
clc;
tic;
n=1.5062;%Í¸¾µµÄÕÛÉäÂÊ£¬²£Á§²ÄÁÏÎªk9
d=3; % Í¸¾µÖÐÐÄºñ¶È
RL=0.025e3;% Í¸¾µÍ¹ÃæÇúÂÊ°ë¾¶
f=RL/(n-1);%Í¸¾µµÄ½¹¾à
R0=1;%ÈëÉä¹âÊø°ë¾¶
lambda=1.064e-3;
k=2*pi/lambda;
phy=lambda/pi/R0;
z=f;
mr2=51;
ne2=61;
mr0=81;
while sqrt(R0^2+z^2)-sqrt(R0^2*(1-1/mr0)^2+z^2)>lambda/20
mr0=mr0+1;
end
ne0=mr0;
rmax=5*f*phy;
r=linspace(0,rmax,mr2);
eta=linspace(0,2*pi,ne2);
[rho,theta]=meshgrid(r,eta);
[x,y]=pol2cart(theta,rho);
r0=linspace(0,3*R0,mr0);
eta0=linspace(0,2*pi*(ne0-1),ne0-1);
[rho0,theta0]=meshgrid(r0,eta0);
[x0,y0]=pol2cart(theta0,rho0);
deta=3*R0/(mr0-1)*2*pi/(ne0-1);
E2=zeros(size(x));
E1=exp(-(x0.^2+y0.^2)/R0^2);
for gk=1:ne2
for df=1:mr2
Rrho=sqrt((x(gk,df)-x0).^2+(y(gk,df)-y0).^2+z^2);
Rtheta=z./Rrho;
opd=exp(j*k*((n-1)*(sqrt(RL^2-rho0.^2)-(RL-d))+d));
Ep=-j/lambda/2*exp(Rrho*j*k).*(1+Rtheta)./Rrho*deta.*rho0.*opd.*E1;
E2(gk,df)=sum(Ep(:));
end
end
Ie=conj(E2).*E2;
figure;
surf(x,y,Ie);
shading interp;
grid off;
box on;
toc;
