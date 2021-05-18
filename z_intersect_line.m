
L = [
    0, 0.1;
    6, 0.7;
];

graf(L);

function update(~, event)

    % lendo valor de `L`
    L = evalin('caller', 'L');
    
    % lendo ponto do clique do mouse
    P = event.IntersectionPoint(1:2);

    % se botao esq -> atualiza ponto esq, 
    % se botao dir -> atualiza ponto dir, 
    if event.Button == 1
        L(1,:) = P;
    elseif event.Button == 3
        L(2,:) = P;
    end
    
    % atualizando valor de `L` na funcao principal
    assignin('caller', 'L', L);
    
    % atualizando grafico;
    graf(L);
end

function graf(L)
    C = [
        0,0;
        2,1;
        5,1;
        6,0];

    [x, y] = Bezier.eval(C, 100);

    [lx, ly] = Bezier.eval(L, 10);

    [~, R, T] = Bezier.align(L);
    C_ = align_apply(C, R, T);

    zer = get_zeros(C_);

    [xi, yi] = Bezier.eval(C, zer);

    h = plot(x,y, 'linew', 2);hold on;
    plot(lx,ly, 'linew', 2);

    plot(xi, yi, 'r.', 'markers', 30);

    hold off;
    grid on;
    
    h.Parent.Parent.Children.ButtonDownFcn = @update;
%     fig = h.Parent.Parent.Children;
end

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