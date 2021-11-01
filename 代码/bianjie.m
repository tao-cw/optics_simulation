function [left,right,up,down]=bianjie(A)
[m n]=size(A);
left=-1;
right=-1;
up=-1;
down=-1;
for j=1:n,
    for i=1:m,
        if(A(i,j)~=0)
            left=j;
            break;
        end;
    end;
    if(left~=-1)
        break;
    end;
end;
for j=n:-1:1,
    for i=1:m,
        if(A(i,j)~=0)
            right=j;
            break;
        end;
    end;
    if(right~=-1)
        break;
    end;
end;
for i=1:m,
    for j=1:n,
        if(A(i,j)~=0)
            up=i;
            break;
        end;
    end;
    if(up~=-1)
        break;
    end;
end;
for i=m:-1:1,
    for j=1:n,
        if(A(i,j)~=0)
            down=i;
            break;
        end;
    end;
    if(down~=-1)
        break;
    end;
end;
