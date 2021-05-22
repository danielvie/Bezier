function [Pi, ti, Ni] = get_ponto_normal(C, P)
    % BUSCA
    a = 0.0;
    b = 1.0;

    for i = 1:15
        t    = 0.5*(a+b);
        Pi   = Bez.get_P_from_t(C, t);
        
        [nx, ny] = Bez.get_normal(C, t);
        
        % calculando angulo vetor
        v1  = P - Pi;
        v2  = [nx, ny];
        ang = get_ang_vet(v1, v2);

        % criterio de saida
        if abs(ang) < 0.5
            break;
        end
        
        % ajuste intervalo
        if ang > 0
            a = t;
        else
            b = t;
        end
    end
    
    Ni = [nx, ny];
    ti = t;
end