function [dx, dy] = deriv3(P, N)
    
    M    = [-3   9  -9   3;
             6 -12   6   0;
            -3   3   0   0];
    
    T    = linspace(0,1,N)';
    ONES = ones(N, 1);
    
    V    = [T.^2 T ONES]*M*P;
    
    dx   = V(:,1);
    dy   = V(:,2);
    
end