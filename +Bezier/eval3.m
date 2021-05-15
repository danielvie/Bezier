function [x,y] = eval3(P, N)

    M    = Bezier.get_m3();
    
    T    = linspace(0,1,N)';
    ONES = ones(N, 1);
    
    V    = [T.^3 T.^2 T ONES]*M*P;
    
    x    = V(:,1);
    y    = V(:,2);

end