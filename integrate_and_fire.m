% Initialize the constants used in the equation
Tau_m = 0.01; %Seconds
E_L = -0.065; %Volts
R_m = 10^7; %Ohms
V_threshold = -0.050; %Volts
V_reset = -0.065; %Volts

% These values are treated as constants but can be modified 
I_e = 5*10^-9; %Amperes
delta_t = 0.0001; %Seconds 


% Define the vectors we'll use in plotting
num_samples = 100;
x = zeros(num_samples, 1);
y = zeros(num_samples, 1);


V_curr = V_reset;
elapsed_time = 0;
for i = 1:num_samples
    x(i) = elapsed_time;
    y(i) = V_curr;
    delta_V = (delta_t/Tau_m)*((E_L - V_curr) + R_m*I_e);
    elapsed_time = elapsed_time + delta_t;
    V_curr = V_curr + delta_V;
    if V_curr >= V_threshold
        V_curr = V_reset;
    end
end    






%Begin computations here



plot(x, y);
