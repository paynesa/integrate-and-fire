function[t] = theoretical_firing(I_e)
    V_threshold = -0.050; 
    V_reset = -0.065;
    E_L = -0.065;
    R_m = 10^7;
    Tau_m = 0.01;
    t = Tau_m*log((R_m*I_e + E_L -V_reset)/(R_m*I_e + E_L - V_threshold));
    
end