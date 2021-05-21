
% carregando trajetoria
r = load('ss60');

R  = table();
R.x = r.alc'/1000;
R.y = r.h'/1000;

% R = R(R.x > 30, :);

rx = R.x;
ry = R.y;

C = Bezier.fit(rx, ry, 5);

[x, y] = Bezier.eval(C, 100);

% curvature
nn = 200;
[xx, yy] = Bezier.eval(C, nn);
[nx, ny] = Bezier.normal(C, nn);
% [nx, ny] = Bezier.normal3(C, nn);
k        = Bezier.curvature(C, nn)*100;
% k        = 10;
nx       = nx.*k;
ny       = ny.*k;

plot(rx, ry, 'linew', 2);
hold on;

plot(x, y, 'linew', 2)

for i = 1:nn
    xx_ = [xx(i), xx(i) + nx(i)];
    yy_ = [yy(i), yy(i) + ny(i)];
    
    plot(xx_, yy_, 'color', '#7AA721');
end

hold off;
grid on;