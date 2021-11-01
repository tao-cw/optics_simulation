I=imread(¡®E:\car.jpg'); 
I1=rgb2gray(I); 
I2=edge(I1,'roberts',0.09,'both');   
se=[1;1;1]; 
I3=imerode(I2,se); 
se=strel('rectangle',[25,25]); 
I4=imclose(I3,se);  
I5=bwareaopen(I4,1000);  
