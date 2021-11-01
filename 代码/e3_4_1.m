clear all;
c=3e+8,lamd=5e-7,T=lamd/c; %设置光波参数
t=linspace(0,T,1000);
z=linspace(0,5,1000);
w=2*pi/T;
k=2*pi/lamd;
Eox=10;Eoy=5;
Fx=0; 
i=1;
for Fy=0:pi/4:7*pi/4
    Ex=Eox*cos(w*t+k*z);
    Ey=Eoy*cos(w*t+k*z+Fy); 
    subplot(2,4,i);
    i=i+1;
    plot(Ex,Ey);
    n=i-2
    xlabel('x');
    ylabel('y');
    title(['Fy-Fx=',num2str(n),'*pi/4']);
end
