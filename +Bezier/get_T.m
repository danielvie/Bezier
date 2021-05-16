function T = get_T(N, grau)
    
    n    = grau;

    t    = linspace(0,1,N);
    T    = ones(N, n+1);
    for i = 1:n
        T(:,n-i+1) = t.^(i);
    end
    
end