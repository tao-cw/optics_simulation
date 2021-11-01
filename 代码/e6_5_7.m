RGB=imread('E:\6.jpg');
imshow(RGB);
title('‘≠Õº','fontsize',26);
figure;
[l,m,n]=size(RGB);
x=l/16;
y=m/16;
RGB(:,:,1)=flipud(RGB(:,:,1));
RGB(:,:,2)=fliplr(RGB(:,:,2));
RGB(:,:,3)=RGB(:,:,3);
for i=0:15
    for j=0:15
RGB((j*x+1):((j+1)*x),(i*y+1):((i+1)*y),1)=RGB((j*x+1):((j+1)*x),(i*y+1):((i+1)*y),1);
RGB((j*x+1):((j+1)*x),(i*y+1):((i+1)*y),2)=flipud(RGB((j*x+1):((j+1)*x),(i*y+1):((i+1)*y),2));
RGB((j*x+1):((j+1)*x),(i*y+1):((i+1)*y),3)=fliplr(RGB((j*x+1):((j+1)*x),(i*y+1):((i+1)*y),3));
    end
end
subplot(1,2,1);
imshow(RGB);
title('º”√‹ÕºœÒ','fontsize',23);
for i=0:15
    for j=0:15
RGB((j*x+1):((j+1)*x),(i*y+1):((i+1)*y),1)=RGB((j*x+1):((j+1)*x),(i*y+1):((i+1)*y),1);
RGB((j*x+1):((j+1)*x),(i*y+1):((i+1)*y),2)=flipud(RGB((j*x+1):((j+1)*x),(i*y+1):((i+1)*y),2));
RGB((j*x+1):((j+1)*x),(i*y+1):((i+1)*y),3)=fliplr(RGB((j*x+1):((j+1)*x),(i*y+1):((i+1)*y),3));
    end
end
RGB(:,:,1)=flipud(RGB(:,:,1));
RGB(:,:,2)=fliplr(RGB(:,:,2));
RGB(:,:,3)=RGB(:,:,3);
subplot(1,2,2);
imshow(RGB);
title('Ω‚√‹ÕºœÒ','fontsize',23);
