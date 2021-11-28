% to load data: run the following
% script_simulation__load_params
% load("simulation_optimization_results_and_likelihood_functions.mat")



%% Graph of returns volatility and volatility filtered/ Only returns
figure

subplot(4,1,1)
plot(ret,'k')
xlabel('days')
ylabel('log-returns')
title('Simulated returns')
xlim([0,num_days])

subplot(4,1,2)
plot(V,'k')
hold on
plot(V_ret_true(:,1),'Color','b')
plot(V_ret_true(:,2),'Color' ,'r','LineStyle','--')
plot(V_ret_true(:,3),'Color' ,'r','LineStyle','--')
title('Volatility filtered using returns and the true parameters')
xlabel('days')
ylabel('volatility level')
legend('True variance','Filtered variance','2.5%','97.5%','Location','northwest')
xlim([0,num_days])

subplot(4,1,3)
plot(V,'k')
hold on
plot(V_ret_est(:,1),'Color','b')
plot(V_ret_est(:,2),'Color' ,'r','LineStyle','--')
plot(V_ret_est(:,3),'Color' ,'r','LineStyle','--')
legend('True variance','Filtered variance','2.5%','97.5%','Location','northwest')
title('Volatility filtered using returns and the estimated parameters')
xlim([0,num_days])

subplot(4,1,4)
plot(V,'k')
hold on
plot(V_ret_true(:,1),'Color' ,'r')
plot(V_ret_est(:,1),'Color','b')
legend('True variance','Filtered variance true parameters','Filtered Variance estimated parameters','Location','northwest')
xlim([0,num_days])
title('Volatility filtered using the true and estimated parameters')


%% Graph of returns volatility and volatility filtered/ Returns and RV
figure

subplot(4,1,1)
plot(ret,'k')
xlabel('days')
ylabel('log-returns')
title('Simulated returns')
xlim([0,num_days])

subplot(4,1,2)
plot(V,'k')
hold on
plot(V_RV_true(:,1),'Color','b')
plot(V_RV_true(:,2),'Color' ,'r','LineStyle','--')
plot(V_RV_true(:,3),'Color' ,'r','LineStyle','--')
title('Volatility filtered using returns + RV and the true parameters')
xlabel('days')
ylabel('volatility level')
legend('True variance','Filtered variance','2.5%','97.5%','Location','northwest')
xlim([0,num_days])

subplot(4,1,3)
plot(V,'k')
hold on
plot(V_RV_est(:,1),'Color','b')
plot(V_RV_est(:,2),'Color' ,'r','LineStyle','--')
plot(V_RV_est(:,3),'Color' ,'r','LineStyle','--')
legend('True variance','Filtered variance','2.5%','97.5%','Location','northwest')
title('Volatility filtered using returns + RV and the estimated parameters')
xlim([0,num_days])

subplot(4,1,4)
plot(V,'k')
hold on
plot(V_RV_true(:,1),'Color' ,'r')
plot(V_RV_est(:,1),'Color','b')
legend('True variance','Filtered variance true parameters','Filtered Variance estimated parameters','Location','northwest')
xlim([0,num_days])
title('Volatility filtered using the true and estimated parameters')


%% Graph shape of the log-likelihood function for returns only
figure

subplot(3,2,1)
[ret_mu2,idx]=sort(ret_mu);
plot(ret_mu2,L_ret_mu(idx),'k')
hold on
plot(ret_mu(end-1),L_ret_mu(end-1),'r*')
plot(ret_mu(end),L_ret_mu(end),'b*')
ylabel('Log-Likelihood')
xlabel('\mu')
legend('Log-Likelihood','True parameter','Optimized parameter')
title('Parameter \mu')

subplot(3,2,2)
[ret_kappa2,idx]=sort(ret_kappa);
plot(ret_kappa2,L_ret_kappa(idx),'k')
hold on
plot(ret_kappa(end-1),L_ret_kappa(end-1),'r*')
plot(ret_kappa(end),L_ret_kappa(end),'b*')
ylabel('Log-Likelihood')
xlabel('\kappa')
legend('Log-Likelihood','True parameter','Optimized parameter')
title('Parameter \kappa')

