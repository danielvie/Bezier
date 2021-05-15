P = [
    0,0;
    2,1;
    5,1;
    6,0];

N = 100;
[x, y]   = Bezier.eval3(P, N);

plot(x,y, 'linew', 2); hold on;


N_ = 50;
[xx, yy] = Bezier.eval3(P, N_);
[nx, ny] = Bezier.normal3(P, N_);

k = -Bezier.curvature3(P, N_);
nx = nx.*k;
ny = ny.*k;

for i = 1:numel(nx)
    xx_ = [xx(i), xx(i) + nx(i)];
    yy_ = [yy(i), yy(i) + ny(i)];
    plot(xx_,yy_, 'color', '#7AA721', 'linew', 2);
end

plot(P(:,1), P(:,2), 'k.', 'markersize', 20);

axis equal;
hold off;
grid on;