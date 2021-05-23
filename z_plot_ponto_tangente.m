function z_plot_ponto_tangente(C, P)
    if ~exist('C', 'var')
        C = [
            0,0;
            3,3;
            5.5,5;
            6,0];
    end
    
    if ~exist('P', 'var')
        P = [5.4, -2];
    end

    graf(C, P);
    
end


function graf(C, P)
    [bx, by] = Bezier.eval(C, 100);
    clf();
    hold on;
    
    [Pi, ~, Ni, dist, TANG] = Bez.n3.get_ponto_normal(C, P);
    
    tx = TANG(1);
    ty = TANG(2);
    
    nx = Ni(1)*dist;
    ny = Ni(2)*dist;
    
    h = plot(bx, by, 'linew', 2, 'color', CORES.AZUL);
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
end