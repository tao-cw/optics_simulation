[x,y]= meshgrid([-2:0.2:2]);
z=x.*exp(-x.^2-y.^2);
plot3(x,y,z)
