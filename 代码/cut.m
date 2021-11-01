function [PIN0,PIN1,PIN2,PIN3,PIN4,PIN5,PIN6]=cut(I)
%%二值化车牌图像
I1 = rgb2gray(I);
I1 = im2bw(I1,graythresh(I1));%二值化图像
I2 = bwareaopen(I1,16);%去除小于16像素的区块
[y,x]=size(I2);
I3=double(I2);
X1=zeros(1,x);
for j=1:x
for i=1:y
if(I3(i,j,1)==1)
	X1(1,j)= X1(1,j)+1;
 end
end
end
Px0=1;
Px1=1;
for i=1:7
while ((X1(1,Px0)<3)&&(Px0<x))
	Px0=Px0+1;
end
Px1=Px0;
while (((X1(1,Px1)>=3)&&(Px1<x))||((Px1-Px0)<10))
	Px1=Px1+1;
end
Z=I2(:,Px0:Px1,:);
switch strcat('Z',num2str(i))
case 'Z1'
PIN0=Z;
case 'Z2'
PIN1=Z;
case 'Z3'
PIN2=Z;
case 'Z4'
PIN3=Z;
case 'Z5'
PIN4=Z;
case 'Z6'
PIN5=Z;
otherwise
PIN6=Z;
end
Px0=Px1;
end
