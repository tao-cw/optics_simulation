syms a x            %定义符号变量a和x
f=sin(a*x);           %创建函数f
dfx=diff(f,x)        %对x求导
dfa=diff(f,a)        %对a求导


f=x*log(1+x);         %创建函数f
int1=int(f,x)         %对x积分
int2=int(f,x,-1,1)    %求[-1,1]区间上的积分
