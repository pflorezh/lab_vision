%% Pre

close all
clear
clc 

addpath('lib')

load Hist.mat
load HistTest.mat

%% Data

Size1=size(Hist);
Size2=Size1(2);
num=ceil((1:1:Size2)/30);

%% Random Forest

rng default

NTrain=ceil((1:1:Size2)/30);
NTrainT=NTrain';
HistT=Hist';
trainData = horzcat(HistT,NTrainT);
 
features = trainData(:,(1:40));
classLabels = trainData(:,41);
 
nTrees = 80;

tic

B = TreeBagger(nTrees,features,classLabels, 'Method', 'classification','OOBPred','On','MinLeaf',5);

toc

RFTrain=zeros(1,Size2);
for k=1:Size2
        newData = Hist(:,k);
        newData1 = newData';
        predChar1 = B.predict(newData1);
        predictedClass = str2double(predChar1);
        RFTrain(1,k)=predictedClass;
end 
toc

%Confusion Matrix
CM_RFTrain=confusionmat(num,RFTrain(1,:));
imagesc(CM_RFTrain)
title('Confusion Matrix RF Training','FontWeight','bold')