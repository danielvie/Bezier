function [ddx, ddy] = dderiv(P, N)

    n    = size(P,1) - 1;
    M    = Bezier.get_m(n);
    
%     M    = [-6  18 -18   6
%              6 -12   6   0];
    
    T    = Bezier.get_T(N, n-2);
    
    dM   = diag(n:-1:0)*M;
    dM   = dM(1:end-1, :);
    
    ddM  = diag(n-1:-1:0)*dM;
    ddM  = ddM(1:end-1, :);
    
    V    = T*ddM*P;
    
    ddx  = V(:,1);
    ddy  = V(:,2);
    
end