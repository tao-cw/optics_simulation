X1=zeros(1,x);
for j=1:x
for i=PY1:PY2
if(I6(i,j,1)==1)
X1(1,j)= X1(1,j)+1;
end
end
end
subplot(1,2,2);
plot(0:x-1,X1),title('列像素灰度值累计');
xlabel('列值'),ylabel('像数和');
PX1=1;
while ((X1(1,PX1)<3)&&(PX1<x))
PX1=PX1+1;
end
PX2=x;
while ((X1(1,PX2)<3)&&(PX2>PX1))
PX2=PX2-1;
end
PX1=PX1-1; 
PX2=PX2+1; 
