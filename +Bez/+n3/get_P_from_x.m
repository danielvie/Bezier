function [Pi, n, Ti] = get_P_from_x(C, xi)

    % lendo valor de `T`
    [Ti, n] = Bez.n3.get_t_from_C(C, xi, 1);
    
    % calculando y
    Pi = Bez.n3.get_P_from_t(C, Ti);   
    
    % zerando termos que nao sao solucao
    if n < 3
        Pi(n+1:end, :) = 0.0;
    end
    
end