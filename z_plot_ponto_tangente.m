
C = [
    0,0;
    3,3;
    5.5,5;
    6,0];

P = [4.5, 0.1];

graf(C, P);

function [Pi, N, ti] = busca_p_tangente(C, P)

    % ENCONTRANDO INTERVALO DE BUSCA
    

    % BUSCA
    a = 0.0;
    b = 1.0;

    for i = 1:15
        t    = 0.5*(a+b);
        Pi   = Bez.n3.get_P_from_t(C, t);
        dist = norm(P - Pi);

        [nx, ny] = Bezier.normal(C, t, dist);

        % calculando angulo vetor
        v1  = [nx, ny];
        v2  = P - Pi;
        ang = Bez.get_ang_vet(v1, v2);

        % criterio de saida
        if abs(ang) < 0.01
            break;
        end
        
        % ajuste intervalo
        if ang > 0
            a = t;
        else
            b = t;
        end
    end
    
    N  = [nx, ny];
    ti = t;
end

function graf(C, P)
    [bx, by] = Bezier.eval(C, 100);

    [Pi, N, ti] = busca_p_tangente(C, P);
    [tx, ty]    = Bezier.tangent(C, ti);
    
    if abs(Bez.get_ang_vet(N, P-Pi)) > 1.0
        N = -N;
    end
    
    nx = N(1);
    ny = N(2);
    
    h = plot(bx, by, 'linew', 2);
    hold on;
    
    plot(P(1), P(2), 'k.', 'markers', 25);

    plot(Pi(1), Pi(2), '.', 'markers', 25, 'color', CORES.LARANJA);
    plot([Pi(1), Pi(1) + nx], [Pi(2), Pi(2) + ny], 'linew', 2, 'color', CORES.LARANJA);
    plot([Pi(1), Pi(1) + tx], [Pi(2), Pi(2) + ty], 'linew', 2, 'color', CORES.VERDE);
    
    grid on;
    axis equal    
    hold off;
    
    txt = sprintf('P: [%.1f, %.1f], Pi: [%.1f, %.1f]', P(1), P(2), Pi(1), Pi(2));
    title(txt);
    
    h.Parent.ButtonDownFcn = @(ax, event) update(ax, event, C);
end

function update(~, event, C)
    P = event.IntersectionPoint(1:2);
    
    graf(C, P);
end