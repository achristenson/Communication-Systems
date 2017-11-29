% Plotting the half sine wave in the time and frequency domains
T = 1;
t = linspace(0,T,32);
% b = bitstream


pulse_HS = halfSineWave(T);

figure
plot(t, pulse)

figure
freqz(pulse)