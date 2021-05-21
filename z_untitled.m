

r = load('ss60');

x = r.alc/1000.;
y = r.h/1000.;
sim('model_teste');

C = Bezier.fit(x, y, 3);

[xx, yy] = Bezier.eval(C, 100);

plot(xx,yy, 'linew', 2);
grid on;
axis equal;