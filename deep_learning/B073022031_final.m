clear ;clc;close all;
load activity_data_12

Data = [split_data.data];
data_label=[split_data.label];
data_person=[split_data.person];

Size_buf=length(data_person); %5773

height=1;
width=128; %�i�H�hsplit_data��
channel=6; %6 width ��chennel�n���i�H����
sample_size =Size_buf; %��5773�Ӽ˥�
CNN_Data=reshape(Data,[height,width,channel,sample_size]);
CNN_Label=categorical(data_label);

person=data_person;
class=12;

indices=crossvalind('HoldOut',person,0.7);%����70%�M30%

Train_data=CNN_Data(:,:,:,indices==0);%��70%�O0
Train_data_label=CNN_Label(indices==0);

Test_data = CNN_Data(:,:,:,indices==1);
Test_data_label=CNN_Label(indices==1);

test_data{1,1}=Test_data;%�s��cell���Φ�
test_data{2,1}=Test_data_label;

img = CNN_Data(:,:,:,1);

layers=[imageInputLayer(size(img))
    convolution2dLayer([1 3],1)
    reluLayer
    maxPooling2dLayer([1 2], 'Stride',2); %���Ƽh
    
    convolution2dLayer([1 3],32)
    reluLayer
    maxPooling2dLayer([1 2], 'Stride',2); %���Ƽh
    
    convolution2dLayer([1 3],32)
    reluLayer
    maxPooling2dLayer([1 2], 'Stride',2); %���Ƽh   
 
    fullyConnectedLayer(256)
    dropoutLayer(0.8)

    fullyConnectedLayer(class)
    softmaxLayer 
    classificationLayer()];
analyzeNetwork(layers)
options=trainingOptions('adam',...
    'MaxEpochs',300, ...
    'InitialLearnRate',0.0001,...
    'Verbose',true,...%�bcommand window��ܵ��G
    'Shuffle','every-epoch',... %�C�@��epotch����Ƴ��O�H���}�l
    'MiniBatchSize',20,...%�C10�Ӹ���I�N��s�@�������Ѽ�
    'ValidationData',test_data,...%���ժ����
    'ValidationFrequency',10,...%�C20�Ӹ���I�N���դ@��
    'ExecutionEnvironment','multi-gpu',...
    'Plots','training-progress');%���X���@�V�m-���չ�


net=trainNetwork(Train_data,Train_data_label,layers,options);

%%
[predictedLabel,score] = classify(net,test_data{1,1});
testdata_plot=test_data{2,1};
confusion=plotconfusion(testdata_plot',predictedLabel);

save dl_final_cnn_1_3.mat confusion layers options net 