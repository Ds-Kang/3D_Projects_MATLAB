

V1 = pcread('bun000.ply').Location;
V2 = pcread('bun045.ply').Location;


figure('name', 'without ICP')
pcshow(V1);
hold on
pcshow(V2);
hold off

iter=200;
Errors=zeros(iter,1);

new_V2=V2;
for p=1:iter
    [I,D] = knnsearch(new_V2,V1);
    rej_V1=V1(D<0.005,:);
    rej_V2=new_V2(I(D<0.005),:);
    
    V2_pair=new_V2(I,:);
    V1_set=rej_V1-mean(rej_V1,1);
    V2_set=rej_V2-mean(rej_V2,1);
    C=zeros(3,3);
    for i=1:length(V1_set)
        C=C+V2_set(i,:)'*V1_set(i,:);
    end
    [U,S,V]=svd(C);
    R=V*U';
    t=mean(rej_V1)'-R*mean(rej_V2)';
    new_V2=(R*new_V2'+t)';
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
