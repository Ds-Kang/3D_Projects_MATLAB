

V1 = pcread('bun000.ply').Location;
V2 = pcread('bun045.ply').Location;


figure('name', 'without ICP')
pcshow(V1);
hold on
pcshow(V2);
hold off

new_V2=V2;
iter=50;
Errors=zeros(iter,1);
%estimate normal
K=5;
[D,I]=pdist2(V2,V2,'euclidean','Smallest',K+1);
n=zeros(size(V2));

for p = 1:size(V2)
    C=zeros(3,3);
    for i = 2:K+1 
        dist=V2(I(i,p),:)-V2(p,:);
        C=C+dist'*dist;
    end
    [vec,val]=eig(C);
    [x,ind] = sort(diag(val));
    n(p,:)=vec(:,ind(1));
end

new_N=n;

for p=1:iter
    I = point_to_plane(V1,new_V2,new_N);
    V2_pair=new_V2(I,:);
    V1_set=V1-mean(V1,1);
    V2_set=V2_pair-mean(V2_pair,1);
    C=zeros(3,3);
    for i=1:length(V1_set)
        C=C+V2_set(i,:)'*V1_set(i,:);
    end
    [U,S,V]=svd(C);
    R=V*U';
    t=mean(V1)'-R*mean(V2_pair)';
    new_V2=(R*new_V2'+t)';
    new_N=(R*new_N'+t)';
    V2_pair=(R*V2_pair'+t)';
    
    E=0;
    for i=1:length(V1)
        E=E+norm(V2_pair(i,:)-V1(i,:));
    end
    Errors(p)=E/length(V1);
end

figure('name', 'without ICP')
pcshow(new_V2,'r');
hold on
pcshow(V1,'b');
hold off

figure('name', 'Error')
plot(Errors)

