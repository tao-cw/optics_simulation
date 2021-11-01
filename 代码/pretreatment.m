function inpt=pretreatment(I)
% 训练样本前期处理
if isrgb(I)
I1=rgb2gray(I);
else
I1=I;
end
I1=imresize(I1,[50 25]);%将图片统一划为50*25大小
I1=im2bw(I1,0.9);
[m,n]=size(I1);
inpt=zeros(1,m*n);
%% 将图像按列转换成一个行向量
for j=1:n
for i=1:m
inpt(1,m*(j-1)+i)=I1(i,j);
end
end
