function [Pi, Ti] = get_p_from_x(C, xi)

    Ti = Bezier.get_t_from_C(C, xi, 1);
    
    % calculando y
    [xi, pi] = Bezier.eval(C, Ti);
    Pi = [xi, pi];
end