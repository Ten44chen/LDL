function [Neig_label]=Neighborhood_k_Label(LD_normal)
%l_delta 
[numS,numL]=size(LD_normal);
Neig_label=cell(numS,numL);
k=1;
for i=1:numL
    ll_del(i,1)=mean(LD_normal(:,i));
end
l_delta=mean(ll_del);
     
while k<=numL
     Ps_LD=LD_normal(:,k);
    N=find(Ps_LD==0);

    Dla = pdist(Ps_LD,'euclidean');
    DL=squareform(Dla);
    for i=1:numS
        if Ps_LD(i,1)==0
         %Neig_label{i,1}=find(DL(i,:)<=0);
         Neig_label{i,k}=N;
        else
            Li=DL(i,:);
            NL=find(Li<=l_delta);
            Neig_label{i,k}=setdiff(NL,N)';
        end  
    end
    k=k+1;
end

end
     