
addpath('code/geom_toolbox')
addpath('MarchingCubes')
addpath('toolbox_graph/toolbox_graph')
[V,F,UV,C,N] = readOFF("data/bunny-500.off");

[X,Y,Z,x_grid,y_grid,z_grid,im]=implicit_function(V,N,20);
[F_M,V_M,col]=MarchingCubes(X,Y,Z,im, 0);

iter=100;
start_points=ones(iter,1);

faces=[F_M(:,1),F_M(:,2); F_M(:,2),F_M(:,3); F_M(:,1),F_M(:,3);];
G=graph(faces(:,1),faces(:,2));

D = distances(G,start_points(1));
[M,idx]=max(D);

start_points(2)=idx;

for i =2:iter
    D = distances(G,start_points(1:i));
    S=min(D);
    [M,idx]=max(S);
    
    start_points(i+1)=idx;
end

point=V_M(start_points,:);
scatter3(point(:,1),point(:,2),point(:,3),15)
