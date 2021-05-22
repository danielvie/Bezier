function [dx, dy] = get_deriv(P, ti)
    
    M    = Bez.get_M();
    
    N    = numel(ti);
    T    = [ti.^2 ti ones(N, 1) zeros(N, 1)];
    
    dM   = diag([3, 2, 1, 0])*M;
    
    V    = T*dM*P;
        
    dx   = V(:,1);
    dy   = V(:,2);    
    
end