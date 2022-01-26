%% Helper function to calculate V(t) given E_L and Tau_m
function[x,y] = V_t(E_L, Tau_m)
    % we keep V_0 constant and sample 100 times
    V_0 = -0.08; 
    x = zeros(100, 1);
    y = zeros(100, 1);
    % we can afford a larger delta t here since it's a curve 
    delta_t = 0.001;
    total_time = 0;
    for i = 1:100
        x(i) = total_time;
        % this is the solved differential equation from question 1
        y(i) = E_L + ((V_0 - E_L)*exp(-1*total_time/Tau_m));
        total_time = total_time + delta_t;
    end 
end
