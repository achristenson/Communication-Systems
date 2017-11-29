% Plotting the square root raised cosine function
T = 1;
t = linspace(-K*T,K*T,32*2*K);
a = 0;
K = 2;
A = 1;
SRRC = SRRC_impulse_response(a,K,T,t)