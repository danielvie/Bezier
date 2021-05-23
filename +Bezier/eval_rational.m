function [x,y] = eval_rational(C, t, r)
    
    n  = size(C,1) - 1;
    
    T  = Bezier.get_T(t, n);
    M  = Bezier.get_m(n);
    
    R  = T*M*diag(r);
    d  = sum(R,2);
    
    P  = R*C./d;
    
    x = P(:,1);
    y = P(:,2);

end