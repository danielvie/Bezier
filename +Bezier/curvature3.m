function k = curvature3(P, N)
    
    [dx,   dy] = Bezier.deriv3(P, N);
    [ddx, ddy] = Bezier.dderiv3(P, N);
    
    num = dx.*ddy - ddx.*dy;
    den = (dx.^2 + dy.^2).^(3/2);
    
    k   = num./den;

end