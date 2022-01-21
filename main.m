%% This is the code in which the main computations are called

I_e = 5*10^-9; %Amperes
delta_t = 0.0001; %Seconds 
total_time = 0.01; %Seconds

[x, y] = integrate_and_fire(I_e, delta_t, total_time);
plot_helper(x, y, 'Title');
