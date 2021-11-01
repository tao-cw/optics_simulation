w1=50,w2=60,,k2=4,a=1;  %两列波的参数
x=0:0.001:30;
A=2*a*cos((k1-k2)/2*x-(w1-w2)/2*t(end));
l=A.*A;
plot(x,l)
set(gca,'YTick',[0:1:4])
set(gca,'XTick',[0:5:30])
xlabel('变量 X')
ylabel('振幅变化A')
title('合成波光强曲线')
