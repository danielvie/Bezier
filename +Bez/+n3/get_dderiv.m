function [ddx, ddy] = get_dderiv(P, ti)
    
    M    = Bez.get_M();
    
    N    = numel(ti);
    T    = [ti ones(N, 1) zeros(N, 1) zeros(N, 1)];
    
    dM   = diag([3, 2, 1, 0])*M;
    ddM  = diag([2, 1, 0, 0])*dM;
    
    V    = T*ddM*P;
        
    ddx   = V(:,1);
    ddy   = V(:,2);
    
end