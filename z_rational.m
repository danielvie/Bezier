

C = [
    1,1;
    2,2;
    3,1;    
    ];

CC = [C;C(1,:)];

[x,y] = Bezier.eval(C, 100);

r = [1,-0.5,1];
[xx_,yy_] = rbez2(C, r);

plot(C(:,1), C(:,2), 'ko', 'linew', 2); 
hold on;
plot(CC(:,1), CC(:,2), 'k--');

plot(x, y, 'linew', 2, 'color', CORES.AZUL);
plot(xx_, yy_, 'linew', 2, 'color', CORES.VERDE);
hold off;
grid on;
axis equal;

function [x, y] = rbez2(C, r)

    N  = 100;
    t  = linspace(0,1, N)';

    T  = [t.^2, t, ones(N,1)];
    M  = Bezier.get_m(2);
    
    W  = T*M*diag(r);
    d  = sum(W,2);
    
    P  = W*C./d;
    
    x = P(:,1);
    y = P(:,2);

end

% function [x,y] = rbez2(C, r)
%     N = 100;
%     
%     t = linspace(0,1., N);
%     x = zeros(N,1);
%     y = zeros(N,1);
%     for i = 1:N
%         [xi, yi] = rbez2_(C, t(i), r);
%         x(i) = xi;
%         y(i) = yi;
%     end
% end

% function [x,y] = rbez2_(C, t, r)
% 
%     mt  = 1-t;
%     
%     % 1*(1-t)^2*P0 + 2*(1-t)*t*P1 + 1*t*t*P2
%     f1  = mt*mt*r(1);
%     f2  = 2*mt*t*r(2);
%     f3  = t*t*r(3);
%     
%     d = f1 + f2 + f3;
%         
%     x = (f1 * C(1,1) + f2 * C(2,1) + f3 * C(3,1))/d;
%     y = (f1 * C(1,2) + f2 * C(2,2) + f3 * C(3,2))/d;
% 
% end

% function [x,y] = rbez2_(P, t, w, r)
% 
%     mt  = 1-t;
%     
%     % 1*(1-t)^2*P0 + 2*(1-t)*t*P1 + 1*t*t*P2
%     f1  = r(1);
%     f2  = r(2);
%     f3  = r(3);
%     
%     % spec for linear
%     f1 = f1 * mt;
%     f2 = f2 * t;
%     
%     % upgrade to quadratic
%     f1 = f1*mt;
%     f2 = f2*2*mt;
%     f3 = f3*t*t;
%     
%     d = f1 + f2 + f3;
%     
%     x = (f1 * P(1,1) + f2 * P(2,1) + f3 * P(3,1))/d;
%     y = (f1 * P(1,2) + f2 * P(2,2) + f3 * P(3,2))/d;
% 
% end