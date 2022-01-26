%% This function implements the integrate and fire model and returns the x and y vectors corresponding to time and potential
function[x, y, num_spikes] = integrate_and_fire(I_e, delta_t, t_total)
    V_threshold = -0.050; %Volts, the point at which the neuron will fire
    V_reset = -0.065; %Volts, the membrane potential restored after firing
    Tau_m = 0.01; %Seconds, the membrane time constant 
    E_L = -0.065; %Volts, the resting membrane potential
    R_m = 10^7; %Ohms, the membrane resistance 
    % calculate the number of samples we'll need and create the vectors
    num_samples = t_total/delta_t; 
    x = zeros(num_samples, 1);
    y = zeros(num_samples, 1);
    % start at the reset membrane potential 
    V_curr = V_reset;
    % keep track of the number of spikes 
    num_spikes = 0; 
    % begin the integrate and fire model 
    for i = 1:num_samples
        % calculate the elapsed time and update the membrane potential
        elapsed_time =  (i-1)*delta_t;
        x(i) = elapsed_time;
        y(i) = V_curr;
        V_curr = V_curr + (delta_t/Tau_m)*((E_L - V_curr) + R_m*I_e(i));
        if V_curr >= V_threshold
            V_curr = V_reset;
            num_spikes = num_spikes + 1;
        end
    end  
end 


