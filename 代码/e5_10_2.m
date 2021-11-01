I=imread('E:\hua1.jpg');
imshow(I);
SE=strel('ball',5,5);%调用SE=strel('ball',R,H,N)函数来获取球形结构元素。
I2=imerode(I,SE);% 调用IM2=imerode(IM,SE)函数来进行腐蚀。
figure
imshow(I2); 
