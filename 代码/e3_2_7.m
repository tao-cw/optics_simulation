clear;
xmax = 10.0;
ymax = 10.0;
Lamd = 452.2e-006;
f = 100;
d = 0.20;
N = 150;
x = linspace(-xmax,xmax,N);
y = linspace(-ymax,ymax,N);
for i=1:N
    for j=1:N
        r(i,j) = sqrt(x(i)*x(i)+y(i)*y(i));
        B(i,j) = cos(2*pi*d*cos(atan(r(i,j)/f))/Lamd).^2;
    end
end
M = 255;
Br = 2.5*B*M;
image(x,y,Br);
colormap(gray(M));
 