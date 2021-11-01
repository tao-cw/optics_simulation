clear;             %清空内存空间
disp('请输入介质折射率n1和n2')
n1=input('n1='); %接受键盘任意输入合适的折射率n1
n2=input('n2='); %接受键盘任意输入合适的折射率n2
theta = 0:0.1:90;   %入射角范围0-90°，步距0.1°
a=theta*pi/180;   %角度化为弧度
rp =(n2*cos(a)-n1*sqrt(1-(n1/n2*sin(a)).^2))./...
    (n2*cos(a)+n1*sqrt(1-(n1/n2*sin(a)).^2));   %p分量振幅反射率
rs = (n1*cos(a)-n2*sqrt(1-(n1/n2*sin(a)).^2))./...
    (n1*cos(a)+n2*sqrt(1-(n1/n2*sin(a)).^2));   %s分量振幅反射率
tp = 2*n1*cos(a)./(n2*cos(a)+n1*sqrt(1-(n1/n2*sin(a)).^2));%p分量振幅透射率
ts = 2*n1*cos(a)./(n1*cos(a)+n2*sqrt(1-(n1/n2*sin(a)).^2));%s分量振幅透射率

figure(1);
subplot(1,2,1);  %作图rp、rs、|rp|、|rs|随入射角的变化曲线
plot(theta,rp,'-',theta,rs,'--',theta,abs(rp),':',...
    theta,abs(rs),'-.','LineWidth',2);
legend('rp','rs','|rp|','|rs|');
xlabel('入射角\theta_i');
ylabel('振幅');
title(['n_1=',num2str(n1),',n_2=',num2str(n2),'时反射系数随入射角的变化曲线']);
axis([0 90 -1 1]);    %设定作图区间
grid on;              %作图加栅格
subplot(1,2,2);
plot(theta,tp,'-',theta,ts,'--',theta,abs(tp),':',...
    theta,abs(ts),'-.','LineWidth',2);
legend('tp','ts','|tp|','|ts|');
xlabel('入射角\theta_i');
ylabel('振幅');
title(['n_1=',num2str(n1),',n_2=',num2str(n2),'时透射系数随入射角的变化曲线']);
if n1<n2
axis([0 90 0 1]);
else
axis([0 90 0 3.5]);
end
grid on;
