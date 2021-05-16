
P = [
    0,0;
    2,1;
    5,1;
    6,0];

[x, y] = Bezier.eval_n(P,100);

plot(x,y, 'linew', 2); hold on;
plot(P(:,1), P(:,2), 'o');

hold off;
grid on;