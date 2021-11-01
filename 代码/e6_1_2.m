[y,x,z]=size(I5);
I6=double(I5);
Y1=zeros(y,1);
for i=1:y
for j=1:x
if(I6(i,j,1)==1)
Y1(i,1)= Y1(i,1)+1;
 end
 end
end
figure;
subplot(1,2,1);
plot(0:y-1,Y1),title('行像素灰度值累计');
xlabel('行值'),ylabel('像素和'); 
 [temp, MaxY]=max(Y1);
PY1=MaxY;
while ((Y1(PY1,1)>=5)&&(PY1>1))
PY1=PY1-1;
end
PY2=MaxY;
while ((Y1(PY2,1)>=5)&&(PY2<y))
PY2=PY2+1;
end
