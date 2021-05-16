function C = fit(x, y, n)
    
    % lendo nro de elementos
    N = numel(x);
    
    % lendo pontos
    P = [reshape(x, [N, 1]), reshape(y, [N, 1])];

    % montando T
    T = Bezier.get_T(N, n);

    % lendo M
    M = Bezier.get_m(n);

    % calculando coeficientes
    C = M\((T'*T)\T'*P);

end