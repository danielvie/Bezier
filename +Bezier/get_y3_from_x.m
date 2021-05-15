function [y, Ti] = get_y3_from_x(C, xi)

    Ti = Bezier.get_t3(C, xi, 1);
    
    % calculando y
    y = Bezier.get3(C, Ti)*[0; 1];
    
end