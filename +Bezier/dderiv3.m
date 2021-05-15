function [ddx, ddy] = dderiv3(P, N)
    
    M    = [-6  18 -18   6
             6 -12   6   0];
    
    T    = linspace(0,1,N)';
    ONES = ones(N, 1);
    
    V    = [T ONES]*M*P;
    
    ddx  = V(:,1);
    ddy  = V(:,2);
    
end