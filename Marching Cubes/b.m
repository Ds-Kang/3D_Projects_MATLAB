
addpath('code/geom_toolbox')
addpath('MarchingCubes')
[V,F,UV,C,N] = readOFF("data/bunny-500.off");

len=30;
[X,Y,Z,x_grid,y_grid,z_grid,im]=implicit_function(V,N,len);

figure('Name','Slicing');
mid=round(len/2);
slice(X,Y,Z,im,x_grid(mid),y_grid(mid),z_grid(mid))
figure('Name','Scatter');
sign_im=sign(im(:));
color=[sign_im+1,-sign_im+1,zeros(size(sign_im))];
scatter3(X(:),Y(:),Z(:),15,color)