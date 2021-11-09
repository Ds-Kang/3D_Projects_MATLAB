
function I=point_to_plane(X,Y,N)
    I=zeros(length(X),1);
    for j =1:length(X)
        x=X(j,:);
        q=((Y-x).*N).^2;
        dists=sum(q,2);
        [~,ind]=min(dists);
        I(j)=ind;
    end
end
