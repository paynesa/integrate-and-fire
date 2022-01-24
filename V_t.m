function[x,y] = V_t(E_L, Tau_m)
    V_0 = -0.08;
    x = zeros(100, 1);
    y = zeros(100, 1);
    delta_t = 0.001;
    total_time = 0;
    for i = 1:100
        x(i) = total_time;
        y(i) = E_L + ((V_0 - E_L)*exp(-1*total_time/Tau_m));
        total_time = total_time + delta_t;
    end 
end
