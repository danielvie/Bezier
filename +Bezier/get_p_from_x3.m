function [Pi, Ti] = get_p_from_x3(C, xi)

    Ti = Bezier.get_t_from_C3(C, xi, 1);
    
    % calculando y
    Pi = Bezier.get3(C, Ti);
    
end