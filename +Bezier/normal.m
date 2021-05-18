function [nx, ny] = normal(P, N, k)
    if ~exist('k', 'var')
        k = 1.0;
    end
    
    [tx, ty] = Bezier.tangent(P, N, k);
        
    % N = rot(90)*T
    % rot(90) = [cos(pi), -sin(pi); sin(pi), cos(pi)];
    nx =  ty;
    ny = -tx;
end