function p=rgb_RGB(Ori_Face)
R=Ori_Face(:,:,1);
G=Ori_Face(:,:,2);
B=Ori_Face(:,:,3);
R1=im2double(R);                                  % 将uint8型转换成double型处理 
G1=im2double(G);
B1=im2double(B);
RGB=R1+G1+B1;
m=[0.4144,0.3174];                                %均值
n=[0.0031,-0.0004;-0.0004,0.0003];                %方差
row=size(Ori_Face,1);                             %行像素数
column=size(Ori_Face,2);                          %列像素数
for i=1:row
    for j=1:column
        if RGB(i,j)==0
            rr(i,j)=0;
            gg(i,j)=0;
        else
            rr(i,j)=R1(i,j)/RGB(i,j);             %RGB归一化
            gg(i,j)=G1(i,j)/RGB(i,j);
            x=[rr(i,j),gg(i,j)];
            p(i,j)=exp((-0.5)*(x-m)*inv(n)*(x-m)');% 皮肤概率服从高斯分布
        end
    end
end
