
function [X,Y,Z,x_grid,y_grid,z_grid,im]=implicit_function(V,N,len)
    
    [min_V,max_V]= bounds(V);
    diff=max_V-min_V;
    x_grid=linspace(min_V(1)-diff(1)*0.01,max_V(1)+diff(1)*0.01,len);
    y_grid=linspace(min_V(2)-diff(2)*0.01,max_V(2)+diff(2)*0.01,len);
    z_grid=linspace(min_V(3)-diff(3)*0.01,max_V(3)+diff(3)*0.01,len);

    [X,Y,Z]=meshgrid(x_grid,y_grid,z_grid);

    % scatter3(X,Y,Z)
    im=zeros(size(X));

    %calculate distance
    for i=1:len
        for j=1:len
            for k=1:len 
                point=[X(i,j,k),Y(i,j,k),Z(i,j,k)];
                
                [~,I]=pdist2(V,point,'euclidean','Smallest',1);
                im(i,j,k)=(V(I,:)-point)*N(I,:)';
            end
        end
    end
end
