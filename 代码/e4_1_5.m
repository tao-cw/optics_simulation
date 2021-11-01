% sinc一维图形
x=-4.5:0.01:4.5; 
sinc=sin(pi*x)./(pi*x);
subplot(1,2,1)
plot(x,sinc)
axis([-4.5 4.5 -0.3 1.1])
grid on 
xlabel('x') 
ylabel('sinc (x)')
title('sinc一维图形')
 % sinc二维图形
y=-4.5:0.01:4.5;  
[X,Y]=meshgrid(x,y);  
Z=(sin(pi*X)./(pi*X)).*(sin(pi*Y)./(pi*Y)); 
subplot(1,2,2)
mesh(X,Y,Z)  
grid on  
xlabel('X'),ylabel('Y'),zlabel('ZY')  
title('sinc二维图形')
