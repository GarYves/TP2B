% Author Rémi Galarneau-Vincent
%% Simulated observations


clear all  
clc
close all

% load params and simul structure
script_simluation__load_params

% Simulation of returns
[ret, V, RV] = simulate_Heston93(mu, kappa, theta, sigma, rho, v, num_days, 999);


% Filter using the true parameters
[Like_H_true_ret, V_ret_true] = Heston93(x_transformed, simul, ret, 1);
[Like_H_true_rv, V_RV_true] = Heston93(x_transformed, simul, [ret, RV], 1);


% Parameter search using fminsearch for stability
options_rv = optimset('Display', 'iter', 'PlotFcns', @optimplotfval, 'TolFun', 1e-3, 'TolX', 1e-3);
Opt_rv = fminsearch(@(x) Heston93(x, simul, [ret, RV]), x_transformed, options_rv);

options_ret = optimset('Display', 'iter', 'PlotFcns', @optimplotfval, 'TolFun', 1e-3, 'TolX', 1e-3);
Opt_ret = fminsearch(@(x) Heston93(x, simul, ret), x_transformed, options_ret);


% Filter using the estimated parameters
[Like_H_ret, V_ret_est] = Heston93(Opt_ret, simul, ret, 1);
[Like_H_rv, V_RV_est] = Heston93(Opt_rv, simul, [ret, RV], 1);


% save optimization data
save("simulation_optimization_results_.mat", '-regexp', '^(?!(simul)$).')
