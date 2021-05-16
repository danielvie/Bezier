function k = curvature(P, N)
    
    [dx,   dy] = Bezier.deriv(P, N);
    [ddx, ddy] = Bezier.dderiv(P, N);
    
    num = dx.*ddy - ddx.*dy;
    den = (dx.^2 + dy.^2).^(3/2);
    
    k   = num./den;

end