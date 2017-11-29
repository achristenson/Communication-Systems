function x = SRRC_x(a, t, T)
% function x = SRRC_x(a, t, T)
% Inputs:
% alpha = roll off
% t = time vector
% T = bit duration
% Outputs:
% x = x values for finding SRRC without scaling

% Initialize x vector
x = zeros(1, length(t));

% Iterate through time to solve exceptions
x(t==0) = 1 - a + 4*a/pi;
for j=1:length(t)
    i = t(j); 
%         Exception 1
    if i == 0
       x(j) = 1 - a + 4*a/pi;  
%         Exception 2
    elseif (i == T/(4*a)) || (i == -T/(4*a))
        x(j) = (a/sqrt(2)) * ((1+2/pi)*sin(pi/(4*a)) + (1-2/pi)*cos(pi/(4*a)));
%         Base case
    else
        x(j) = ( sin(pi*(i/T)*(1-a)) + 4*a*(i/T)*cos(pi*(i/T)*(1+a)) )  / ((pi*i/T)* (1-(4*a*i/T)^2));
    end
end

return