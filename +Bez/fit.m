function C = fit(x, y)
    
    % lendo nro de elementos
    N = numel(x);
    
    % lendo pontos
    P = [reshape(x, [N, 1]), reshape(y, [N, 1])];

    % montando T
    t = linspace(0,1,N);
    T = Bez.get_T(t);

    % lendo M
    M = Bez.get_M();

    % calculando coeficientes
    C = M\((T'*T)\T'*P);
    
end