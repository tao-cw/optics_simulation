%一维和二维高斯函数图形，本题编者直接从高斯函数的定义出发绘制高斯函数图形，读者也可以采用gaussmf( )这个函数进行绘制高斯函数图形。
% 高斯函数一维图形
x=-4.5:0.01:4.5; 
gaus=exp(-pi*x.^2);
subplot(1,2,1)
plot(x,gaus)
axis([-4.5 4.5 -0.3 1.1])
grid on 
xlabel('x') 
ylabel('gaus (x)')
title('高斯函数一维图形')
% 高斯函数二维图形
subplot(1,2,2)
y=-4.5:0.01:4.5; 
[X,Y]=meshgrid(x,y);  
Z=exp(-pi*(X.^2+Y.^2)); 
mesh(X,Y,Z)  
grid on  
xlabel('X'),ylabel('Y'),zlabel('ZY')  
title('高斯函数二维图形')
