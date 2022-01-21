%% Helper function to plot the results of the integrate & fire model
function[] = plot_helper(x, y, ttl)
    plot(x, y, '-k', LineWidth=2);
    xlabel('Elapsed time (seconds)', FontSize=16);
    ylabel('Membrane potential (Volts)', FontSize=16);
    title(ttl, FontSize=20);
end