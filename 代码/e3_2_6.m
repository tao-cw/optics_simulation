clear
R=0.855; %透镜的曲率半径
N=400; %设置灰度等级
lamda=5893e-6; %入射光波长
rr=0.1;
[x,y]=meshgrid(linspace(-rr,rr,N)); %坐标轴取值
r=abs(x+i*y); 
d=r.^2/R/lamda*pi*2; %牛顿环的光斑能量
z=cos(d);z=abs(z);
Z(:,:,1)=z/sqrt(2);Z(:,:,2)=z/sqrt(2); 
Z(:,:,3)=zeros(N);close all; 
H=imshow(Z); %显示图形
 t=0;k=1;
set(gcf,'doublebuffer','on');%设置图形属性 
title('牛顿环');%添加标题 
xlabel('请单击空格键停止此动画页面!',... 
  'fontsize',12,'color','r'); %添加x轴标签
set(gca,'position',[0.161111 0.1423913 0.675194 0.715217]); %设置坐标系位置
set(gcf,'position',[254 115 427 373]) 
while k; %控制循环是否继续
   s=get(gcf,'currentkey');  %获取键盘操作信息 
   if strcmp(s,'space'); %判断是否为spce键
       clc;
       k=0;  %k=0循环终止
   end 
   t=t+0.01; 
   pause(0.3); %暂停0.3s  
   d=d+t; 
   z=cos(d);z=abs(z); 
   Z(:,:,1)=z/sqrt(2); 
   Z(:,:,2)=z/sqrt(2); 
   set(H,'CData',Z); %更细cdata属性，表现为图像动画
end 
figure(gcf); %显示图形
