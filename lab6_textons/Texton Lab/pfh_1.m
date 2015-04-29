%% Pre
close all
clear
clc

addpath('lib')
addpath('train')

%% Texton Dictionary 

[fb] = fbCreate;
img=[];

Direct{1}=sprintf('train/T01_01.jpg');
Direct{2}=sprintf('train/T02_01.jpg');
Direct{3}=sprintf('train/T03_01.jpg');
Direct{4}=sprintf('train/T04_01.jpg');
Direct{5}=sprintf('train/T05_01.jpg');
Direct{6}=sprintf('train/T06_01.jpg');
Direct{7}=sprintf('train/T07_01.jpg');
Direct{8}=sprintf('train/T08_02.jpg');
Direct{9}=sprintf('train/T09_01.jpg');
Direct{10}=sprintf('train/T10_03.jpg');
Direct{11}=sprintf('train/T11_01.jpg');
Direct{12}=sprintf('train/T12_01.jpg');
Direct{13}=sprintf('train/T13_03.jpg');
Direct{14}=sprintf('train/T14_02.jpg');
Direct{15}=sprintf('train/T15_01.jpg');
Direct{16}=sprintf('train/T16_01.jpg');
Direct{17}=sprintf('train/T17_01.jpg');
Direct{18}=sprintf('train/T18_01.jpg');
Direct{19}=sprintf('train/T19_01.jpg');
Direct{20}=sprintf('train/T20_01.jpg');
Direct{21}=sprintf('train/T21_01.jpg');
Direct{22}=sprintf('train/T22_01.jpg');
Direct{23}=sprintf('train/T23_01.jpg');
Direct{24}=sprintf('train/T24_01.jpg');
Direct{25}=sprintf('train/T25_02.jpg');

for i=1:25
img1=double(imread(Direct{i}))/255;
img1=imcrop(img1,[200 200 100 100]);
img=[img img1];
end

k = 40;

tic
[map,textons] = computeTextons(fbRun(fb,img),k);
toc

% figure(1)
% imshow(img,[])
% colormap(gray)
% title('Original Images')
% 
% figure(2)
% imshow(map,[])
% colormap(jet)
% title('Texton Map Result')
% 
% figure(3)
% imagesc(textons)
% colormap(gray)
% xlabel('Filter')
% ylabel('Cluster')

%% Train

tic
trainImg=dir('train/*.jpg');
num=length(trainImg);
for i=1:num
    
    img2=double(imread(trainImg(i).name));
    tmap = assignTextons(fbRun(fb,img2),textons');
    
    Hist(:,i) = histc(tmap(:),1:k)/numel(tmap);
    i
end
toc