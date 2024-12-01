function [k]=nearest_neighbor_size(Curr_Label)


numL=Curr_Label;
w=mean(numL);

P=find(numL>=w);
N=find(numL<=w); 

r=0.1;
k=max(2,ceil(r*min(length(P),length(N))));
end
