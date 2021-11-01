%区域分割：第一条黑线上为学号所在区域，两条黑线中间为填涂答案
[r c]=size(I2);%图像的尺寸可能存在图像发生90°偏转，需要重新确定尺寸
BW=I2<80&I2>0;%根据黑线的灰度值确定这里有补全旋转图像的0灰度值
BW = bwareaopen(BW,10000);%根据连通区域面积，找到两条黑线
part1=I2(1:ceil(mean(find(sum(BW(1:ceil(r/2),:)')>0))),:);%黑线上：班级代号姓名考号（填写考号与填涂考号）
part2=I2(ceil(mean(find(sum(BW(1:ceil(r/2),:)')>0)))+30:ceil(r/2)+ceil(mean(find(sum(BW(ceil(r/2):end,:)')>0)))-30,:);%黑线中间：填涂答案
