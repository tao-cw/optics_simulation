%考号部分
figure
imshow(part1)
title('学号区域');
%找到右边黑框的位置(向下膨胀，使右边的黑框连通，求删除小的连通区域)
BW=part1>10&part1<100;%根据黑框的灰度值确定
BW(:,1:ceil(c/2))=0;%前半部分涂黑(可能存在字和下边界黑线的影响)
temp = bwareaopen(BW,1000);%根据连通区域面积，找到黑矩形框（有填涂的选项影响）
temp=bwareaopen(imdilate(temp,ones(40,3)),50000).*temp;%提取出黑框
%目标是10个黑框，可能存在11个黑框(第11个为黑线旁的黑框，需要去除)
[L,num] = bwlabel(temp);%标记连通区域
if num==11%如果为11个，将最后(即最下面那个)抹去
    L(find(L==11))=0;
    num=10;
end
figure
imshow(L)
title('黑框位置，用于确定学号数值');
%确立黑框的中心位置用于确立左边考号的大概位置。
addr=find(sum(L')>0);%第一个
addr2=addr(find(diff(addr)>1));
addr=[addr2-ceil((addr2(1)-addr(1))/2);
addr2(end)+ceil(addr2(1)-addr(1))*2 ];%确定每一个黑框所在的中心行
addr_c=ceil(mean(find(sum(L)>0)));%横
addr_r=ceil(mean(find(sum(L')>0)));%纵
part1=part1(addr_r-300:end,addr_c-890:addr_c-100);%自定义考号区域(只能大不能小,避免信息丢失)
figure
imshow(part1)
title('学号区域');
part1=part1>10&part1<120;%找到填图的模块
part1 = bwareaopen(part1,400);%根据连通区域面积，找到填涂的考号
[L,num] = bwlabel(part1');%标记连通区域 %因为连通区域是从上往下，再从左往右的，而干扰项在下面，所以需要转置
L=L';%转置回去
part1(find(L>8))=0;%去除干扰项
[L num] = bwlabel(part1);%再次标记，标记号对应考号排列顺序
figure
imshow(L)
title('学号填涂区域');
for n=1:8%考号就8位
    addr_kh(n)=ceil(mean(find(sum(L'.*(L'==n))>0)))+addr_r-300;%找到考号的行。
    num(n)=find(abs(addr_kh(n)-addr)==min(abs(addr_kh(n)-addr)))-1;%考号的行与黑框的行作差。绝对值最小即对应的数再减1
end
xh=num;
