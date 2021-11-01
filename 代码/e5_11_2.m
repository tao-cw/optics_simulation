clear;clc;close all
I=imread('ceshi.png');%读图
BW=rgb2gray(I);%转换成灰度图
BW=edge(BW,'canny');%边缘检测
BW =bwareaopen(BW,100);%滤波滤除连通区域面积小于100个像素点的连通区域
[L,num] =bwlabel(BW,8);%应用8连通区域得到N个不同的区域
%将每一个直角坐标系转变成极坐标系，并求出角度与长度与的关系
for n=1:num
    temp=L==n;%每一个模块都被标记成了数字
    %去除全为零的行列
    temp = temp(any(temp'),:);
    temp = temp(:,any(temp));
    [S_x S_y]=size(temp);%图像大小
    [x y]=find(temp~=0);%找到边界点的坐标
    x=(x-S_x/2)./S_x;y=(y-S_y/2)./S_y;%移动原点到中间位置行列比例不同进行归一化
    [theta,rho]=cart2pol(x,y);%直角坐标转换成极坐标
    r=sortrows([theta/pi*180 rho]);%依照角度排序
    %如果ρmin不在第一或最后，将ρ最小的前面角度加上360°并移到最后
    if min(r(:,2))~=r(1,2) || min(r(:,2))~=r(1,end)
        [addr ~]=find(min(r(:,2))==r(:,2));%找到最小值在的点最小值位置也许不止一个
        r(1:addr(1)-1,1)=r(1:addr(1)-1,1)+360;%加上360°
        r = circshift(r,1-addr(1));%向后移
        theta=r(:,1)/max(r(:,1));tho=r(:,2)/max(r(:,2));%归一化
    end
    %显示
    subplot(2,num,n);imshow(temp);%图样
    subplot(2,num,n+num);plot(theta,tho);%θ与ρ的关系图
    title('\theta - \rho关系图')
    %根据抽样样本的极大值判断类型
    tho=tho(round(linspace(1,length(theta),min([length(theta) 40]))));%tho取40个样本
    peak_num=length(findpeaks(tho))%找到极大值
    xlabel([num2str(peak_num) '边形']);%显示判断的结果
end
