function [K, R, t] = estimate_params(P)
% ESTIMATE_PARAMS computes the intrinsic K, rotation R and translation t from
% given camera matrix P.
    [~,~,V]=svd(P);
    c=V(:,4);
    c=c(1:3)./c(4);
    
    A=flip(eye(3));
    P_r=A * P(:,1:3) * sign(det(P(:,1:3)));
    [Rt,Kt] = qr(P_r');
    
    K=A*Kt'*A;
    R=A*Rt';
    D=diag(sign(diag(K)));
    K=K*D;
    R=D*R;
    t=-R*c;
       