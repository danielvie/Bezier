function [tx, ty] = tangent(P, N, k)
    if ~exist('k', 'var')
        k = 1.0;
    end

    [dx, dy] = Bezier.deriv(P, N);
    
    d = hypot(dx, dy);
    
    tx = dx./d*k;
    ty = dy./d*k;

end