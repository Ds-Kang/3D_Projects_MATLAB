function P = estimate_pose(x, X)
% ESTIMATE_POSE computes the pose matrix (camera matrix) P given 2D and 3D
% points.
%   Args:
%       x: 2D points with shape [2, N]
%       X: 3D points with shape [3, N]
    N=length(X);
    X_t=[X;ones(1, N)]';
    x_t=x';
    
    M=[X_t, 0.*X_t, -1.*x_t(:,1).*X_t;
        0.*X_t, X_t, -1.*x_t(:,2).*X_t];
    
    [~, ~, P]=svd(M);
    
   
    P=reshape(P(:,end),[4,3])';
end