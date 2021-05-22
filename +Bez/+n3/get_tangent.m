function [tx, ty] = get_tangent(C, ti)
    
    [dx, dy] = Bez.get_deriv(C, ti);
    
    d = hypot(dx, dy);
    
    tx = dx./d;
    ty = dy./d;

end