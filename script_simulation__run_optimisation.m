% Author Rémi Galarneau-Vincent
%% Simulated observations


clear all  
clc
close all


% load params, simul structure and simulated returns
script_simulation__load_params


% Filter using the true parameters
[Like_H_true_ret, V_ret_true] = Heston93(x_transformed, simul, ret, 1);
[Like_H_true_rv, V_RV_true] = Heston93(x_transformed, simul, [ret, RV], 1);


% Parameter search using fminsearch for stability
options_rv = optimset('Display', 'iter', 'PlotFcns', @optimplotfval,...
    'TolFun', 1e-3, 'TolX', 1e-4, 'UseParallel', true);
Opt_rv = fminsearch(@(x) Heston93(x, simul, [ret, RV]), x_transformed, options_rv);

options_ret = optimset('Display', 'iter', 'PlotFcns', @optimplotfval,...
    'TolFun', 1e-3, 'TolX', 1e-4, 'UseParallel', true);
Opt_ret = fminsearch(@(x) Heston93(x, simul, ret), x_transformed, options_ret);


% Filter using the estimated parameters
[Like_H_ret, V_ret_est] = Heston93(Opt_ret, simul, ret, 1);
[Like_H_rv, V_RV_est] = Heston93(Opt_rv, simul, [ret, RV], 1);


% save optimization data
save("simulation_optimization_results.mat", '-regexp', '^(?!(simul)$).')
