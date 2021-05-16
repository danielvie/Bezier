function [nx, ny] = normal(P, N)
    
    [tx, ty] = Bezier.tangent(P, N);
    
    
    % N = rot(90)*T
    % rot(90) = [cos(pi), -sin(pi); sin(pi), cos(pi)];
    nx =  ty;
    ny = -tx;
end