subplot(3,2,3)
[ret_theta2,idx]=sort(ret_theta);
plot(ret_theta2,L_ret_theta(idx),'k')
hold on
plot(ret_theta(end-1),L_ret_theta(end-1),'r*')
plot(ret_theta(end),L_ret_theta(end),'b*')
ylabel('Log-Likelihood')
xlabel('\theta')
legend('Log-Likelihood','True parameter','Optimized parameter')
title('Parameter \theta')

subplot(3,2,4)
[ret_sigma2,idx]=sort(ret_sigma);
plot(ret_sigma2,L_ret_sigma(idx),'k')
hold on
plot(ret_sigma(end-1),L_ret_sigma(end-1),'r*')
plot(ret_sigma(end),L_ret_sigma(end),'b*')
ylabel('Log-Likelihood')
legend('Log-Likelihood','True parameter','Optimized parameter')
title('Parameter \sigma')

subplot(3,2,5)
[ret_rho2,idx]=sort(ret_rho);
plot(ret_rho2,L_ret_rho(idx),'k')
hold on
plot(ret_rho(end-1),L_ret_rho(end-1),'r*')
plot(ret_rho(end),L_ret_rho(end),'b*')
ylabel('Log-Likelihood')
xlabel('\rho')
legend('Log-Likelihood','True parameter','Optimized parameter')
title('Parameter \rho')


%% Graph shape of the log-likelihood function for returns and RV
figure

subplot(3,2,1)
[rv_mu2,idx]=sort(rv_mu);
plot(rv_mu2,L_rv_mu(idx),'k')
hold on
plot(rv_mu(end-1),L_rv_mu(end-1),'r*')
plot(rv_mu(end),L_rv_mu(end),'b*')
ylabel('Log-Likelihood')
xlabel('\mu')
legend('Log-Likelihood','True parameter','Optimized parameter')
title('Parameter \mu')

subplot(3,2,2)
[rv_kappa2,idx]=sort(rv_kappa);
plot(rv_kappa2,L_rv_kappa(idx),'k')
hold on
plot(rv_kappa(end-1),L_rv_kappa(end-1),'r*')
plot(rv_kappa(end),L_rv_kappa(end),'b*')
ylabel('Log-Likelihood')
xlabel('\kappa')
legend('Log-Likelihood','True parameter','Optimized parameter')
title('Parameter \kappa')

subplot(3,2,3)
[rv_theta2,idx]=sort(rv_theta);
plot(rv_theta2,L_rv_theta(idx),'k')
hold on
plot(rv_theta(end-1),L_rv_theta(end-1),'r*')
plot(rv_theta(end),L_rv_theta(end),'b*')
ylabel('Log-Likelihood')
xlabel('\theta')
legend('Log-Likelihood','True parameter','Optimized parameter')
title('Parameter \theta')

subplot(3,2,4)
[rv_sigma2,idx]=sort(rv_sigma);
plot(rv_sigma2,L_rv_sigma(idx),'k')
hold on
plot(rv_sigma(end-1),L_rv_sigma(end-1),'r*')
plot(rv_sigma(end),L_rv_sigma(end),'b*')
ylabel('Log-Likelihood')
legend('Log-Likelihood','True parameter','Optimized parameter')
title('Parameter \sigma')

subplot(3,2,5)
[rv_rho2,idx]=sort(rv_rho);
plot(rv_rho2,L_rv_rho(idx),'k')
hold on
plot(rv_rho(end-1),L_rv_rho(end-1),'r*')
plot(rv_rho(end),L_rv_rho(end),'b*')
ylabel('Log-Likelihood')
xlabel('\rho')
legend('Log-Likelihood','True parameter','Optimized parameter')
title('Parameter \rho')
