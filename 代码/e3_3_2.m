clear 
lam = 500e-9;
a = 1e-3;
D=1;
ym = 3*lam*D/a;
ny = 51;
ys = linspace(-ym,ym,ny);
np = 51;
yp = linspace(0,a,np);
for i=1:ny
  sinphi = ys(i)/D;
  alpha = 2*pi*yp*sinphi/lam;
  sumcos = sum(cos(alpha));
  sumsin = sum(sin(alpha));
  B(i,:) = (sumcos^2+sumsin^2)/np^2;
end
N = 255;
Br = (B/max(B))*N;
subplot(1,2,1)
image(ym,ys,Br);
colormap(gray(N));
subplot(1,2,2)
plot(B,ys);
