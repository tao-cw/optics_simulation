%成绩计算假设所有的答案为A
ans_file=textread('answers.txt','%s');%读取标准答案
for n=1:20
    answers(n,1:5)=abs(ans_file{n})-64;%将ABCD->1234
end
score=sum(sum(xz_ans==answers));%算成绩
%结果显示
disp('学生答案：');
disp(char(xz_ans+64));
disp(['学号：' num2str(xh)]);
disp(['成绩：' num2str(score)]);
