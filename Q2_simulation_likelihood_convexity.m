% script_simulation__load_params
% load("simulation_optimization_results_and_likelihood_functions.mat")

precision = table();
precision.err_ret = (x_opt_ret - x_original(1:5))';
precision.cvx_ret = [
    num_cvx(L_ret_mu, ret_mu', x_opt_ret(1))
    num_cvx(L_ret_kappa, ret_kappa', x_opt_ret(2))
    num_cvx(L_ret_theta, ret_theta', x_opt_ret(3))
    num_cvx(L_ret_sigma, ret_sigma', x_opt_ret(4))
    num_cvx(L_ret_rho, ret_rho', x_opt_ret(5))
];

precision.err_rv = (x_opt_rv(1:5) - x_original(1:5))';
precision.cvx_rv = [
    num_cvx(L_rv_mu, rv_mu', x_opt_rv(1))
    num_cvx(L_rv_kappa, rv_kappa', x_opt_rv(2))
    num_cvx(L_rv_theta, rv_theta', x_opt_rv(3))
    num_cvx(L_rv_sigma, rv_sigma', x_opt_rv(4))
    num_cvx(L_rv_rho, rv_rho', x_opt_rv(5))
];

precision.Properties.RowNames = {'Parameter \mu', 'Parameter \kappa',...
    'Parameter \theta', 'Parameter \sigma', 'Parameter \rho'};

precision
