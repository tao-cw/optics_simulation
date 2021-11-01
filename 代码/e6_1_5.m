%% 归一化训练样本
I0=pretreatment(imread('BP/0.jpg'));
I1=pretreatment(imread('BP/1.jpg'));
I2=pretreatment(imread('BP/2.jpg'));
I3=pretreatment(imread('BP/3.jpg'));
I4=pretreatment(imread('BP/4.jpg'));
I5=pretreatment(imread('BP/4.jpg'));
I6=pretreatment(imread('BP/5.jpg'));
I7=pretreatment(imread('BP/6.jpg'));
I8=pretreatment(imread('BP/8.jpg'));
I9=pretreatment(imread('BP/9.jpg'));
I10=pretreatment(imread('BP/A.jpg'));
I11=pretreatment(imread('BP/B.jpg'));
I12=pretreatment(imread('BP/C.jpg'));
I13=pretreatment(imread('BP/D.jpg'));
I14=pretreatment(imread('BP/H.jpg'));
I15=pretreatment(imread('BP/K.jpg'));
I16=pretreatment(imread('BP/L.jpg'));
I17=pretreatment(imread('BP/X.jpg'));
P=[I0',I1',I2',I3',I4',I5',I6',I7',I8',I9',I10',I11',I12',I13',
I14',I15',I16',I17'];
T=eye(18,18);   %输出样本
%% bp神经网络参数设置
net=newff(minmax(P),[1250,32,18],{'logsig','logsig','logsig'},'trainrp');
net.inputWeights{1,1}.initFcn ='randnr';
net.layerWeights{2,1}.initFcn ='randnr';
net.trainparam.epochs=5000;
net.trainparam.show=50;
%net.trainparam.lr=0.003;
net.trainparam.goal=0.0000000001;
net=init(net);
[net,tr]=train(net,P,T);	%训练样本
%% 测试
%字符分割及处理
dw=imread('dw.jpg');
[PIN0,PIN1,PIN2,PIN3,PIN4,PIN5,PIN6]=cut(dw);
%% 测试字符，得到识别数值
PIN0=pretreatment(PIN0);
PIN1=pretreatment(PIN1);
PIN2=pretreatment(PIN2);
PIN3=pretreatment(PIN3);
PIN4=pretreatment(PIN4);
PIN5=pretreatment(PIN5);
PIN6=pretreatment(PIN6);
P0=[PIN0',PIN1',PIN2',PIN3',PIN4',PIN5',PIN6'];
for i=2:7
T0=sim(net ,P0(:,i));
T1=compet (T0) ;
d=find(T1 == 1) - 1;
if (d==10)
str='A';
elseif (d==11)
str='B';
elseif (d==12)
str='C';
elseif (d==13)
str='D';
elseif (d==14)
str='H';
elseif (d==15)
str='K';
elseif (d==16)
str='L';
elseif (d==17)
str='X';
elseif (d==0)
str='0';
elseif (d==1)
str='1';
elseif (d==2)
str='2';
elseif (d==3)
str='3';
elseif (d==4)
str='4';
elseif (d==5)
str='5';
elseif (d==6)
str='6';
elseif (d==7)
str='7';
elseif (d==8)
str='8';
elseif (d==9)
str='9';
else
str=num2str(d);
end
switch i
case 2
str2=str;
case 3
str3=str;
case 4
str4=str;
case 5
str5=str;
case 6
str6=str;
otherwise
str7=str;
end
end
%%识别出的结果以标题形式显示在图上
S=strcat('渝',str2,str3,str4,str5,str6,str7); 
figure;
imshow(dw),title('S');
