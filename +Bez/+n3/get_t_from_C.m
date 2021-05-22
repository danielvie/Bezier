function [Ti, nroots] = get_t_from_C(C, vi, dire)
    
    % montando polinomio
    M  = Bez.get_M();
    
    P = M*C(:,dire);
    P(end) = P(end) - vi;
    
    % calculando raizes
    res = roots(P);
    
    % filtrando valores de `t` -> 0.0 < t < 1.0
    nroots = 0;
    Ti    = [-1, -1, -1];
    for i = 1:numel(res)
        if res(i) < 0.
            continue;
        end
        
        if res(i) > 1.
            continue;
        end

        if imag(res(i)) > 0.001
            continue;
        end
        
        nroots    = nroots + 1;
        Ti(nroots) = real(res(i));        
    end

    Ti(1:nroots) = sort(Ti(1:nroots));
end