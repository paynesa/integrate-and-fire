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
total_time = 1; % we compare firing rates over 1 second 
values_of_I_e = zeros(100,1); 
firing_rates = zeros(100, 1);
val = 0; 
% we will test 100 values of I_e starting at 0 and going in increments of 5*10^-10
for i = 1:100
    values_of_I_e(i) = val;
    %make the vector for I_e to pass into the helper
    I_e = zeros(total_time/delta_t, 1); 
    for j = 1:(total_time/delta_t)
        I_e(j) = val;
    end 
    %increment the vlaue of I_e
    val = val + 5*10^-10;
    %run the model and record the number of spikes
    [x, y, spikes] = integrate_and_fire(I_e, delta_t, total_time);
    firing_rates(i) = spikes;
end
% plot the results 
plot(values_of_I_e, firing_rates, '.-k', LineWidth=2, MarkerSize=10);
text(1.5*10^-9, 350, {'Intercept:', '1.5*10^{-9}','\downarrow'}, FontSize=16);
xlabel('Value of I_e (Amperes)', FontSize=16);
ylabel('Firing Rate (Hertz)', FontSize=16);
title('Relationship between I_e and Firing Rate', FontSize=20)

%% 3.5 part 1: Randomly varying I_e
total_time = 0.02; %back to total from 3.3
%now, create the vector for values of I_e, which are randomly generated to
%be values between 1.5*10^-9 and 1.15*10^-8 amperes 
I_e = zeros(total_time/delta_t, 1);
for i = 1:(total_time/delta_t)
    I_e(i) = (rand + 0.15) * 10^-8;
end 
% call our helper function to populate the arrays and count the spikes 
[x, y, spikes] = integrate_and_fire(I_e, delta_t, total_time);
% finally, plot the results using our plotting helper function
plot_helper(x, y, '3.3: Spikes when I_e Randomly Varies Between 1.5*10^{-9} and 1.15*10^{-8} Amperes');

%% 3.5 part 2: Sin(x) 
total_time = 0.2;
% create a vector corresponding to a periodic function for I_e
I_e = zeros(total_time/delta_t, 1);
for i = 1:(total_time/delta_t)
    I_e(i) = (sin(i) + 1.5) *10^-9;
end 
% call our helper function to populate the arrays and count the spikes 
[x, y, spikes] = integrate_and_fire(I_e, delta_t, total_time);
% finally, plot the results using our plotting helper function
plot_helper(x, y, '3.3: Spikes when I_e Varies Periodically');


