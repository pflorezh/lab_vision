%% Pre

close all
clear
clc 

addpath('lib')

load Hist.mat
load HistTest.mat

%% Data

HistTrainN=size(Hist);
HistTrainN2=HistTrainN(2);
num=ceil((1:1:HistTrainN2)/30);

%% Nearest Neighbor
tic

dist=zeros(HistTrainN2,HistTrainN2);
classif=zeros(HistTrainN2,3);

for k=1:HistTrainN2
    HistT=Hist(:,k);
    for i=1:HistTrainN2
        HistTr=Hist(:,i);
        dist(i,k)=sum(sum((HistT-HistTr).^2/HistTr));
    end
    [mins,index]=min(dist(:,k));
    classif(k,1)=mins;
    classif(k,2)=index;
    classif(k,3)=ceil(index/30);
end
toc

%Confusion Matrix
CM_NNTrain=confusionmat(num,classif(:,3));
imagesc(CM_NNTrain)
title('Confusion Matrix for NN Training', 'FontWeight', 'bold')