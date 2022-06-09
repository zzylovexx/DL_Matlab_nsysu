clear ;clc;close all;
load activity_data_12

Data = [split_data.data];
data_label=[split_data.label];
data_person=[split_data.person];

Size_buf=length(data_person); %5773

height=1;
width=128; %可以去split_data找
channel=6; %6 width 跟chennel好像可以互換
sample_size =Size_buf; %有5773個樣本
CNN_Data=reshape(Data,[height,width,channel,sample_size]);
CNN_Label=categorical(data_label);

person=data_person;
class=12;

indices=crossvalind('HoldOut',person,0.7);%分成70%和30%

Train_data=CNN_Data(:,:,:,indices==0);%有70%是0
Train_data_label=CNN_Label(indices==0);

Test_data = CNN_Data(:,:,:,indices==1);
Test_data_label=CNN_Label(indices==1);

test_data{1,1}=Test_data;%存成cell的形式
test_data{2,1}=Test_data_label;

img = CNN_Data(:,:,:,1);

layers=[imageInputLayer(size(img))
    convolution2dLayer([1 3],1)
    reluLayer
    maxPooling2dLayer([1 2], 'Stride',2); %池化層
    
    convolution2dLayer([1 3],32)
    reluLayer
    maxPooling2dLayer([1 2], 'Stride',2); %池化層
    
    convolution2dLayer([1 3],32)
    reluLayer
    maxPooling2dLayer([1 2], 'Stride',2); %池化層   
 
    fullyConnectedLayer(256)
    dropoutLayer(0.8)

    fullyConnectedLayer(class)
    softmaxLayer 
    classificationLayer()];
analyzeNetwork(layers)
options=trainingOptions('adam',...
    'MaxEpochs',300, ...
    'InitialLearnRate',0.0001,...
    'Verbose',true,...%在command window顯示結果
    'Shuffle','every-epoch',... %每一個epotch的資料都是隨機開始
    'MiniBatchSize',20,...%每10個資料點就更新一次網路參數
    'ValidationData',test_data,...%測試的資料
    'ValidationFrequency',10,...%每20個資料點就測試一次
    'ExecutionEnvironment','multi-gpu',...
    'Plots','training-progress');%劃出往護訓練-測試圖


net=trainNetwork(Train_data,Train_data_label,layers,options);

%%
[predictedLabel,score] = classify(net,test_data{1,1});
testdata_plot=test_data{2,1};
confusion=plotconfusion(testdata_plot',predictedLabel);

save dl_final_cnn_1_3.mat confusion layers options net 