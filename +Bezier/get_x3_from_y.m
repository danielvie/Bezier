function [y, Ti] = get_x3_from_y(C, yi)

    Ti = Bezier.get_t3(C, yi, 2);
    
    % calculando y
    y = Bezier.get3(C, Ti)*[1; 0];
    
end