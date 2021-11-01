%图片方向校准（拍照存在横拍和竖拍，需要将图片变为竖拍，且黑框在右）
[r c]=size(I2);%图像的尺寸
BW=I2<80;%根据黑线的灰度值确定  BW为二值化图像
BW2 = bwareaopen(BW,10000);%根据连通区域面积，找到两条黑线
if sum(sum(BW2)>0)<length(BW2)%根据黑线将图片竖立(为校准图片方向作准备)
    temp = bwareaopen(BW,2000);%根据连通区域面积，找到黑矩形框（有填涂的选项影响）
    if sum(sum(temp(1:floor(c/2),:)))>sum(sum(temp(floor(c/2)...
+1:end,:)))%根据黑矩形框在上半图像还是下半图像决定旋转方向
        BW2=imrotate(BW2,-90);%imrotate为旋转图像函数
        I2=imrotate(I2,-90);%imrotate为旋转图像函数
    else
        BW2=imrotate(BW2,90);
        I2=imrotate(I2,90);
    end
end
figure
imshow(I2)
title('方向矫正');

%霍夫直线检测校正角度
[H theta rho]=hough(BW2);%霍夫直线检测 %输入的BW2为两条白线
lines = houghlines(BW2,theta, rho, houghpeaks(H,2));%两条线上所有的点 houghpeaks找到两条线的2组极值点
I2=imrotate(I2,lines(2).theta+((lines(2).theta<0)*2-1)*90,'bilinear','crop');%角度校正输出为I2 根据检测的角度正负，确定偏转方向
figure
imshow(I2)
title('霍夫直线检测及角度矫正');
hold on
for k = 1:length(lines)  
    xy = [lines(k).point1; lines(k).point2];  
    plot(xy(:,1),xy(:,2),'LineWidth',2,'Color','green');%画出线段
end
