clear;
a = input('输入单矩孔的宽度(单位 m):a = ');
b = input('输入单矩孔的长度(单位 m):b = ');
lambda = input('输入单色光的波长(单位 m): ');
f = 1; %透镜焦距为1m
m = 500; %确定屏幕上点数
ym = 8000*lambda*f;      %屏幕上y的范围
ys = linspace(-ym,ym,m); 
xs = ys;                 %屏幕上x的范围
n = 255;
for i=1:m
    sinth1 = xs(i)/sqrt(xs(i)^2+f^2);
    sinth2 = ys./sqrt(ys.^2+f^2);
    angleA = pi*a*sinth1/lambda;
    angleB = pi*b*sinth2./lambda;
B(:,i)=(sin...
(angleA).^2.*sin(angleB).^2.*a^2.*b^2.*1250./lambda^2./(angleA.^2.*angleB.^2));
end
subplot(1,2,1);
image(xs,ys,B);
colormap(gray(n));
subplot(1,2,2);
plot(B(m/2,:),ys,'k');
