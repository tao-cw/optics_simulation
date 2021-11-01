I=imread('E:\hua1.jpg');
h=fspecial('sobel');% 调用h=fspecial('soble')来生成“sobel”模板。
BW1=edge(I,'sobel','horizontal');%水平边界提取
BW2=imfilter(I,h);
figure
imshow(I);
figure
imshow(BW1);
figure
imshow(BW2)
