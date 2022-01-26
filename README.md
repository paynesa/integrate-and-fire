# Integrate and Fire Implementation

Provides MatLab implementations of the classic integrate-and-fire model of a neuron 
using both numerical simulation and theoretical derivation. 

## Code Layout
`integrate_and_fire.m` contains a functional implementation of the Integrate-and-Fire neuron 
in the `integrate_and_fire` function. This function takes in a vector `I_e` that contains one 
entry per time point for the applied current to the neuron at that time point. It also takes in 
`delta_t`, or the time increment being used for the calculations, and `t_total,` the total amount 
of time for which we will simulate the neuron. This function models the neuron using the standard
integrate-and-fire differential equation with the input `delta_t` and returns arrays corresponding to the 
x (time) and y (membrane potential) which may be used in plotting, as well as a count of the number
of spikes the neuron reached during the simulation.

`plot_helper.m` provides a simple helper function that may be called with `x` and `y` vectors and a title 
string `ttl` and plots the results of the Integrate-and-Fire model, including appropriate axis labels. 

`theoretical_firing.m` takes in an applied current `I_e` (here `I_e`) is a single number rather
than a vector, and calculates `T`, the time between two spikes, based on theoretical derivations
from the traditional Integrate-and-Fire differential equation. 

`V_t.m` takes in the resting membrane potential `E_L` and the membrane time constant `Tau_m` 
and calculates the progression of the Integrate-and-Fire model over 100 time points based on the
solved differential equation. These results could be compared to the numeric simulation as implemented
in `integrate_and_fire.m`

`main.m` conducts all of our main computations, separated by problem as follows: 


