
% carregando trajetoria
clear;
r = load('ss60');

R  = table();
R.x = r.alc'/1000;
R.y = r.h'/1000;

% R  = R(R.x > 40, :);

rx = R.x;
ry = R.y;

% fit trajetoria
C = Bezier.fit(rx, ry, 3);
[bx, by] = Bezier.eval(C, 100);


% posicao corpo
pos = [40, 40];

% ponto de encontro
[pe, te] = Bezier.get_p_from_x(C, 55);
ex = pe(1);
ey = pe(2);

% tangente ponto de encontro
[tx, ty] = Bezier.tangent(C, te);
k = 5;
tx = tx*k;
ty = ty*k;

% gerando trajetoria de conexao
[p_, t_] = Bezier.get_p_from_x(C, pos(1));
[tx1, ty1] = Bezier.tangent(C, t_);
k1 = 5;

P_ = [
    pos(1), pos(2);
    pos(1) + tx1*k1, pos(2) + ty1*k1;
    ex - tx, ey - ty;
    ex, ey;
    ];

[x_, y_] = Bezier.eval(P_, 100);

% plot(rx, ry, 'linew', 2); hold on;
plot(bx, by, 'linew', 2); hold on;
grid on;

% plot posicao corpo
plot(pos(1), pos(2), '.', 'color', 'k', 'markers', 20);

% plot ponto de encontro
plot(ex, ey, '.', 'color', '#7AA721', 'markers', 20);

% plot tangente
plot([ex, ex + tx], [ey, ey + ty], 'color', '#7AA721', 'linew', 2);

% plot traj_
plot(x_, y_, 'linew', 2);

plot(P_(:,1), P_(:,2), '.r', 'markers', 25);

hold off;
axis equal;