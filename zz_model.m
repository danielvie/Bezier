function k = zz_model(x, y)
    
    % fit da curva 
    C = Bez.fit(x, y);
    
    % encontrando `y` de `x`
    y = Bez.get_P_from_x(C, 40);
        
    % encontrando `x` de `y`
    [x, ~, ti] = Bez.get_P_from_y(C, 20);
    
    [dx, dy] = Bez.get_deriv(C, ti(1));
    [ddx, ddy] = Bez.get_dderiv(C, ti(1));
    
    k_ = Bez.get_curvature(C, ti(1));
    
    [tx, ty] = Bez.get_tangent(C, ti(1));
    [nx, ny] = Bez.get_normal(C, ti(1));
    
    k = k_(1);

end