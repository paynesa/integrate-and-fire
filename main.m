%% This is the code in which the main computations are called
%Written by Sarah Payne, January 2022

% % % % % PART ONE: NUMERICAL SIMULATION % % % % %
%% Question 3, First Figure: I_e = 5*10^-9 amperes and total time = 0.02 seconds
delta_t = 0.0001; %seconds 
total_time = 0.02; %seconds
I_e = zeros(total_time/delta_t, 1);
for i = 1:(total_time/delta_t)
    I_e(i) = 5*10^-9;
end 
[x, y, ~] = integrate_and_fire(I_e, delta_t, total_time); %populate arrays & count spikes
plot_helper(x, y, 'Integrate-and-Fire Model with I_e = 5*10^{-9} Amperes'); %plot the results 

%% Question 3, Second Figure: I_e = 1.6*10^-9 amperes and total time = 0.1 seconds
delta_t = 0.0001; %seconds
total_time = 0.1; %seconds
I_e = zeros(total_time/delta_t, 1);
for i = 1:(total_time/delta_t)
    I_e(i) = 1.6*10^-9;
end 
[x, y, ~] = integrate_and_fire(I_e, delta_t, total_time); %populate arrays & count spikes
plot_helper(x, y, 'Integrate-and-Fire Model with I_e = 1.6*10^{-9} Amperes'); %plot the results 

%% Question 4: We compare the number of spikes to the values of I_e:
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
    %increment the value of I_e
    val = val + 5*10^-10;
    %run the model and record the number of spikes
    [~, ~, spikes] = integrate_and_fire(I_e, delta_t, total_time);
    firing_rates(i) = spikes;
end
% plot the results 
plot(values_of_I_e, firing_rates, '.-k', LineWidth=2, MarkerSize=10);
text(1.5*10^-9, 350, {'Intercept:', '1.5*10^{-9}','\downarrow'}, FontSize=16);
xlabel('Value of I_e (Amperes)', FontSize=16);
ylabel('Firing Rate (Hertz)', FontSize=16);
title('Relationship between I_e and Firing Rate', FontSize=20)

%% Question 5, First Figure: Randomly varying I_e
total_time = 0.02; 
%now, create the vector for values of I_e, which are randomly generated to
%be values between 1.5*10^-9 and 1.15*10^-8 amperes 
I_e = zeros(total_time/delta_t, 1);
for i = 1:(total_time/delta_t)
    I_e(i) = (rand + 0.15) * 10^-8;
end 
% call our helper function to populate the arrays and count the spikes 
[x, y, ~] = integrate_and_fire(I_e, delta_t, total_time);
% finally, plot the results of the current 
plot(x, I_e);
xlabel('Elapsed time (seconds)', FontSize=16);
ylabel('Applied Current (amperes)', FontSize=16);
title('Applied Current I_e Randomly Varies Between 1.5*10^{-9} and 1.15*10^{-8} Amperes', FontSize=20);

%% Question 5, Second Figure: Membrane potential from randomly varying I_e
plot_helper(x, y, 'Integrate-and-Fire Model when I_e Randomly Varies Between 1.5*10^{-9} and 1.15*10^{-8} Amperes');

%% Question 5, Third Figure: Multiple samples of randomly varying I_e on the same plot
total_time = 0.02; 
% create 25 iterations of the model and plot together to show variation
for j = 1:25
    %now, create the vector for values of I_e, which are randomly generated to
    %be values between 1.5*10^-9 and 1.15*10^-8 amperes 
    I_e = zeros(total_time/delta_t, 1);
    for i = 1:(total_time/delta_t)
        I_e(i) = (rand + 0.15) * 10^-8;
    end 
    % call our helper function to populate the arrays and count the spikes 
    [x, y, ~] = integrate_and_fire(I_e, delta_t, total_time);
    % add these stochiastic results to the same plot
    plot(x, y, LineWidth=2);
    hold on
end
% add labels to the plot and turn off hold
xlabel('Elapsed time (seconds)', FontSize=16);
ylabel('Membrane potential (Volts)', FontSize=16);
title('25 Iterations of Integrate-and-Fire Model with Stochiastic I_e', FontSize=20);
hold off

%% Question 5, Fourth Figure: I_e for positive Sin(x) 
total_time = 0.05;
% create a vector corresponding to a periodic function for I_e
I_e = zeros(total_time/delta_t, 1);
for i = 1:(total_time/delta_t)
    I_e(i) = (sin(i) + 2.5) *10^-9;
end 
% call our helper function to populate the arrays and count the spikes 
[x, y, ~] = integrate_and_fire(I_e, delta_t, total_time);
% finally, plot the results
plot(x, I_e);
xlabel('Elapsed time (seconds)', FontSize=16);
ylabel('Applied Current (amperes)', FontSize=16);
title('Applied Current I_e = (sin(t) + 2.5) ∗ 10^{−9}', FontSize=20);

