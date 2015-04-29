%% Pre

close all
clear
clc 

addpath('lib')

load Hist.mat
load HistTest.mat

%% Data

Size1=size(HistTest);
Size2=Size1(2);
num=ceil((1:1:Size2)/10);

%% Random Forest

rng default

NTrain=ceil((1:1:Size2)/30);
NTrainT=NTrain';
HistT=HistTest';
trainData = horzcat(HistT,NTrainT);
 
features = trainData(:,(1:40));
classLabels = trainData(:,41);
 
nTrees = 80;

tic

B = TreeBagger(nTrees,features,classLabels, 'Method', 'classification','OOBPred','On','MinLeaf',5);
 
oobErrorBaggedEnsemble = oobError(B);
plot(oobErrorBaggedEnsemble)
xlabel 'Number of Trees';
ylabel 'Error';

toc

RFTest=zeros(1,Size2);
for k=1:Size2
        newData = HistTest(:,k);
        newData1 = newData';
        
        predChar1 = B.predict(newData1);
        
        predictedClass = str2double(predChar1);

        RFTest(1,k)=predictedClass;
end 
toc

%Matriz de confusiones
ConfMtx_rf=confusionmat(num,RFTest(1,:));
figure; 
imagesc(ConfMtx_rf)
title('Confusion Matrix RF Testing', 'FontWeight', 'bold')