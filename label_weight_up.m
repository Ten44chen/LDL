function [W] = label_weight_up(labels)
%����ͼ

%label_wight��������ǩ����ԵĴ�Ȩ����ͼ
%input����ǩ��
%output��ÿ����ǩ��Ӧ��Ȩ��
labels=mapminmax(labels);
m=size(labels,2);%labels����������ǩ��
CB=[];

for i=1:m
    for j=1:m
        CB(i,j)=mi(labels(:,i),labels(:,j));
        %�����Խ���Ԫ�ظ�ֵΪ0
        CB(i,i)=1000;
    end
end
% CB=triu(CB);%ȡCB�����������Ԫ��;
for i=1:min(size(CB))
CB(i+1:size(CB,1),i)=1000;
end

[aa,bb]=find(CB~=1000);%ֻȡ������
w1 = CB(CB~=1000);
G = graph(aa,bb,w1);%��ͼ����ʽ��ʾCB
plot(G,'EdgeLabel',G.Edges.Weight);

title('��ǩ��ضȴ�Ȩ����ͼ');
W= centrality(G,'pagerank','Importance',G.Edges.Weight);%ÿ���ڵ��Ȩ��

end
