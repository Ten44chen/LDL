%attribute reduct, 
%training is training set, 
% D is paramater to select the  distance function, D=1 is mandistance; D=2 is 欧氏距离 D=3是 infinite norm
% w is used to control the size of neighborhood
% function red=reduct_mu(train_data,train_target,D,w_label,w_data)
function red=reduct_mu(train_data,train_target,D,w_label,R,red)%w邻域半径
% tic;

% train_data=gpuArray(train_data);
% train_target=gpuArray(train_target);
% w_label=gpuArray(w_label);
    [row_data,column_data]=size(train_data);
    [row_label,column_label]=size(train_target');

if (isempty(red))
     red=R;
 end

% red=gpuArray(red);

C=1:column_data;%条件属性
% C=gpuArray(C);
k=1;


while(k~=0)
    sig=[];
    C=setdiff(C,red);%C = C - red。此函数只能求出向量C中与red不同的元素[acc_mean,acc_std]=crossvalidate(standdata(:,[red n]),10,'CART')
    parfor i=1:length(C)
%         POS=low_mu(train_data,train_target,[red,C(i)],D,w_label,w_data);
%         POS1=low_mu(train_data,train_target,red,D,w_label,w_data);
        POS=low_mu(train_data,train_target,[red,C(i)],D,w_label);
        POS1=low_mu(train_data,train_target,red,D,w_label);   
        
        sig(i)=POS-POS1;%求出属性重要度
    end
    t=max(sig);
    m=find(sig==t);%输出各个属性的位置
    if (t>0)
        red=[C(m(1)),red];
        save('redcet_end');
        k=1;
    else 
        k=0;
    end

end
% red=gather(red);
% toc;
        
    
   
    