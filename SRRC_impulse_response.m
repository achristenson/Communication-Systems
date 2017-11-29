function g2 = SRRC_impulse_response(a, K, T, t)
    %   a - roll-off factor
    %   K - truncation length
    %   T - bit duration
    %   t - time vector
    
    % Initialize the x vector
    x = zeros(1, length(t));
    
    % Iterate through all of the times to be able to handle exceptions
    for i=1:length(t)
%         Exception 1
        if t == 0
           x(i) = 1 - a + 4*a/pi;  
%         Exception 2
        elseif (t == T/(4*a)) || (t == -T/(4*a))
            x(i) = (a/sqrt(2)) * (  (1+2/pi) * sin(pi/(4*a)) + (1-2/pi)*cos(pi/(4*a))  );
%         Base case
        else
            x(i) = ( sin(pi*(t/T)*(1-a)) + 4*a*(t/T)*cos(pi*(t/T)*(1+a)) )  / ((pi*t/T)* ( 1 - (4*a*t/T)^2));
        end
    end
    
%     Energy of half sine wave
    E_HS = sum(halfSineWave(t,T,1).^2);
    
%     Energy of SRRC
    E_SRRRC = sum(x.^2);
    
    % Normalization factor for pulse amplitude
    A = sqrt(E_HS/E_SRRC);
    
    g2 = A*x;
end