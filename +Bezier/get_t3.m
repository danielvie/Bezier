function T = get_t3(C, vi, dire)
    
    % montando polinomio
    p1 =   -C(1,dire) + 3*C(2,dire) - 3*C(3,dire) + C(4,dire);
    p2 =  3*C(1,dire) - 6*C(2,dire) + 3*C(3,dire);
    p3 = -3*C(1,dire) + 3*C(2,dire);
    p4 =    C(1,dire);

    P = [p1, p2, p3, p4 - vi];

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