RGB=imread('E:\flower.jpg');
[X,map]=rgb2ind(RGB,0.7);
figure
imshow(RGB);
figure
imshow(X,map)
