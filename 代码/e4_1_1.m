x1=-1.5:0.001:1.5;   
y1=rectpuls(x1); 
 x0=1.5; 
x2=-0.5:0.001:3.5;  
 a=2;   y2=1.5*rectpuls(x2-x0,a); 
subplot(1,2,1)   
plot(x1,y1,'k','LineWidth',2) 
title('单位矩形函数')
axis([-1 1 -0.1 1.2])
xlabel('x') ;   ylabel('rect(x)') 
subplot(1,2,2) 
plot(x2,y2,'k','LineWidth',2) 
title('一般形式矩形函数')
axis([-0.5 3 -0.1 1.6]) 
xlabel('x');  ylabel('h*rect((x-x0)/w)') 
