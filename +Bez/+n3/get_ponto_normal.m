function [Pi, ti, Ni, dist, TANG] = get_ponto_normal(C, P)
    % ENCONTRANDO INTERVALO DE BUSCA
    N  = 10;
    tt = linspace(0,1,N);
    
    dmin   = 1e7;
    idxmin = -1;
    
    for i = 1:N
        Paux = Bez.n3.get_P_from_t(C, tt(i));
        dist = norm(P - Paux);
        if dist < dmin
            dmin   = dist;
            idxmin = i;
        end
    end
    
    if idxmin == 1
        idxmin = idxmin + 1;
    elseif idxmin == N
        idxmin = idxmin - 1;
    end
    
    
    % BUSCA
    a = tt(idxmin-1);
    b = tt(idxmin+1);

    for i = 1:15
        t    = 0.5*(a+b);
        Pi   = Bez.n3.get_P_from_t(C, t);
        
        [nx, ny] = Bez.n3.get_normal(C, t);
        
        % calculando angulo vetor
        v1  = [nx, ny];
        v2  = P - Pi;
        ang = Bez.get_ang_vet(v1, v2);

        % criterio de saida
        if abs(ang) < 0.001
            break;
        end
        
        % ajuste intervalo
        if ang > 0
            a = t;
        else
            b = t;
        end
    end
    
    Ni   = [nx, ny];
    ti   = t;
    dist = norm(P - Pi);
    TANG = [-ny, nx];
    
    % ajuste angulo `dist`
    v1  = [nx, ny];
    v2  = P - Pi;
    ang = abs(Bez.get_ang_vet(v1, v2));
    if ang > pi/2
        dist = -dist;
    end
        
end