function [tx, ty] = tangent(P, N)
    
    [dx, dy] = Bezier.deriv(P, N);
    
    d = hypot(dx, dy);
    
    tx = dx./d;
    ty = dy./d;

end