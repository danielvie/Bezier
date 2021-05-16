
C = [
    2,2;
    2,1;
    5,.1;
    6,2];

% get y from x
xi = 5.2;
Pi = Bezier.get_p_from_x3(C, xi);

yii = 1.5;
Pii = Bezier.get_p_from_y3(C, yii);


[x, y] = Bezier.eval3(C, 1000);

plot(x,y); hold on;

plot(Pi(:,1), Pi(:,2), 'r.', 'markers', 25);
plot(Pii(:,1), Pii(:,2), 'g.', 'markers', 25);

plot(C(:,1), C(:,2), 'k.', 'markers', 25);


axis equal;
grid on;
hold off;