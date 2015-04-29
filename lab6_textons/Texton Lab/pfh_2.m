%% Pre
close all
clear
clc

addpath('lib')
addpath('test')

load fb.mat
load textons.mat

%% Test

tic
testImg=dir('test/*.jpg');
num=length(testImg);

for i = 1:num
    img2=double(imread(testImg(i).name));
    tmap = assignTextons(fbRun(fb,img2),textons');
    
    HistTest(:,i) = histc(tmap(:),1:k)/numel(tmap);
    i
end
toc