%% Calculates the derived value T, the time between action potentials
function[t] = theoretical_firing(I_e)
    % these values are hard-coded for our purposes but can be modified 
    V_threshold = -0.050; 
    V_reset = -0.065;
    E_L = -0.065;
    R_m = 10^7;
    Tau_m = 0.01;
    % plug into equation and return the result 
    t = Tau_m*log((R_m*I_e + E_L -V_reset)/(R_m*I_e + E_L - V_threshold));   
end