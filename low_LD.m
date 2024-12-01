function dep=low_LD(train_data,Neig_label,B,w_kn)

% data=(U,A,d)；
% w is a threshold. 
 if(isempty(B))
        dep=0;
 else
     %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
     train_data=train_data(:,B);% 
     numS=size(train_data,1);
      
     d=dist(train_data'); 
     %%%%%%%%%%%%%%%%% 
     s=[];
    for j=1:numS
         [AA,BB]=sort(d(j,:));
         %近邻w个样本
          b=BB(1:w_kn);
          if (all(ismember(b,Neig_label))==1)
              s=[j,s];
          end
    end
    s=length(s)/numS;%求出依赖度
    dep=mean(s);
 end
end


    