function [Pi, Ti] = get_p_from_y3(C, yi)

    Ti = Bezier.get_t_from_C3(C, yi, 2);
    
    % calculando y
    Pi = Bezier.get3(C, Ti);
    
end