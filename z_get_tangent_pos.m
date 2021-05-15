
% carregando trajetoria
clear;
r = load('ss60');

R  = table();
R.x = r.alc'/1000;
R.y = r.h'/1000;

% R  = R(R.x > 40, :);

rx = R.x;
ry = R.y;


graf(rx, ry, 48.9, 27.2);

function graf(rx, ry, xi, yi)
    fig = figure(1);
    C = Bezier.fit3(rx, ry);
    [x, y] = Bezier.eval3(C, 100);

    % PONTO ATUAL
    Pi = [xi, yi];

    % encontrando pontos `x` e `y`
    [xi_, tx] = Bezier.get_x3_from_y(C, Pi(2));
    [~  , ty] = Bezier.get_y3_from_x(C, Pi(1));

    % identificando se estou abaixo ou a acima da curva
    acima = 1;
    if xi_(end) > xi
        acima = 0;
    end
    
    % escolhendo valores de busca
    t1 = ty(1);
    t2 = tx(end);
%     t1 = tx(1);
%     t2 = tx(end);

    P1 = Bezier.get3(C, t1);
    P2 = Bezier.get3(C, t2);

    % busca bin. ponto tangente
    a = t1;
    b = t2;
    for i = 1:10
        % gerando chute
        v = 0.5*(a+b);

        % EVAL

        % calculando ponto
        pv = Bezier.get3(C, v);

        % gerando vetor normal
        [nx, ny] = Bezier.normal3(C, v);
        tx = -ny;
        ty = nx;
        
        if acima
            nx = -nx;
            ny = -ny;
        end        
        
        % calculando angulo
        v1  = [nx, ny];
        v2  = Pi - pv;
        ang = get_ang_vet(v1, v2);

        % condicao de saida
        if abs(ang) < 0.5
            break;
        end

        % atualizacao valores
        if ang > 0
            b = v;
        else
            a = v;
        end
    end

    clf();
    hold on;

%     plot(rx, ry, 'linew', 2, 'display', 'rastreio');
    plot(x, y, 'linew', 2, 'display', 'bezier');

    % plot ponto
    plot(Pi(1), Pi(2), 'k.', 'markers', 20)

    % plotando intersec
    plot(P1(1), P1(2), 'r.', 'markers', 20);
    plot(P2(1), P2(2), 'r.', 'markers', 20);

    % plotando intemediario
    % plot(P_1(:,1), P_1(:,2), 'k+', 'linew', 2, 'markers', 10);

    % plotando distancia minima
    plot(pv(1), pv(2), 'r.', 'linew', 2, 'markers', 30);

    dist = norm(pv - Pi);
    plot([pv(1), pv(1) + nx*dist], [pv(2), pv(2) + ny*dist], 'r', 'linew', 2);

    % plotando tangente
    plot([pv(1), pv(1) + tx*dist/2], [pv(2), pv(2) + ty*dist/2], 'color', '#7AA721', 'linew', 2);
    
    hold off;
    grid on;
    legend();
    axis equal;
    
    title(sprintf('xi: %.1f, yi: %.1f', xi, yi));
    set(fig.Children(2), 'ButtonDownFcn', @teste);
end

function teste(a, event)
    xi = event.IntersectionPoint(1);
    yi = event.IntersectionPoint(2);
    
    rx = evalin('base', 'rx');
    ry = evalin('base', 'ry');
    
    graf(rx, ry, xi, yi);
end