%% Question 5, Fifth Figure: Membrane potential for positive Sin(x)
plot_helper(x, y, 'Integrate-and-Fire Model when I_e Varies Periodically Between 1.5*10^{-9} and 3.5*10^{-9} Amperes');

%% Question 5, Sixth Figure: I_e for transposed Sin(x) 
total_time = 0.02;
% create a vector corresponding to a periodic function for I_e
I_e = zeros(total_time/delta_t, 1);
for i = 1:(total_time/delta_t)
    I_e(i) = (sin(i) + 0.5) *10^-8;
end 
% call our helper function to populate the arrays and count the spikes 
[x, y, ~] = integrate_and_fire(I_e, delta_t, total_time);
% finally, plot the results
plot(x, I_e);
xlabel('Elapsed time (seconds)', FontSize=16);
ylabel('Applied Current (amperes)', FontSize=16);
title('Applied Current I_e = (sin(t) + 0.5) ∗ 10^{−8}', FontSize=20);

%% Question 5, Sixth Figure: 
plot_helper(x, y, 'Integrate-and-Fire Model when I_e Varies Periodically Between -5*10^{-9} and 1.5*10^{-8} Amperes');

% % % % % PART TWO: DERIVING & FIRING RATES % % % % %
%% Question 2, First Figure: variation in Tau_m
% we keep the resting membrane potential constant
E_L = -0.065; 
% We initialize arrays that we will use to create our legend
lines = zeros(5,1);
labels = ["", "", "", "", ""];
hold on
for i=1:5
    Tau_m = 0.01*i;
    %call the helper function to get the x & y vectors we will plot
    [x, y] = V_t(E_L, Tau_m); 
    %add the line and legend label to their vectors for the legend later
    lines(i) = plot(x, y, LineWidth=2); 
    labels(i) = sprintf("Tau_m = %.2f", Tau_m);
end
hold off
% finish the plot of the results
legend(lines, labels, Location='southeast', Fontsize = 16);
xlabel('Elapsed time (seconds)', FontSize=16);
ylabel('Membrane potential (Volts)', FontSize=16);
title("Effects of Tau_m on V(t)", Fontsize=20);

%% Question 2, Second Figure: Variation in E_L
% we keep tau_m constant 
Tau_m = 0.01;
% we initialize arrays that we will use to create our legend 
lines = zeros(5,1);
labels = ["", "", "", "", ""];
hold on
for i=1:5
    E_L = -0.05 -0.01*i;
    % call the helper function to get the x & y vectors we will plot
    [x, y] = V_t(E_L, Tau_m);
    %add the line and legend label to their vectors for the legend later
    lines(i) = plot(x, y, LineWidth=2);
    labels(i) = sprintf("E_L = %.2f", E_L);
end
hold off
% finish the plot of the results 
legend(lines, labels, Location='southeast', Fontsize = 16);
xlabel('Elapsed time (seconds)', FontSize=16);
ylabel('Membrane potential (Volts)', FontSize=16);
title("Effects of E_L on V(t)", Fontsize=20);

%% Question 7: Theoretical firing rate vs. actual firing rate
% Just as in question 4 of part 1, we measure over a second 
total_time = 1;
% Initialize the vectors for plotting
values_of_I_e = zeros(100,1); 
firing_rates_theoretical = zeros(100, 1);
firing_rates_actual = zeros(100, 1);
% we test 100 difference values of I_e
for i = 1:100
    % the current value of i -- set this in the x-axis vector
    val = i*5*10^-10;
    values_of_I_e(i) = val;
    % calculate the theoretical firing rate based on this value of I_e
    firing_rates_theoretical(i) = 1/theoretical_firing(val);
    % also calculate the numeric simulation of the firing rate 
    I_e = zeros(total_time/delta_t, 1); 
    for j = 1:(total_time/delta_t)
        I_e(j) = val;
    end 
    %run the integrate and fire model and record the number of spikes
    [~, ~, spikes] = integrate_and_fire(I_e, delta_t, total_time);
    firing_rates_actual(i) = spikes;
end
% plot the results of both the derived and simulated firing rates 
hold on
% create the legend & plot it 
lines = zeros(2,1);
labels = ["Derived", "Simulated"];
lines(1) = plot(values_of_I_e, firing_rates_theoretical, '.-', LineWidth=2, MarkerSize=10);
lines(2) = plot(values_of_I_e, firing_rates_actual, '.', MarkerSize=15);
legend(lines, labels, Location='southeast', FontSize=16);
xlabel('Value of I_e (Amperes)', FontSize=16);
ylabel('Firing Rate (Hertz)', FontSize=16);
title('Derived and Simulated Relationship between I_e and Firing Rate', FontSize=20)
hold off