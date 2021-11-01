%答题选项部分
figure
imshow(part2)
title('选择题区域');
part2(:,find(sum(part2==0)>10))=[];%去除因旋转，边界添加0的列
part2=imresize(part2,[2500 2800]);%重新设定大小，避免分割后大小不一致
[r c]=size(part2);%重新设定了大小
BW=part2>10&part2<100;%根据黑框的灰度值确定
BW(:,1:ceil(c/2))=0;%前半部分涂黑(可能存在字和下边界黑线的影响)
temp = bwareaopen(BW,1000);%根据连通区域面积，找到黑矩形框（有填涂的选项影响）
temp=bwareaopen(imdilate(temp,ones(40,3)),100000).*temp;%提取出黑框
addr_r=ceil(mean(find(sum(temp)>0)));%横
addr=find(sum(temp')>0);%第一个
addr2=addr(find(diff(addr)>1));%以后的
addr=[addr2-ceil((addr2(1)-addr(1))/2) addr2(end)+ceil(addr2(1)-addr(1))*2 ];%确定每一个黑框所在的中心行
%自定义选择区域(只能大不能小,避免信息丢失)  共4列
xz{1}=part2(50:end,250:addr_r-1820);
xz{2}=part2(50:end,addr_r-1670:addr_r-1250);
xz{3}=part2(50:end,addr_r-1080:addr_r-680);
xz{4}=part2(50:end,addr_r-540:addr_r-180);
figure
for n=1:4
    subplot(1,4,n);
    imshow(xz{n});
end
%找到20个模块
xz_temp=[];%用于存储20个模块 6+6+6+2=20
for m=1:4%共4列
    temp=xz{m};
    if m<4%前3列每列6块
        for n=1:6:31%1:6:37行作为分割的标志
            xz_temp{end+1}=imresize(temp(addr(n):addr(n+6)-50,:),[400 600]);
        end
    else%第四列只有2块
        for n=1:6:7 %1:6:7行作为分割的标志
            xz_temp{end+1}=imresize(temp(addr(n):addr(n+6)-50,:),[400 600]);
        end
    end
end
figure
subplot(1,2,1);
imshow(xz_temp{1});
title('选择题第一模块')
%提取每个模块的答案
xz_ans=[];%判断选择题的答案，ABCD-1234，未填为0
for n=1:20
    ans_temp=zeros(1,5);%默认全部未填
    temp=xz_temp{n};%提取模块
    temp=temp>10&temp<100;%根据黑框的灰度值确定
    temp = imfill(temp,'holes');%填充内部所有
    temp=bwareaopen(temp,1500);%找到填涂的选项
    if n<2
        subplot(1,2,2);
        temp22=temp;%用于显示
        temp22([80 160 240 320],:)=1;
        temp22(:,[150 300 450])=1;
        imshow(temp22);
        title('二值图');
    end
    [L num]=bwlabel(temp);%标记填涂区域
    for m=1:num
        xz_r=ceil(mean(find(sum(L'==m)>0))/400*5);%行(1~5)
        xz_c=ceil(mean(find(sum(L==m)>0))/600*4);%列(1~4)
        ans_temp(xz_r)=xz_c;%将选择题答案填入模块中
    end
    xz_ans(n,1:5)=ans_temp;
end
disp('学生答案：');
disp(char(xz_ans+64));
