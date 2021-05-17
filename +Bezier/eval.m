function [x,y] = eval(C, N)

    % lendo matriz M
    n    = size(C,1)-1;
    M    = Bezier.get_m(n);
    
    % montando vetor de tempos
    T    = Bezier.get_T(N, n);
    
    % calculando pontos trajetoria
    P    = T*M*C;
        
    % lendo coordenadas `x`, `y`
    x    = P(:,1);
    y    = P(:,2);

end