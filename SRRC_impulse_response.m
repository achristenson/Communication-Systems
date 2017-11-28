function g2 = SRRC_impulse_response(A, a, K, T, t)
    %   A - normalization factor to make energy of SRRC same as that of
    %   half-sine pulse
    %   a - roll-off factor
    %   K - truncation length
    %   T - bit duration
    %   t - time vector
    x = zeros(1, length(t));
    for i=1:length(t)
        
        if t == 0
           x(i) = 1 - a + 4*a/pi;
           
        elseif (t == T/(4*a)) || (t == -T/(4*a))
            x(i) = (a/sqrt(2)) * (  (1+2/pi) * sin(pi/(4*a)) + (1-2/pi)*cos(pi/(4*a))  );
        else
            x(i) = ( sin(pi*(t/T)*(1-a)) + 4*a*(t/T)*cos(pi*(t/T)*(1+a)) )  / ((pi*t/T)* ( 1 - (4*a*t/T)^2));
        end

    end
    
    g2 = A * x; %for b=1
    if b == 0
        g2 = (-1)*g2;
    end
    
    % -KT <= t <= KT
    g2(t < -K*T) = 0;
    g2(t > K*T) = 0;
    
end