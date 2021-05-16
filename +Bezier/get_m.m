function M = get_m(n)
    if ~exist('n', 'var')
        n = 3;
    end
    
    M = pascal(n+1,1)';
    M = flip(M, 2);
    M = M*diag(M(:,1));
    
    M = (-1)^n*M;
end


