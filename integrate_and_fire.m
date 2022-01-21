function[x,y] = integrate_and_fire(I_e, delta_t, t_total)
    V_threshold = -0.050; %Volts, the point at which the neuron will fire
    V_reset = -0.065; %Volts, the membrane potential restored after firing
    % calculate the number of samples we'll need and create the vectors
    num_samples = t_total/delta_t; 
    x = zeros(num_samples, 1);
    y = zeros(num_samples, 1);
    % begin the integrate and fire model 
    V_curr = V_reset
    elapsed_time = 0;
    for i = 1:num_samples
        x(i) = elapsed_time;
        y(i) = V_curr;
        elapsed_time = elapsed_time + delta_t;
        V_curr = update_V(V_curr, I_e, delta_t);
        if V_curr >= V_threshold
            V_curr = V_reset;
        end
    end  
end 


