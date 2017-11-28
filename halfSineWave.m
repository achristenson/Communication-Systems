function g1 = halfSineWave(t, T, b)
    % t - time vector
    % T - bit duration
    % b - bit value (1 or 0)
    
    g1 = sin(pi * t / T);
    if b == 0
       g1 = (-1) * g1; 
    end
    
    %0 <= t <= T
    g1(t < 0) = 0;
    g1(t > T) = 0;
    
end