%定义光纤耦合器的基本参数
m=0;n=1;                  %定义光纤模式
n_clad=1.4955;            %包层折射率
lamda_0=1.55*1e-06;       %波导光波长
k0=2*pi/lamda_0;          %真空中波矢量
z0=122*pi;%真空波阻抗
a1_0=1;a2_0=0;            %输入边界条件
eption_0=1/36/pi*1e-09;   %真空介电常数
omega=2*pi/lamda_0*3*1e8;            %光波角频率

                                     %定义1号光纤的参数
r01_core=input('输入1号光纤的纤芯半径(单位为μm)=')*1e-06; %定义1号光纤纤芯半径
r01_clad=3*r01_core;                 %定义1号光纤的包层半径
nc01=input('输入1号光纤的纤芯折射率='); %定义1号光纤的纤芯折射率
delta1=(nc01-n_clad)/nc01;           %相对折射率差
V1=nc01*k0*r01_core*sqrt(2*delta1);  %归一化频率
while V1>2.40483,disp('1号光纤不是单模光纤,请重新输入');   %判断1号光纤是否满足单模条件
r01_core=input('输入1号光纤的纤芯半径(单位为μm)=')*1e-06; %定义1号光纤纤芯半径
r01_clad=3*r01_core;                 %定义1号光纤的包层半径
nc01=input('输入1号光纤的纤芯折射率='); %定义1号光纤的纤芯折射率
delta1=(nc01-n_clad)/nc01;           %相对折射率差
V1=nc01*k0*r01_core*sqrt(2*delta1);  %归一化频率
end;
disp('1号光纤是单模光纤,输入正确')      %1号光纤定义结束
%由特征方程求1号光纤的归一化径向相位常数和归一化径向衰减常数
fun1=@(U1) U1.*besselj(m+1,U1)/besselj(m,U1)-sqrt(V1^2-U1^2).*besselk(m+1,sqrt(V1^2-U1^2))./besselk(m,sqrt(V1^2-U1^2)); %特征方程
U1=fzero(fun1,1);                    %求解归一化径向相位常数U
W1=sqrt(V1^2-U1^2);                  %求解归一化径向衰减常数W
beta01=sqrt(nc01^2*k0^2-(U1/r01_core)^2); %求解1号光纤的传播常数beta
A1=U1/V1*besselk(m,W1)/sqrt(besselk(m+1,W1)*besselk(m+1,W1))*sqrt(4*z0/n_clad/pi/r01_core^2);                                 %求解1号光纤的A
%求1号单模光纤中的横向场分量Ey1
Ey01=@(r,theta) A1*cos(m*theta).*besselj(m,U1*r/r01_core)./besselj(m,U1);
Ey02=@(r,theta) A1*cos(m*theta).*besselk(m,W1*r/r01_core)./besselk(m,W1);

%定义2号光纤的参数
r02_core=input('输入2号光纤的纤芯半径(单位为μm)=')*1e-06; %定义2号光纤纤芯半径
r02_clad=3*r02_core;                     %定义2号光纤的包层半径
nc02=input('输入2号光纤的纤芯折射率=');     %定义2号光纤的纤芯折射率
delta2=(nc02-n_clad)/nc02;               %相对折射率差
V2=nc02*k0*r02_core*sqrt(2*delta2);      %归一化频率
while V2>2.40483,disp('2号光纤不是单模光纤,请重新输入');   %判断2号光纤是否满足单模条件
r02_core=input('输入2号光纤的纤芯半径(单位为μm)=')*1e-06; %定义2号光纤纤芯半径
r02_clad=3*r02_core;                     %定义2号光纤的包层半径
nc02=input('输入2号光纤的纤芯折射率=');     %定义2号光纤的纤芯折射率
delta2=(nc02-n_clad)/nc02;               %相对折射率差
V2=nc02*k0*r02_core*sqrt(2*delta2);      %归一化频率
end;
disp('2号光纤是单模光纤,输入正确')
disp('开始计算，输出仿真图')
%由特征方程求2号光纤的归一化径向相位常数和归一化径向衰减常数
fun2=@(U2) U2.*besselj(m+1,U2)/besselj(m,U2)-sqrt(V2^2-U2^2).*besselk(m+1,sqrt(V2^2-U2^2))./besselk(m,sqrt(V2^2-U2^2));
U2=fzero(fun2,1);   %求解归一化径向相位常数U 
W2=sqrt(V2^2-U2^2); %求解归一化径向衰减常数W
beta02=sqrt(nc02^2*k0^2-(U2/r02_core)^2); %求解2号光纤的传播常数beta
%求解2号光纤的A
A2=U2/V2*besselk(m,W2)/sqrt(besselk(m+1,W2)*besselk(m+1,W2))*sqrt(4*z0/n_clad/pi/r02_core^2);
%求2号单模光纤中的横向场分量Ey2
Ey11=@(r,theta) A2*cos(m*theta).*besselj(m,U2*r/r02_core)./besselj(m,U2);
Ey12=@(r,theta) A2*cos(m*theta).*besselk(m,W2*r/r02_core)./besselk(m,W2);

