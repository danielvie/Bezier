

C = [
    2,2;
    2,1;
    5,1;
    6,0];

N = 100;
[x, y] = Bezier.eval3(C, N);

Coff = Bezier.offset3(C, -0.1);

[x2, y2] = Bezier.eval3(Coff, N);

plot(x,y);
hold on;



plot(C(:,1), C(:,2), '.', 'color', '#007ED1', 'markersize', 20);


plot(x2,y2);
plot(Coff(:,1), Coff(:,2), '.', 'color', '#D15300', 'markersize', 20);

hold off;
grid on;
axis equal;