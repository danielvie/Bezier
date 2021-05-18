function Pi = get_p_from_t(C, t)

    [xi, yi] = Bezier.eval(C, t);    
    Pi = [xi, yi];
    
end