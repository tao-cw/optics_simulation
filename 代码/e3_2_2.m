w1=50,w2=60,,k2=4,a=1;  %两列波的参数
x=0:0.001:30;k=0;
m2=moviein(length(0.1:0.2:1.3));
for t=0.1:0.2:1.3
k=k+1;
A=2*a*cos((k1-k2)/2*x-(w1-w2)/2*t);
v=a*cos(k1*x -w1*t)+a*cos(k2*x-w2*t);
plot(x,v,'k-',x,A,'g:',x,-A,'b-.');
axis([0 30 -2 2]);
set(gcf,'color',[1 1 1])
set(gca,'YTick',[-2:1:2])
set(gca,'XTick',[0:5:30])
xlabel('变量X')
ylabel('振幅变化')
title('光学拍')
legend('合成波振幅','包络线1','包络线2')
m2(:,k) = getframe;
end
movie(m2,3)
