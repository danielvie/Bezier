function T = get_T(N, grau)
    
    n    = grau;

    if numel(N) > 1
        t    = N;
        N    = numel(t);
    elseif N < 1.0
        t    = N;
        N    = 1;
    else
        t    = linspace(0,1,N);
    end
        
    T    = ones(N, n+1);
    for i = 1:n
        T(:,n-i+1) = t.^(i);
    end
    
end