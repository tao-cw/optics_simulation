function [ccorr,mfit,RectCoord]=mobanpipei(mult,frontalmodel,ly,wx,cx,cy,angle)
frontalmodel=rgb2gray(frontalmodel);
model_rot=imresize(frontalmodel,[ly wx],'bilinear');% 调整模板大小
model_rot=imrotate(model_rot,angle,'bilinear');% 旋转模板 
[l,r,u,d]=bianjie(model_rot);% 求边界坐标 
bwmodel_rot=imcrop(model_rot,[l u (r-l) (d-u)]);% 选择模板人脸区域 
[modx,mody]=center(bwmodel_rot);% 求质心 
[morig,norig]=size(bwmodel_rot);% 产生一个覆盖了人脸模板的灰度图像 
mfit=zeros(size(mult));
mfitbw=zeros(size(mult));
[limy,limx]=size(mfit);
% 计算原图像中人脸模板的坐标 
startx=cx-modx;
starty=cy-mody;
endx=startx+norig-1;
endy=starty+morig-1;
startx=checklimit(startx,limx);
starty=checklimit(starty,limy);
endx=checklimit(endx,limx);
endy=checklimit(endy,limy);
for i=starty:endy,
    for j=startx:endx,
        mfit(i,j)=model_rot(i-starty+1,j-startx+1);
    end;
end;
ccorr=corr2(mfit,mult);% 计算相关度 
[l,r,u,d]=bianjie(bwmodel_rot);
sx=startx+l;
sy=starty+u;
RectCoord=[sx sy (r-1) (d-u)];% 产生矩形坐标
