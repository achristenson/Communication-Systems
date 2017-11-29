function g1 = halfSineWave(T)
    % T - bit duration
    % b - bit stream
    t = linspace(0,T,32);
    g1 = sin(pi * t / T);

end