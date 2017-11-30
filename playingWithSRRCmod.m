finalProject

close all

sum = zeros(1,(length(b)*T+2*K*T)*32);

amp = 2*b-1;

for i=0:length(b)-1

    y = zeros(1,(length(b)*T+2*K*T)*32);

    y(1+(i*T)*32:(2*K*T+i*T)*32) = amp(i+1)*pulse_SRRC;
    
    sum = sum + y;
end

t5 = linspace(-K*T, length(b)*T+2*K*T, length(y))
figure
plot(t5,sum)