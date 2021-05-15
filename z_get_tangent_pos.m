
% carregando trajetoria
clear;
r = load('ss60');

R  = table();
R.x = r.alc'/1000;
R.y = r.h'/1000;

rx = R.x;
ry = R.y;

C = Bezier.fit3(R.x, R.y);
[x, y] = Bezier.eval3(C, 100);

% PONTO ATUAL
Pi = [40, 20];

% encontrando pontos `x` e `y`
[xi, tx] = Bezier.get_x3_from_y(C, Pi(2));
[yi, ty] = Bezier.get_y3_from_x(C, Pi(1));

% escolhendo valores de busca
t1 = ty;
t2 = tx(end);

P1 = Bezier.get3(C, t1);
P2 = Bezier.get3(C, t2);

% busca ponto tangente
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
    kk = 10;
    xn = [pv(1), pv(1) + nx*kk];
    yn = [pv(2), pv(2) + ny*kk];

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

tint = t1 + (t2 - t1)*0.21;
P_1  = Bezier.get3(C, tint);

[tx, ty] = Bezier.tangent3(C, tint);

% calculando menor distancia
dP  = P_1 - Pi;
D   = hypot(dP(:,1), dP(:,2));

[~, di] = min(D);
Pmin = P_1(di, :);

% plot(rx, ry, 'linew', 2, 'display', 'rastreio');
figure(1);
clf();
hold on;

plot(x, y, 'linew', 2, 'display', 'bezier');

% plot ponto
plot(Pi(1), Pi(2), 'k.', 'markers', 20)

% plotando intersec
plot(P1(1), P1(2), 'r.', 'markers', 20);
plot(P2(1), P2(2), 'm.', 'markers', 20);

% plotando intemediario
% plot(P_1(:,1), P_1(:,2), 'k+', 'linew', 2, 'markers', 10);

% plotando distancia minima
plot(Pmin(:,1), Pmin(:,2), 'r.', 'linew', 2, 'markers', 30);

% plotando normal
plot(xn, yn, 'k', 'linew', 2);

% xlim([P1(1), P2(1)]);
% ylim([P2(2), P1(2)]);

hold off;
grid on;
legend();
axis equal;