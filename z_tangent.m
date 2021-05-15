P = [
    0,0;
    2,2.0;
    5,3.0;
    6,0];


N = 100;
[x, y] = Bezier.eval3(P,N);


plot(x,y, 'linew', 2); hold on;
plot(P(:,1), P(:,2), 'o');

% plot marcadores
P_ = [P;P(1,:)];
plot(P(:,1), P(:,2), 'k.', 'markersize', 20);
% plot(P_(:,1), P_(:,2), 'k--');

% plot vetores tangente
[xx, yy] = Bezier.eval3(P, 10);
[tx, ty] = Bezier.tangent3(P, 10);
[nx, ny] = Bezier.normal3(P, 10);

for i = 1:numel(tx)
    tx_ = [xx(i), xx(i) + tx(i)];
    ty_ = [yy(i), yy(i) + ty(i)];
    
    nx_ = [xx(i), xx(i) + nx(i)];
    ny_ = [yy(i), yy(i) + ny(i)];
    
    plot(tx_, ty_, 'green', 'linew', 2);
    plot(nx_, ny_, 'blue', 'linew', 2);
end

axis equal
hold off;
grid on;