%创建函数文件 mean1.m。
function s = mean1 % MATLAB 函数文件 mean1.m
global BEG END% 说明全局变量 BEG 和 END
k=BEG:END;  % 由全局变量 BEG 和 END 创建向量 k
s=sum(k);            % 对向量元素值求和
