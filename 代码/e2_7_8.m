X=[52, 75, 68, 88;65,82, 46, 73;50, 89, 56, 115;72, 100, 80, 140];
y=sum(X);       %计算矩阵每列元素之和
subplot(1,2,1);    %在第一个区域绘制
pie(y)            %饼图互不分离
legend('产品1','产品2','产品3','产品4')    %对产品进行加图例
subplot(1,2,2);    %在第二个区域绘制
pie(y,[1,0,1,0]);  %绘制二维饼图，使第1，3块分离出来
legend('产品1','产品2','产品3','产品4')  



hold off            %重新绘制图形
subplot(1,2,1);   
pie3(y)            %三维饼图
subplot(1,2,2);        
pie3(y,[0,0,0,1])     %绘制三维饼图，使第四块分离出来
