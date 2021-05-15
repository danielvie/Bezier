function Co = offset3(C, distance)
    
    if isscalar(distance)
        dini = distance;
        dfim = distance;
    else
        dini = distance(1);
        dfim = distance(2);
    end
    
    n = 5;
    [xx, yy] = Bezier.eval3(C, n);
    [nx, ny] = Bezier.normal3(C, n);

    D  = linspace(dini, dfim, n)';
    xx = xx + nx.*D;
    yy = yy + ny.*D;

    Co = Bezier.fit3(xx, yy);
    
end