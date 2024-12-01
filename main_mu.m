%  w_label=label_weight(train_target');
% w_data=ONP_margin(train_data,train_target);
% tic;
%  mypool=parpool;
% %  gpu_n=gpuDeviceCount ;
% % gpudev=gpuDevice;
% % reset(gpudev);
% tic;
addpath 'D:\matlabR2021a\toolbox\MIToolbox-master\matlab'
addpath 'D:\work\标记分布学习\NRS_M_(2)\MLKNN';
w_label=label_weight_up(train_target');%计算标记权重
% w_data=ONP_margin(train_data,train_target);%计算邻域精度
% red=reduct_mu(train_data,train_target,3,w_label,w_data);%求出red 约简后的数据集
red=[];
red=reduct_mu(train_data,train_target,3,w_label,R,red);
red=sort(red);
[row column]=size(train_data);
train=[];

for i=1:length(red)
    train=[train,train_data(:,red(i))];

end

Num=10;
Smooth=1;

 [Prior,PriorN,Cond,CondN]=MLKNN_train(train,train_target,Num,Smooth);
 
 [HammingLoss,RankingLoss,OneError,Coverage,Average_Precision,Outputs,Pre_Labels]=MLKNN_test(train_data,train_target,test_data,test_target,Num,Prior,PriorN,Cond,CondN);
save('result_cal500')
delete(gcp('nocreate'));
toc;