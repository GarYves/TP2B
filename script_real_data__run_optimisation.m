
% load params and simul structure
script_real_data__load_params


% run the optimization for returns only
options_ret = optimset('Display', 'iter', 'PlotFcns', @optimplotfval, 'TolFun', 1e-4, 'TolX', 1e-4);
Opt_spx_ret = fminsearch(@(x) Heston93(x, simul_real, spx_ret), x_init_transformed(1:5), options_ret);

[mu_ret_est, kappa_ret_est, theta_ret_est, sigma_ret_est, rho_ret_est, eta_ret_est] = parameters_inverse_transform(Opt_spx_ret);
x_ret_spx_est = [mu_ret_est, kappa_ret_est, theta_ret_est, sigma_ret_est, rho_ret_est, eta_ret_est];


% Compute the filtered volatility and likelihood value
[Like_H_spx_ret, V_ret_spx_est] = Heston93(Opt_spx_ret, simul_real, spx_ret, 1);


% run the optimization for returns + RV
options_RV = optimset('Display', 'iter', 'PlotFcns', @optimplotfval, 'TolFun', 1e-4, 'TolX', 1e-4);
Opt_spx_RV = fminsearch(@(x) Heston93(x, simul_real, [spx_ret, spx_RV]), x_init_transformed, options_RV);

[mu_RV_est, kappa_RV_est, theta_RV_est, sigma_RV_est, rho_RV_est, eta_RV_est] = parameters_inverse_transform(Opt_spx_RV);
x_RV_spx_est = [mu_RV_est, kappa_RV_est, theta_RV_est, sigma_RV_est, rho_RV_est, eta_RV_est];


% Compute the filtered volatility and likelihood value
[Like_H_spx_RV, V_RV_spx_est] = Heston93(Opt_spx_RV, simul_real, [spx_ret, spx_RV], 1);


% save
save("real_data_optimization_results.mat", '-regexp', '^(?!(spx|simul_real)$).')
