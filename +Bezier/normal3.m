function [nx, ny] = normal3(P, N)
    
    [tx, ty] = Bezier.tangent3(P, N);
    
    
    % N = rot(90)*T
    % rot(90) = [cos(pi), -sin(pi); sin(pi), cos(pi)];
    nx =  ty;
    ny = -tx;
end