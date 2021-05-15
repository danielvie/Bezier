
C = [
    2,2;
    2,1;
    5,.1;
    6,0];

% get y from x
x = 4.0;
y = Bezier.get_y3_from_x(C, x);


% get x from y
y = 2.1;
x = Bezier.get_x3_from_y(C, y);


[x, y] = Bezier.eval3(C, 1000);

plot(x,y); hold on;

plot(C(:,1), C(:,2), 'k.', 'markers', 25);

V = 6:0.1:10;
for i = 1:numel(V)
    xi = V(i);
    yi = Bezier.get_y3_from_x(C, xi);
    
    plot(xi, yi, 'o');
end

axis equal;
grid on;
hold off;