
P = [
    0,0;
    2,1;
    5,1;
    6,0];

[x, y] = Bezier.eval(P,100);

[xi, yi] = Bezier.eval(P, 1);
[tx, ty] = Bezier.normal(P, 1);
k = Bezier.curvature(P, 1);

plot(x,y, 'linew', 2); hold on;
plot(P(:,1), P(:,2), 'o');

plot(xi, yi, 'ro', 'linew', 2);
plot([xi, xi + tx], [yi, yi + ty]);

hold off;
grid on;
axis equal
