


C = [
    2,2;
    2,1;
    5,1;
    6,0];

a = C(1,1);
b = C(2,1);
c = C(3,1);
d = C(4,1);

Bezier.get3(C, 0.4)




[x, y] = Bezier.eval3(C, 100);

plot(x,y); hold on;


grid on;
hold off;