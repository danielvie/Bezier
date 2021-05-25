

pos  = [-15090., 431., 7728.]/1000.;
posa = [-30898., 899., 1721.]/1000.;

px   = hypot(pos(1), pos(2));
py   = pos(3);

pxa  = hypot(posa(1), posa(2));
pya  = posa(3);

P    = [px, py];
Pa   = [pxa, pya];

vx   = 461.61/1000.;
vy   = 100.00/1000.;

% versor da velocidade
Vv    = [vx, vy] / hypot(vx, vy);

% distancia alvo 
d    = norm(posa - pos);
d3   = d*0.36;

% angulo alvo e velocidade
ang  = Bez.get_ang_vet(Pa-P, Vv);

% versor alvo -> posicao
Vap = (P-Pa) / norm(P-Pa);

% rotacao de `Vap` em `alpha`
Vap = Vap * [cos(ang), -sin(ang);sin(ang), cos(ang)];

C = [px, py;
     px + Vv(1)*d3, py + Vv(2)*d3;
     pxa + Vap(1)*d3, pya + Vap(2)*d3;
     pxa, pya;
    ];

% teste bezier
[x, y] = Bezier.eval(C, 100);

plot(x, y, 'linew', 2, 'color', CORES.AZUL);
hold on;

z_plot_curv(C, 50, 30);

plot(C(1,1), C(1,2), 'k.', 'markers', 30);
plot(C(2,1), C(2,2), '.', 'markers', 20);
plot(C(3,1), C(3,2), '.', 'markers', 20);
plot(C(4,1), C(4,2), 'r.', 'markers', 30);


axis equal;
hold off;
grid on;