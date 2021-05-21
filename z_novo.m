

P = [
    0,0;
    7,13;
    23, 29;
    31, 33;
    31, 33;
    ];


C = Bezier.fit(P(:,1), P(:,2), 3);

[x_, y_] = Bezier.eval(C, 10);
k        = -Bezier.curvature(C, 10);
[tx, ty] = Bezier.normal(C, 10, 20);
tx = tx.*k;
ty = ty.*k;

[x, y] = Bezier.eval(C, 100);

plot(P(:,1), P(:,2), 'ko', 'linew', 2);

hold on;

plot(x, y, 'linew', 2);

for i = 1:10
    plot([x_(i),x_(i) + tx(i)], [y_(i),y_(i) + ty(i)], 'linew', 2);
end

hold off;
grid on;