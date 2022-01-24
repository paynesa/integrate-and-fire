%% Variation in Tau_m
E_L = -0.065;
Tau_m = 0.01;
lines = zeros(5,1);
labels = ["", "", "", "", ""];
for i=1:5
    [x, y] = V_t(E_L, Tau_m);
    lines(i) = plot(x, y, LineWidth=2);
    labels(i) = sprintf("Tau_m = %.2f", Tau_m);
    hold on
    Tau_m = Tau_m + 0.01;
end
hold off
legend(lines, labels, Location='southeast', Fontsize = 16);
xlabel('Elapsed time (seconds)', FontSize=16);
ylabel('Membrane potential (Volts)', FontSize=16);
title("Effects of Tau_m on V(t)", Fontsize=20);



%% Variation in E_L
E_L = -0.06;
Tau_m = 0.01;
lines = zeros(5,1);
labels = ["", "", "", "", ""];
for i=1:5
    [x, y] = V_t(E_L, Tau_m);
    lines(i) = plot(x, y, LineWidth=2);
    labels(i) = sprintf("E_L = %.2f", E_L);
    hold on
    E_L = E_L - 0.01;
end
hold off
legend(lines, labels, Location='southeast', Fontsize = 16);
xlabel('Elapsed time (seconds)', FontSize=16);
ylabel('Membrane potential (Volts)', FontSize=16);
title("Effects of E_L on V(t)", Fontsize=20);

%% Last part
total_time = 1;
delta_t = 0.0001;
values_of_I_e = zeros(100,1); 
firing_rates_theoretical = zeros(100, 1);
firing_rates_actual = zeros(100, 1);
val = 0;
for i = 1:100
    values_of_I_e(i) = val;
    firing_rates_theoretical(i) = 1/theoretical_firing(val);
    I_e = zeros(total_time/delta_t, 1); 
    for j = 1:(total_time/delta_t)
        I_e(j) = val;
    end 
    %increment the value of I_e
    val = val + 5*10^-10;
    %run the model and record the number of spikes
    [~, ~, spikes] = integrate_and_fire(I_e, delta_t, total_time);
    firing_rates_actual(i) = spikes;
end
hold on
plot(values_of_I_e, firing_rates_theoretical);
plot(values_of_I_e, firing_rates_actual, '.');
hold off

