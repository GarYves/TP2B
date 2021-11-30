script_real_data__load_params
load("real_data_optimization_results_and_likelihood_functions.mat")

script_real_data__run_graphs


parameters = table();
parameters.ret_only = ([x_ret_spx_est(1:5), 0.000])';
parameters.ret_rv = (x_RV_spx_est)';


parameters.Properties.RowNames = {'Parameter \mu', 'Parameter \kappa',...
    'Parameter \theta', 'Parameter \sigma', 'Parameter \rho', 'Parameter \eta'};

parameters

