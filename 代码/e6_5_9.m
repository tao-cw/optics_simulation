clear
G=imread('E:\图片\圆盘花图.png');
imshow(G);
title('原图','fontsize',26);
figure;
Gadd=fix(256*rand(256,256,3));%引入的置乱随机矩阵
for i=1:256
   for j=1:256
        G1(i,j)=0.1*G(i,j)+0.9*Gadd(i,j);%进行加权求和
end
end
subplot(1,2,1);
imshow(G1);
title('加密图像','fontsize',23);
for  i=1:256
     for j=1:256
           G2(i,j,:)=(G1(i,j)-0.9*Gadd(i,j))./0.1;%还原图像
end
end
subplot(1,2,2);
imshow(G2);
title('解密图像','fontsize',23);
