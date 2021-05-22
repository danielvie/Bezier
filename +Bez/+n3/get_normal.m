function [nx, ny] = get_normal(C, ti)
    
    [tx, ty] = Bez.get_tangent(C, ti);
    
    % N = rot(90)*T
    % rot(90) = [cos(pi), -sin(pi); sin(pi), cos(pi)];
    nx =  ty;
    ny = -tx;

end