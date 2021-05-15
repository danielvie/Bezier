function Pi = get3(C, t)
    
    ONES = ones(numel(t), 1);
    T    = [t.^3, t.^2, t, ONES];
    M    = Bezier.get_m3();

    Pi   = T*M*C;
    
end