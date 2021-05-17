function [Pi, Ti] = get_p_from_y(C, yi)

    Ti = Bezier.get_t_from_C(C, yi, 2);
    
    % calculando y
    [xi, pi] = Bezier.eval(C, Ti);
    Pi = [xi, pi];    
end