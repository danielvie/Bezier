function P = get_P_from_t(C, t)

    % lendo matriz M
    M    = Bez.get_M();
    
    % montando vetor de tempos
    T    = Bez.get_T(t);
    
    % calculando pontos trajetoria
    P    = T*M*C;
    
end