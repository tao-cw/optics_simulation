x=0:pi/100:2*pi;
y=sin(x);
T=polyfit(x,y,5);
y1=polyval(T,x);
plot(x,y,'ro',x,y1, 'g-')
