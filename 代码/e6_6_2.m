Q=zeros(256,256);
A=imread('E:\A.png');
imshow(A)
A1=im2bw(A);
A2 =~A1;
A3=[Q Q Q Q;Q Q A2 Q;Q Q Q Q ]
F1=fft2(A3);
P1=F1.*conj(F1);
s=size(A2)
B= imread('E:\B.png');
figure;
imshow(B)
B1=im2bw(B);
B2 = ~B1;
B3=[Q Q Q Q;Q B2 Q Q;Q Q Q Q]
F2=fft2(B3);
P2=F2.*conj(F2);
AB=[Q Q Q Q;Q A2 B2 Q;Q Q Q Q];
figure;
imshow(AB);
F3=fft2(AB);
P3=F3.*conj(F3);
G=ifftshift(ifft2(P3));
G1=ifftshift(ifft2(P3-P1-P2));
figure;imshow(G>150);
figure;imshow(G1>150);
figure;mesh(G);
figure;mesh(G1);
