
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
[xi, t1] = Bezier.get_x3_from_y(C, Pi(2));
[yi, t2] = Bezier.get_y3_from_x(C, Pi(1));

% plot(rx, ry, 'linew', 2, 'display', 'rastreio');
figure(1);
clf();
hold on;

plot(x, y, 'linew', 2, 'display', 'bezier');

% plot ponto
plot(Pi(1), Pi(2), 'k.', 'markers', 20)

% plotando intersec
plot(Pi(1), yi, 'r.', 'markers', 20);
plot(xi(2), Pi(2), 'm.', 'markers', 20);

hold off;
grid on;
legend();
axis equal;