
addpath('code/geom_toolbox')
[V,F,UV,C,N] = readOFF("data/bunny-500.off");

plot3(V(:,1),V(:,2),V(:,3),'o','Color','r','MarkerSize',2)
hold on
quiver3(V(:,1),V(:,2),V(:,3),N(:,1),N(:,2),N(:,3),'Color', 'g') 

K=7;
[D,I]=pdist2(V,V,'euclidean','Smallest',K+1);
n=zeros(size(N));


for p = 1:size(V)
    C=zeros(3,3);
    for i = 2:K+1 
        dist=V(I(i,p),:)-V(p,:);
        C=C+dist'*dist;
    end
    [vec,val]=eig(C);
    [x,ind] = sort(diag(val));
    n(p,:)=vec(:,ind(1));
end


quiver3(V(:,1),V(:,2),V(:,3),n(:,1),n(:,2),n(:,3),'Color', 'b') 

hold off