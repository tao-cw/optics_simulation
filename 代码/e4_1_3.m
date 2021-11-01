x=-3:0.01:3; 
y=heaviside(x); 
plot(x,y,'k','LineWidth',2) 
axis([-3 3 -0.2 1.2])  
xlabel('x');
ylabel('step(x)')
