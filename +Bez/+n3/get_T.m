function T = get_T(t)
    
    N = numel(t);    
    T = ones(N, 4);
    for i = 1:3
        T(:,3-i+1) = t.^(i);
    end
    
end