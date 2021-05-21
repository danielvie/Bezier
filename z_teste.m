
C = [
    0,0;
    2,1;
    5,1;
    6,0];

[x, y] = Bezier.eval(C,100);

[xi, yi] = Bezier.eval(C, 1);
[tx, ty] = Bezier.normal(C, 1);
k = Bezier.curvature(C, 1);

plot(x,y, 'linew', 2); hold on;
plot(C(:,1), C(:,2), 'o');

plot(xi, yi, 'ro', 'linew', 2);
plot([xi, xi + tx], [yi, yi + ty]);

hold off;
grid on;
axis equal
