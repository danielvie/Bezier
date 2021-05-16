function T = get_t_from_C3(C, vi, dire)
    
    % montando polinomio
    M  = Bezier.get_m3();
    
    P = M*C(:,dire);
    P(end) = P(end) - vi;
    
    % calculando raizes
    res = roots(P);
    
    % filtrando valores de `t` -> 0.0 < t < 1.0
    cont = 0;
    T    = zeros(numel(res), 1);
    for i = 1:numel(res)
        if res(i) < 0.
            continue;
        end
        
        if res(i) > 1.
            continue;
        end

        cont    = cont + 1;
        T(cont) = norm(res(i));        
    end

    T = sort(T(1:cont));
end