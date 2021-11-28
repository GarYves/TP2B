% to load data: run the following
% script_simulation__load_params
% load("simulation_optimization_results.mat")

save_results = true;

% returns only

x_opt_ret = parameters_inverse_transform(Opt_ret);

ret_mu = [linspace(0.06-0.2,0.06+0.2,50),0.06, x_opt_ret(1)];
ret_kappa = [linspace(5-3,5+3,50),5, x_opt_ret(2)];
ret_theta = [linspace(0.02-0.01,0.02+0.015,50),0.02, x_opt_ret(3)];
ret_sigma = [linspace(0.3-0.1,0.3+0.1,50),0.3, x_opt_ret(4)];
ret_rho = [linspace(-0.7-0.2,-0.7+0.2,50),-0.7, x_opt_ret(5)];

L_ret_mu = zeros(length(ret_mu),1);
L_ret_kappa = zeros(length(ret_kappa),1);
L_ret_theta = zeros(length(ret_theta),1);
L_ret_sigma = zeros(length(ret_sigma),1);
L_ret_rho = zeros(length(ret_rho),1);


parfor i=1:length(ret_mu)
    x1 = x_opt_ret;
    x1(1) = ret_mu(i);
    L_ret_mu(i,1) = Heston93_nat(x1, simul, ret,1);
    
    x1 = x_opt_ret;
    x1(2) = ret_kappa(i);
    L_ret_kappa(i,1) = Heston93_nat(x1, simul, ret,1);
    
    x1 = x_opt_ret;
    x1(3) = ret_theta(i);
    L_ret_theta(i,1) = Heston93_nat(x1, simul, ret,1);
    
    x1 = x_opt_ret;
    x1(4) = ret_sigma(i);
    L_ret_sigma(i,1) = Heston93_nat(x1, simul, ret,1);
    
    x1 = x_opt_ret;
    x1(5) = ret_rho(i);
    L_ret_rho(i,1) = Heston93_nat(x1, simul, ret,1);
    i
end


% returns + RV

x_opt_rv = parameters_inverse_transform(Opt_rv);

rv_mu = [linspace(0.06-0.2,0.06+0.2,50),0.06, x_opt_rv(1)];
rv_kappa = [linspace(5-3,5+3,50),5, x_opt_rv(2)];
rv_theta = [linspace(0.02-0.01,0.02+0.015,50),0.02, x_opt_rv(3)];
rv_sigma = [linspace(0.3-0.1,0.3+0.1,50),0.3, x_opt_rv(4)];
rv_rho = [linspace(-0.7-0.2,-0.7+0.2,50),-0.7, x_opt_rv(5)];

L_rv_mu = zeros(length(rv_mu),1);
L_rv_kappa = zeros(length(rv_kappa),1);
L_rv_theta = zeros(length(rv_theta),1);
L_rv_sigma = zeros(length(rv_sigma),1);
L_rv_rho = zeros(length(rv_rho),1);

parfor i=1:length(rv_mu)
    x1 = x_opt_rv;
    x1(1) = rv_mu(i);
    L_rv_mu(i,1) = Heston93_nat(x1, simul, [ret, RV], 1);
    
    x1 = x_opt_rv;
    x1(2) = rv_kappa(i);
    L_rv_kappa(i,1) = Heston93_nat(x1, simul, [ret, RV], 1);
    
    x1 = x_opt_rv;
    x1(3) = rv_theta(i);
    L_rv_theta(i,1) = Heston93_nat(x1, simul, [ret, RV], 1);
    
    x1 = x_opt_rv;
    x1(4) = rv_sigma(i);
    L_rv_sigma(i,1) = Heston93_nat(x1, simul, [ret, RV], 1);
    
    x1 = x_opt_rv;
    x1(5) = rv_rho(i);
    L_rv_rho(i,1) = Heston93_nat(x1, simul, [ret, RV], 1);
    i
end


% save likelihood functions
if save_results==true
    save("simulation_optimization_results_and_likelihood_functions.mat", '-regexp', '^(?!(simul)$).')
end
