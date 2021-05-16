function [dx, dy] = deriv(P, N)
    
    n    = size(P,1) - 1;
    M    = Bezier.get_m(n);
    
    T    = Bezier.get_T(N, n-1);
    
    dM   = diag(n:-1:0)*M;
    dM   = dM(1:end-1, :);
    
    V    = T*dM*P;
    
    dx   = V(:,1);
    dy   = V(:,2);
    
end