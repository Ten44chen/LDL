function [W] = label_weight_up(labels)
%无向图

%label_wight：构建标签相关性的带权有向图
%input：标签集
%output：每个标签对应的权重
labels=mapminmax(labels);
m=size(labels,2);%labels的列数，标签数
CB=[];

for i=1:m
    for j=1:m
        CB(i,j)=mi(labels(:,i),labels(:,j));
        %将主对角线元素赋值为0
        CB(i,i)=1000;
    end
end
% CB=triu(CB);%取CB矩阵的上三角元素;
for i=1:min(size(CB))
CB(i+1:size(CB,1),i)=1000;
end

[aa,bb]=find(CB~=1000);%只取上三角
w1 = CB(CB~=1000);
G = graph(aa,bb,w1);%用图的形式表示CB
plot(G,'EdgeLabel',G.Edges.Weight);

title('标签相关度带权无向图');
W= centrality(G,'pagerank','Importance',G.Edges.Weight);%每个节点的权重

end
