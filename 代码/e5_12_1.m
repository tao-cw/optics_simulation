clear;clc;close all;
filePath='./';%路径
fileName = 'ceshi.mp4';   %名字
file=[filePath fileName];%完整的路径
obj = VideoReader(fileName);  %视频读取函数
numFrames = obj.NumberOfFrames;   %读取视频的属性：帧的总数
%创建一个新文件夹用与存储输出的图片
if ~exist('./Images')  %如果不存在文件夹
     mkdir('./Images');  %创建一个文件夹
end
 for num = 1 : numFrames%循环所有的帧
     frame = read(obj,num);   %读取数据
     imwrite(frame,strcat('./Images/',sprintf('%05d.jpg',num)),'jpg');%以jpg格式保存帧
end  
