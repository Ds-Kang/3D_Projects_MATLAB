%load data from PnP.mat
file = load("PnP.mat");
image=file.image;
cad=file.cad;
X=file.X;
x=file.x;
% run estimage_pose and estimate_params
P=estimate_pose(x,X);
[K,R,t]=estimate_params(P);
projX=P*[X;ones(1,30)];
projX(1,:)=projX(1,:)./projX(3,:);
projX(2,:)=projX(2,:)./projX(3,:);
projX=projX(1:2,:);

% 1. plot 2D points x and the projected 3D points on the image
figure("Name","2D")
imshow(image)
hold on
plot(projX(1,:),projX(2,:),'go',x(1,:),x(2,:),'y.','MarkerSize',10)
hold off

% 2. plot 3d mesh from CAD data.
vertices=cad.vertices;
faces=cad.faces;
v_r=R*vertices';

figure("Name","Rotation")
trimesh(faces,v_r(1,:),v_r(2,:),v_r(3,:), 'facecolor', 'interp', 'edgecolor', 'b')
% 3. plot projected CAD vertices onto the image

projV=P*[vertices';ones(1,length(vertices))];
projV(1,:)=projV(1,:)./projV(3,:);
projV(2,:)=projV(2,:)./projV(3,:);
projV=projV(1:2,:);

figure("Name","CAD overlap")
imshow(image)
hold on
patch('Faces',faces,'Vertices',projV','FaceColor','red','FaceAlpha',.3,'EdgeColor','none')
hold off