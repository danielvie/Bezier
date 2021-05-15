function Pi = get3(C, t)
    
    n    = numel(t);
    t    = reshape(t, [n, 1]);
    
    ONES = ones(n, 1);
    T    = [t.^3, t.^2, t, ONES];
    M    = Bezier.get_m3();

    Pi   = T*M*C;
    
end