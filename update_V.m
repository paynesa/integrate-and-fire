%% Function that calculates delta_V and updates the current value of V accordingly
function [V_new] = update_V(V_curr, I_e, delta_t)
    Tau_m = 0.01; %Seconds
    E_L = -0.065; %Volts
    R_m = 10^7; %Ohms
    delta_V = (delta_t/Tau_m)*((E_L - V_curr) + R_m*I_e);
    V_new = V_curr + delta_V;
end