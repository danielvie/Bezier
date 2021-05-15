


y0 = 0;

P = [110, y0 - 150;
      25, y0 - 190;
     210, y0 - 250;
     210, y0 - 30;   
];

[x, y] = Bezier.eval3(P, 100);
plot(x, y)

% aligning
C = Bezier.align(P);


hold on;
[x2, y2] = Bezier.eval3(C, 100);
plot(x2, y2)

hold off;