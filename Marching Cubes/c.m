
addpath('code/geom_toolbox')
addpath('MarchingCubes')
[V,F,UV,C,N] = readOFF("data/bunny-500.off");

[X,Y,Z,x_grid,y_grid,z_grid,im]=implicit_function(V,N,30);
[F_M,V_M,col]=MarchingCubes(X,Y,Z,im, 0);

figure('Name','mesh');

trimesh(F_M,V_M(:,1),V_M(:,2),V_M(:,3))