function k = get_curvature(P, ti)
    
    [dx,   dy] = Bezier.deriv(P, ti);
    [ddx, ddy] = Bezier.dderiv(P, ti);
    
    num = dx.*ddy - ddx.*dy;
    den = (dx.^2 + dy.^2).^(3/2);
    
    k   = num./den;

end