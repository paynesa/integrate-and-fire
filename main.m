%% This is the code in which the main computations are called

%% 3.3: We choose i_e = 5*10^-9 amperes and model a few spikes:
%set the relevant time increments
delta_t = 0.0001; %Seconds 
total_time = 0.02; %Seconds
%now, create the vector for values of I_e, which we hold constant here
I_e = zeros(total_time/delta_t, 1);
for i = 1:(total_time/delta_t)
    I_e(i) = 5*10^-9;
end 
% call our helper function to populate the arrays and count the spikes 
[x, y, spikes] = integrate_and_fire(I_e, delta_t, total_time);
% finally, plot the results using our plotting helper function
plot_helper(x, y, '3.3: Spikes when I_e = 5*10^{-9} Amperes');

%% 3.4 We compare the number of spikes to the values of I_e:
total_time = 1;
values_of_I_e = zeros(100,1);
firing_rates = zeros(100, 1);
val = 0;
for i = 1:100
    values_of_I_e(i) = val;
    I_e = zeros(total_time/delta_t, 1);
    for j = 1:(total_time/delta_t)
        I_e(j) = val;
    end 
    val = val + 5*10^-10;
    [x, y, spikes] = integrate_and_fire(I_e, delta_t, total_time);
    firing_rates(i) = spikes;
end
plot(values_of_I_e, firing_rates, '.-k', LineWidth=2, MarkerSize=10);
text(1.5*10^-9, 350, {'Intercept:', '1.5*10^{-9}','\downarrow'}, FontSize=16);
xlabel('Value of I_e (Amperes)', FontSize=16);
ylabel('Firing Rate (Hertz)', FontSize=16);
title('Relationship between I_e and Firing Rate', FontSize=20)

