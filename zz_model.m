function k = zz_model(x, y)
    
    % fit da curva 
    C = Bez.fit(x, y);
    
    % encontrando `y` de `x`
    y = Bez.get_P_from_x(C, 40);
    
    Pi   = Bez.get_P_from_t(C, 0.5);
    
    % encontrando `x` de `y`
    [x, ~, ti] = Bez.get_P_from_y(C, 20);
    
    [dx, dy] = Bez.get_deriv(C, ti(1));
    [ddx, ddy] = Bez.get_dderiv(C, ti(1));
    
    k_ = Bez.get_curvature(C, ti(1));
    
    [tx, ty] = Bez.get_tangent(C, ti(1));
    [nx, ny] = Bez.get_normal(C, ti(1));
    
    % get ponto normal
    P = [10, 0];
    [Pi, ti, Ni] = Bez.get_ponto_normal(C, P);
    
    dist = norm(P - Pi);
    
    k = k_(1);

end