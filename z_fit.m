
% carregando trajetoria
r = load('ss60');

R  = table();
R.x = r.alc'/1000;
R.y = r.h'/1000;

% R = R(R.x > 30, :);

C = Bezier.fit3(R.x, R.y);
% C(1,:) = [R.x(1), R.y(1)];
% C(end,:) = [R.x(end), R.y(end)];

[x, y] = Bezier.eval3(C, 100);

% curvature
nn = 200;
[xx, yy] = Bezier.eval3(C, nn);
[nx, ny] = Bezier.normal3(C, nn);
k        = Bezier.curvature3(C, nn)*100;
nx       = -nx.*k;
ny       = -ny.*k;

plot(R.x, R.y)
hold on;

plot(x, y)

for i = 1:nn
    xx_ = [xx(i), xx(i) + nx(i)];
    yy_ = [yy(i), yy(i) + ny(i)];
    
    plot(xx_, yy_, 'color', '#7AA721');
end

hold off;
grid on;