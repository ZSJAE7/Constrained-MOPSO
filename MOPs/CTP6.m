function [z, v] = CTP6(x)

    n = numel(x);
    
    z1 = x(1);
   
    g = 1 + 9 * (sum(x(2 : end)) / (n - 1))^0.25;
%     g = 1 + sum(x(2 : end));
%     g = 1 + 0.2 * sum(x(2 : end));
%     g = 1 + sum(x(2 : end).^2);
%     g = 1 + sum(  x(2 : end).^0.25);
    
    z2 = g * (1 - z1 / g);
    
    z = [z1 z2]';
    
    theta = 0.1 * pi; a = 40; 
    
    b = 0.5; c = 1; d = 2; e = -2;
    
    v = cos(theta) * (z2 - e) - sin(theta) * z1 - ...
        a * abs(sin(b * pi * (sin(theta) * (z2 - e) + cos(theta) * z1)^c))^d;
    
    v = -v;
    
    v = max(v, 0);
   
end