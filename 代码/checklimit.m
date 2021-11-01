function newcoord=checklimit(coord,maxval)
newcoord=coord;
if(newcoord<1)
    newcoord=1;
    if(newcoord>maxval)
        newcoord=maxval;
    end;
end;
