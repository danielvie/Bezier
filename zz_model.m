function k = zz_model(x, y)
    
    % fit da curva 
    C = Bez.n3.fit(x, y);
    
    % encontrando `y` de `x`
    y = Bez.n3.get_P_from_x(C, 40);
    
    Pi   = Bez.n3.get_P_from_t(C, 0.5);
    
    % encontrando `x` de `y`
    [x, ~, ti] = Bez.n3.get_P_from_y(C, 20);
    
    [dx, dy] = Bez.n3.get_deriv(C, ti(1));
    [ddx, ddy] = Bez.n3.get_dderiv(C, ti(1));
    
    k_ = Bez.n3.get_curvature(C, ti(1));
    
    [tx, ty] = Bez.n3.get_tangent(C, ti(1));
    [nx, ny] = Bez.n3.get_normal(C, ti(1));
    
    % get ponto normal
    P = [10, 0];
    [Pi, ti, Ni, dist, TANG] = Bez.n3.get_ponto_normal(C, P);
    
    k = k_(1);
    

end