d=r01_clad+r02_clad;
delta_beta=beta01-beta02;        %定义失配相位常数
F=@(r,theta)conj(Ey01(r,theta)).*Ey12(sqrt(d^2+r.^2-2*d*r.*cos(theta)),theta)*(nc01^2-n_clad^2).*r*omega*eption_0/4;
K12=dblquad(F,0,r01_core,0,2*pi);%求解耦合系数K12
K21=conj(K12);                  %求解耦合系数K21

%求耦合光纤中的功率密度
c2=((delta_beta+sqrt(delta_beta^2+4*abs(K21)^2))*a1_0+2*K12*a2_0)/(2*sqrt(delta_beta^2+4*abs(K21)^2));
c1=a1_0-c2;
%求解1号光纤中的耦合计算
r_core1=linspace(-r01_core,r01_core,400); %rz平面上纤芯内某点的纵坐标
z1=linspace(0,4,1000);                    %耦合距离
[Z1,R_core1]=meshgrid(z1,r_core1);
theta0=0;                                 %沿零度方位角取光纤的轴向剖面（rz平面）
r_clad1=linspace(r01_core,(d+r02_clad),500); %rz包层内某点的纵坐标
[Z11,R_clad1]=meshgrid(z1,r_clad1);
a1=c1*exp(i*(delta_beta+sqrt(delta_beta^2+4*abs(K21)^2))/2*z1)+c2*exp(i*(delta_beta-sqrt(delta_beta^2+4*abs(K21)^2))/2*z1); %求解1号光纤中场振幅
Sz_core1=A1^2/2/z0*(cos(m*theta0))^2*nc01.*(besselj(m,U1*abs(r_core1)'/r01_core)./besselj(m,U1)).^2*abs(a1).^2;             %求解纤芯功率密度
Sz_clad1=A1^2/2/z0*(cos(m*theta0))^2*n_clad.*(besselk(m,W1*r_clad1'/r01_core)/besselk(m,W1)).^2*abs(a1).^2;                %求解包层功率密度

%求解2号光纤中的耦合计算
r_core2=linspace(d-r02_core,d+r02_core,500); %rz平面上纤芯内某点的纵坐标
z2=linspace(0,4,1000);                %耦合距离
[Z2,R_core2]=meshgrid(z2,r_core2);
r_clad2=linspace(0,d-r02_core,500);
[Z22,R_clad2]=meshgrid(z2,r_clad2);
a2=-(c1*(delta_beta+sqrt(delta_beta^2+4*abs(K21)^2))/2*exp(i*(-delta_beta+sqrt(delta_beta^2+4*abs(K21)^2))/2*z2)+c2*(delta_beta-sqrt(delta_beta^2+4*abs(K21)^2))/2*exp(-i*(delta_beta+sqrt(delta_beta^2+4*abs(K21)^2))/2*z2))/K12;  %求解2号光纤中场振幅
Sz_core2=A2^2/2/z0*(cos(m*theta0))^2*nc02.*(besselj(m,U2*abs(r_core2-d)'/r02_core)./besselj(m,U2)).^2*abs(a2).^2;      %求解2号光纤纤芯功率密度
Sz_clad2=A2^2/2/z0*(cos(m*theta0))^2*n_clad.*(besselk(m,W2*(d-r_clad2)'/r02_core)/besselk(m,W2)).^2*abs(a2).^2; %求解2号光纤包层功率密度
%耦合功率密度绘图

cmap=[linspace(1,0,256);linspace(1,0,256);zeros(1,256)]';
colormap(cmap);
subplot(1,1,1);
surf(Z1,R_core1,Sz_core1),view(-10,60);
hold on;
surf(Z11,R_clad1,Sz_clad1),view(-10,60);
subplot(1,1,1);
surf(Z2,R_core2,Sz_core2),view(-10,60);
hold on;
surf(Z22,R_clad2,Sz_clad2),view(-10,60);
shading flat;colorbar;axis tight;
xlabel('耦合距离z（m）');
ylabel('r','Fontsize',13,'FontName','Times');
title('1号和2号光纤的耦合功率密度分布');

%绘制耦合光纤功率密度对比图
figure
cmap=[linspace(1,0,256);linspace(1,0,256);zeros(1,256)]';
colormap(cmap);
subplot(2,1,2);
mesh(Z1,R_core1,Sz_core1),view(0,0);
hold on;
mesh(Z11,R_clad1,Sz_clad1);
shading flat;colorbar;axis tight;
xlabel('耦合距离z(m)');
ylabel('r','Fontsize',13,'Fontname','Times');
title('1号光纤的耦合功率密度分布');
subplot(2,1,1);
mesh(Z2,R_core2,Sz_core2);
hold on;
mesh(Z22,R_clad2,Sz_clad2),view(0,0);
shading flat;colorbar;axis tight;
xlabel('耦合距离z（m）');
ylabel('r','Fontsize',13,'FontName','Times');
title('2号光纤的耦合功率密度分布');

%绘制耦合效率曲线图
figure
Pout_1=abs(a1).^2;
Pout_2=abs(a2).^2;
enta=Pout_2;
subplot(3,1,1);
plot(z1,Pout_1);
xlabel('耦合距离z(m)');ylabel('直通臂功率Pout_1');
subplot(3,1,2);
plot(z1,Pout_2);
xlabel('耦合距离z(m)');ylabel('耦合臂功率Pout_2');
subplot(3,1,3);
plot(z1,enta);
xlabel('耦合距离z(m)');ylabel('耦合效率');
title('耦合效率——耦合距离曲线图');
