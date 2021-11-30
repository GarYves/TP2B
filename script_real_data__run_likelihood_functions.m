save_results = true;

% returns only

n_steps = 40;
ret_mu = [linspace(-0.05, 0.20, n_steps), mu_ret_est];
ret_kappa = [linspace(5, 15, n_steps), kappa_ret_est];
ret_theta = [linspace(0.05^2, 0.15^2, n_steps), theta_ret_est];
ret_sigma = [linspace(0.3, 0.8, n_steps), sigma_ret_est];
ret_rho = [linspace(-0.8, -0.1, n_steps), rho_ret_est];

L_ret_mu = zeros(length(ret_mu),1);
L_ret_kappa = zeros(length(ret_kappa),1);
L_ret_theta = zeros(length(ret_theta),1);
L_ret_sigma = zeros(length(ret_sigma),1);
L_ret_rho = zeros(length(ret_rho),1);

parfor i=1:length(ret_mu)
    x1 = x_ret_spx_est(1:5);
    x1(1) = ret_mu(i);
    L_ret_mu(i,1) = Heston93_nat(x1, simul_real, spx_ret, 1);
    
    x1 = x_ret_spx_est(1:5);
    x1(2) = ret_kappa(i);
    L_ret_kappa(i,1) = Heston93_nat(x1, simul_real, spx_ret, 1);

    x1 = x_ret_spx_est(1:5);
    x1(3) = ret_theta(i);
    L_ret_theta(i,1) = Heston93_nat(x1, simul_real, spx_ret, 1);

    x1 = x_ret_spx_est(1:5);
    x1(4) = ret_sigma(i);
    L_ret_sigma(i,1) = Heston93_nat(x1, simul_real, spx_ret, 1);

    x1 = x_ret_spx_est(1:5);
    x1(5) = ret_rho(i);
    L_ret_rho(i,1) = Heston93_nat(x1, simul_real, spx_ret, 1);

    i
end

clear x1 i n_steps


% returns + RV

n_steps = 40;
RV_mu = [linspace(-0.05, 0.20, n_steps), mu_RV_est];
RV_kappa = [linspace(5, 15, n_steps), kappa_RV_est];
RV_theta = [linspace(0.05^2, 0.15^2, n_steps), theta_RV_est];
RV_sigma = [linspace(0.1, 0.6, n_steps), sigma_RV_est];
RV_rho = [linspace(-0.8, -0.1, n_steps), rho_RV_est];

L_RV_mu = zeros(length(RV_mu),1);
L_RV_kappa = zeros(length(RV_kappa),1);
L_RV_theta = zeros(length(RV_theta),1);
L_RV_sigma = zeros(length(RV_sigma),1);
L_RV_rho = zeros(length(RV_rho),1);

parfor i=1:length(RV_mu)
    x1 = x_RV_spx_est;
    x1(1) = RV_mu(i);
    L_RV_mu(i,1) = Heston93_nat(x1, simul_real, [spx_ret, spx_RV], 1);
    
    x1 = x_RV_spx_est;
    x1(2) = RV_kappa(i);
    L_RV_kappa(i,1) = Heston93_nat(x1, simul_real, [spx_ret, spx_RV], 1);
    
    x1 = x_RV_spx_est;
    x1(3) = RV_theta(i);
    L_RV_theta(i,1) = Heston93_nat(x1, simul_real, [spx_ret, spx_RV], 1);
    
    x1 = x_RV_spx_est;
    x1(4) = RV_sigma(i);
    L_RV_sigma(i,1) = Heston93_nat(x1, simul_real, [spx_ret, spx_RV], 1);
    
    x1 = x_RV_spx_est;
    x1(5) = RV_rho(i);
    L_RV_rho(i,1) = Heston93_nat(x1, simul_real, [spx_ret, spx_RV], 1);
    
    i
end

clear x1 i n_steps

% save likelihood functions
if save_results==true
    clear save_results
    save("real_data_optimization_results_and_likelihood_functions.mat", '-regexp', '^(?!(simul_real)$).')
end
