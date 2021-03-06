
% load everything
script_simulation__load_params
load('simulation_optimization_results_and_likelihood_functions.mat')
script_simulation__run_graphs


% histograms of errors
V_true = V(1:(end-1));

eps_ret_est = V_ret_est(:, 1) - V_true;
eps_ret_true = V_ret_true(:, 1) -  V_true;
eps_RV_est = V_RV_est(:, 1) - V_true;
eps_RV_true = V_RV_true(:, 1) - V_true;
 
x_lims = [min([eps_ret_est; eps_ret_true; eps_RV_est; eps_RV_true]), ...
          max([eps_ret_est; eps_ret_true; eps_RV_est; eps_RV_true])];
y_lims = [0, 400];

min_val = round(-100*x_lims(1))/-100;
max_val = round(100*x_lims(2))/100;
step = (max_val - min_val)/30;
bin_centers =  min_val:step:max_val;

figure
subplot(2,2,1)
histogram(eps_ret_est, bin_centers)
title('Volatility filtered using returns and estimated parameters vs True Volatility')
xlim(x_lims)
ylim(y_lims)

subplot(2,2,2)
histogram(eps_ret_true, bin_centers)
title('Volatility filtered using returns and true parameters vs True Volatility')
xlim(x_lims)
ylim(y_lims)

subplot(2,2,3)
histogram(eps_RV_est, bin_centers)
title('Volatility filtered using returns+RV and estimated parameters vs True Volatility')
xlim(x_lims)
ylim(y_lims)

subplot(2,2,4)
histogram(eps_RV_true, bin_centers)
title('Volatility filtered using returns+RV and true parameters vs True Volatility')
xlim(x_lims)
ylim(y_lims)


% mettre un tableau qui presente les statistiques de l'erreur
errors = [eps_ret_est, eps_ret_true, eps_RV_est, eps_RV_true];

results = table();

results.min = min(errors)';
results.q25 = quantile(errors, 0.25)';
results.q50 = quantile(errors, 0.50)';
results.q75 = quantile(errors, 0.75)';
results.max = max(errors)';

results.mean = mean(errors)';
results.std = std(errors)';
results.skew = skewness(errors)';
results.kurt = kurtosis(errors)';

results.Properties.RowNames = {'ret est', 'ret true', 'ret+rv est', 'ret+rv true'};

results
