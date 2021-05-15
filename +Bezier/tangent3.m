function [tx, ty] = tangent3(P, N)
    
    [dx, dy] = Bezier.deriv3(P, N);
    
    d = hypot(dx, dy);
    
    tx = dx./d;
    ty = dy./d;

end