%产生一个包含两个重叠的圆形图案的二值图像
center1=-10;
center2=-center1;
dist=sqrt(2*(2*center1)^2);
radius=dist/2*1.4;
lims=[floor(center1-1.2*radius),ceil(center2+1.2*radius)];
[x,y]=meshgrid(lims(1):lims(2));
bw1=sqrt((x-center1).^2+(y-center1).^2)<=radius;
bw2=sqrt((x-center2).^2+(y-center2).^2)<=radius;
bw=bw1|bw2;
figure
imshow(bw);
D=bwdist(~bw);
D=-D;
D(~bw)=-max(abs(D(:)));
D=D-min(D(:));
figure
[C,h]=contour(D);
axis equal;
axis ij;
colormap gray;
L=watershed(D);
figure
imshow(L);
rgb=label2rgb(L,'jet',[0.5,0.5,0.5]);
figure
imshow(rgb,'InitialMagnification','fit')
