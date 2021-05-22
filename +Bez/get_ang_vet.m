function a = get_ang_vet(v1, v2)
    
    % angulo em graus
    a = acos(dot(v1,v2)/norm(v1)/norm(v2));
    
    % sinal do angulo
    if (v1(1)*v2(2) - v2(1)*v1(2) < 0)
        a = -a;
    end
    
end