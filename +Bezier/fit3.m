function C = fit3(x, y)
    
    % lendo nro de elementos
    N = numel(x);
    
    % lendo pontos
    P = [reshape(x, [N, 1]), reshape(y, [N, 1])];

    % montando T
    t = linspace(0,1, N)';
%     tt = zeros(N, 1);
%     for i = 2:N
%         tt(i) = tt(i-1) + norm([x(i) - x(i-1), y(i) - y(i-1)]);
%     end
%     
%     tt = tt / tt(end);
%     
%     t = tt;
    
    ONES = ones(N, 1);
    T = [t.^3, t.^2, t, ONES];

    % lendo M
    M = Bezier.get_m3();

    % calculando coeficientes
    C = M\((T'*T)\T'*P);

end