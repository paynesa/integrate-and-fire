I_e = 5*10^-9; %Amperes
delta_t = 0.0001; %Seconds 

[x, y] = integrate_and_fire(I_e, delta_t, 0.01);
plot(x, y)