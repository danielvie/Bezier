function [x,y] = eval(P, N)

    % lendo matriz M
    n    = size(P,1)-1;
    M    = Bezier.get_m(n);
    
    % montando vetor de tempos
    T    = Bezier.get_T(N, n);
    
    % calculando pontos trajetoria
    V    = T*M*P;
    
    % lendo coordenadas `x`, `y`
    x    = V(:,1);
    y    = V(:,2);

end