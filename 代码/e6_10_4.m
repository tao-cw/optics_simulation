clear;
[fname,pname]=uigetfile({'*.jpg';'*.bmp';'*.tif';'*.gif'},'Please choose a color picture...');% 返回打开的图片名与图片路径名 
[u,v]=size(fname);
y=fname(v);% 图片格式代表值
switch y
    case 0 
        errordlg('You Should Load Image File First...','Warning...');
    case{'g';'G';'p';'P';'f';'F'};% 图片格式若是JPG/jpg、BMP/bmp、TIF/tif或者GIF/gif，才打开     
        I=cat(2,pname,fname);
        Ori_Face=imread(I);
        subplot(2,3,1),imshow(Ori_Face);
    otherwise
        errordlg('You Should Load Image File First...','Warning...');
end
p=rgb_RGB(Ori_Face);          %肤色分割
subplot(2,3,2);imshow(p);     % 显示皮肤灰度图像
low_pass=1/9*ones(3);
image_low=filter2(low_pass,p);% 低通滤波去噪声 
subplot(2,3,3);imshow(image_low);
% 自适应阀值程序 
previousSkin2=zeros(i,j);
changelist=[];
for threshold=0.55:-0.1:0.05
    two_value=zeros(i,j);
    two_value(find(image_low>threshold))=1;
    change=sum(sum(two_value-previousSkin2));
    changelist=[changelist change];
    previousSkin2=two_value;
end
[C,I]=min(changelist);
optimalThreshold=(7-I)*0.1;
two_value=zeros(i,j);
two_value(find(image_low>optimalThreshold))=1;% 二值化
subplot(2,3,4);imshow(two_value);             % 显示二值图像
frontalmodel=imread('templet.jpg');           % 读入人脸模板照片
FaceCoord=[];
imsourcegray=rgb2gray(Ori_Face)；             % 将原照片转换为灰度图像 
[L,N]=bwlabel(two_value,8);% 标注二值图像中连接的部分,L为数据矩阵，N为颗粒的个数 
for i=1:N,
    [x,y]=find(bwlabel(two_value)==i);% 寻找矩阵中标号为i的行和列的下标 
    bwsegment=bwselect(two_value,y,x,8);% 选择出第i个颗粒 
    numholes=1-bweuler(bwsegment,4);% 计算此区域的空洞数
    if(numholes>=1)% 若此区域至少包含一个洞，则将其选出进行下一步运算 
        RectCoord=-1;
        [m n]=size(bwsegment);
        [cx,cy]=center(bwsegment);% 求此区域的质心 
        bwnohole=bwfill(bwsegment,'holes');% 将洞封住（将灰度值赋为1） 
        justface=uint8(double(bwnohole).*double(imsourcegray));% 只在原照片的灰度图像中保留该待识别区域 
        angle=orient(bwsegment,cx,cy);% 求此区域的偏转角度
        bw=imrotate(bwsegment,angle,'bilinear');
        bw=bwfill(bw,'holes');
        [l,r,u,d]=bianjie(bw);
        wx=(r-l+1);% 宽度 
        ly=(d-u+1);% 高度 
        wratio=ly/wx;% 高宽比      
        if((0.8<=wratio)&&(wratio<=2))% 如果目标区域的高度/宽度比例大于0.8且小于2.0，则将其选出进行下一步运算 
            S=ly*wx;% 计算包含此区域矩形的面积 
            A=bwarea(bwsegment);% 计算此区域面积
            if(A/S>0.35)
                [ccorr,mfit,RectCoord]=mobanpipei(justface,frontalmodel,ly,wx,cx,cy,angle);
            end
            if(ccorr>=0.6)
                mfitbw=(mfit>=1);
                invbw=xor(mfitbw,ones(size(mfitbw)));
                source_with_hole=uint8(double(invbw).*double(imsourcegray));
                final_image=uint8(double(source_with_hole)+double(mfit));
                subplot(2,3,5);imshow(final_image);% 显示覆盖了模板脸的灰度图像 
                imsourcegray=final_image;
                subplot(2,3,6);imshow(Ori_Face);% 显示检测效果图
            end;
            if(RectCoord~=-1)
                FaceCoord=[FaceCoord;RectCoord];
            end
        end
    end
end
% 在认为是人脸的区域画矩形 
[numfaces x]=size(FaceCoord);
for i=1:numfaces,
    hd=rectangle('Position',FaceCoord(i,:),'LineWidth',3);
    set(hd,'edgecolor','r');
end
