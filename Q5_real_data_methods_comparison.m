
precision = table();
precision.est_ret = (x_ret_spx_est(1:5))';
precision.cvx_ret = [
    num_cvx(L_ret_mu, ret_mu', x_ret_spx_est(1))
    num_cvx(L_ret_kappa, ret_kappa', x_ret_spx_est(2))
    num_cvx(L_ret_theta, ret_theta', x_ret_spx_est(3))
    num_cvx(L_ret_sigma, ret_sigma', x_ret_spx_est(4))
    num_cvx(L_ret_rho, ret_rho', x_ret_spx_est(5))
];

precision.est_rv = (x_RV_spx_est(1:5))';
precision.cvx_rv = [
    num_cvx(L_RV_mu, RV_mu', x_RV_spx_est(1))
    num_cvx(L_RV_kappa, RV_kappa', x_RV_spx_est(2))
    num_cvx(L_RV_theta, RV_theta', x_RV_spx_est(3))
    num_cvx(L_RV_sigma, RV_sigma', x_RV_spx_est(4))
    num_cvx(L_RV_rho, RV_rho', x_RV_spx_est(5))
];

precision.Properties.RowNames = {'Parameter \mu', 'Parameter \kappa',...
    'Parameter \theta', 'Parameter \sigma', 'Parameter \rho'};

precision


%% normality of the relative variance error (IV-RV)/RV

rve = (V_ret_spx_est(:,1)/252 - spx_RV)./(spx_RV);

figure; histogram(rve)

figure; qqplot(rve)

[h,p] = jbtest(rve)

mean(rve)
std(rve)
skewness(rve)
kurtosis(rve)