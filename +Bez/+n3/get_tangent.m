function [tx, ty] = get_tangent(C, ti)
    
    [dx, dy] = Bez.n3.get_deriv(C, ti);
    
    d = hypot(dx, dy);
    
    tx = dx./d;
    ty = dy./d;

end