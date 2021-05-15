function [dx, dy] = deriv3(P, N)
    
    M    = [-3   9  -9   3;
             6 -12   6   0;
            -3   3   0   0];
    

    if N < 1.0
        t = N;
        N = 1;
    else
        t    = linspace(0,1,N)';
    end

    ONES = ones(N, 1);
    T    =  [t.^2 t ONES];
    
    V    = T*M*P;
    
    dx   = V(:,1);
    dy   = V(:,2);
    
end