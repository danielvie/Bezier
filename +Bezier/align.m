function [Ca, T, R] = align(C)
    
    % translacao
    T   = -C(1,:);
    Ca  = C + T;
    
    % rotacao
    R  = atan2(Ca(end,2), Ca(end,1));
    Ca = Ca*[cos(R), -sin(R);sin(R), cos(R)];

end