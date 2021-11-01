clear 
lam = 500e-9;
N = 2;
a = 2e-4;
D = 5;
d = 5*a;
ym = 2*lam*D/a;xs=ym;
n = 1001;
ys = linspace(-ym,ym,n);
for i=1:n
sinphi = ys(i)/D;
 alpha = pi*a*sinphi/lam;
beta = pi*d*sinphi/lam;
 B(i,:) = (sin(alpha)./alpha).^2.*(sin(N*beta)./sin(beta)).^2;
B1 = B/max(B);
end
NC = 255;
Br = (B/max(B))*NC;
subplot(1,2,1)
image(xs,ys,Br);
colormap(gray(NC));
subplot(1,2,2)
plot(B1,ys);
