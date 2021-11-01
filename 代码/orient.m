function [theta]=orient(bw,xmean,ymean)
[m n]=size(bw);
bw=double(bw);
a=0;
b=0;
c=0;
for i=1:m,
    for j=1:n,
        a=a+(j-xmean)^2*bw(i,j);
        b=b+(j-xmean)*(i-ymean)*bw(i,j);
        c=c+(i-ymean)^2*bw(i,j);
    end;
end;
b=2*b;
theta=atan(b/(a-c))/2;
theta=theta*(180/pi);% 从幅度转换到角度
