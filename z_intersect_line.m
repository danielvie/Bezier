
C = [
    0,0;
    2,1;
    5,1;
    6,0];

[x, y] = Bezier.eval(C, 100);

L = [
    0, 0.1;
    6, 0.7;
];

[lx, ly] = Bezier.eval(L, 10);

[~, R, T] = Bezier.align(L);
C_ = align_apply(C, R, T);

zer = get_zeros(C_);



[x_, y_] = Bezier.eval(C_, 100);
[xi, yi] = Bezier.eval(C, zer);


plot(x,y, 'linew', 2);hold on;
plot(lx,ly, 'linew', 2);


plot(xi, yi, 'r.', 'markers', 30);

hold off;
grid on;

function T = get_zeros(C)
    
    n = size(C,1)-1;
    
    M = Bezier.get_m(n);
    
    P   = M*C(:,2);
    res = roots(P);
    
    % filtrando valores de `t` -> 0.0 < t < 1.0
    cont = 0;
    T    = zeros(numel(res), 1);
    for i = 1:numel(res)
        if res(i) < 0.
            continue;
        end
        
        if res(i) > 1.
            continue;
        end

        cont    = cont + 1;
        T(cont) = norm(res(i));        
    end

    T = sort(T(1:cont));
end

function Ca = align_apply(C, R, T)
    Ca = C - T;
    Ca = Ca*[cos(R), -sin(R); sin(R) cos(R)];
end