tic
A=rand(1000);
for n=1:1000
    for m=1:1000
if A(m,n)<0.5
A(m,n)=0;
        else 
A(m,n)=1;
        end
end
end
toc
