clear;clc;close all;
framesPath = './Images/';%图像序列所在路径，同时要保证图像大小相同
videoName = 'ceshi2.avi';%表示将要创建的视频文件的名字
fps = 25; %帧率总时间 = 图片的数目/帧率
numFrames = length(dir('./Images'))-2; %统计图片数第一个文件是. 第二个文件是.. 所以要减2
if(exist('videoName','file'))  %如果存在相同名字的video
    delete videoName.avi   %删除video
end  
%生成视频的参数设定
aviobj=VideoWriter(videoName);  %创建一个avi视频文件对象，开始时其为空
aviobj.FrameRate=fps;  %帧率复制给video属性
open(aviobj);%打开video的接口，开始写入数据
for num=1:numFrames  
    fileName=sprintf('%05d',num); %图片名
    frames=imread([framesPath,fileName,'.jpg']);%读取图片数据
    writeVideo(aviobj,frames);  %将图片数据写入video 
end  
close(aviobj);   %关闭video
