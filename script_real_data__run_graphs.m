% to load data: run the following
% script_real_data__load_params
% load("real_data_optimization_results.mat")


%% Graph of returns volatility and volatility filtered returns
figure

subplot(3,1,1)
plot(spx_ret,'k')
xlabel('days')
ylabel('log-returns')
title('S&P 500 daily log-returns')
xlim([0, nb_days])

subplot(3,1,2)
hold on
plot(V_ret_spx_est(:,1),'Color','b')
plot(V_ret_spx_est(:,2),'Color' ,'r','LineStyle','--')
plot(V_ret_spx_est(:,3),'Color' ,'r','LineStyle','--')
legend('Filtered variance ','2.5%','97.5%','Location','northwest')
title('Volatility filtered using returns and the estimated parameters')
xlim([0, nb_days])

subplot(3,1,3)
hold on
plot((252)*spx_RV(:,1),'Color' ,'r')
plot(V_ret_spx_est(:,1),'Color','b')
legend('Calculated realized variance ','Filtered Variance estimated parameters','Location','northwest')
title('Volatility filtered using using returns vs Calculated Realized Variance')
xlim([0, nb_days])


%% Graph of returns volatility and volatility filtered returns + RV
figure

subplot(3,1,1)
plot(spx_ret,'k')
xlabel('days')
ylabel('log-returns')
title('S&P 500 daily log-returns')
xlim([0, nb_days])

subplot(3,1,2)
hold on
plot(V_RV_spx_est(:,1),'Color','b')
plot(V_RV_spx_est(:,2),'Color' ,'r','LineStyle','--')
plot(V_RV_spx_est(:,3),'Color' ,'r','LineStyle','--')
legend('Filtered variance','2.5%','97.5%','Location','northwest')
title('Volatility filtered using returns+RV and the estimated parameters')
xlim([0, nb_days])

subplot(3,1,3)
hold on
plot((252)*spx_RV(:,1),'Color' ,'r')
plot(V_RV_spx_est(:,1),'Color','b')
legend('Calculated realized variance ','Filtered Variance estimated parameters','Location','northwest')
title('Volatility filtered uusing returns+RV vs Calculated Realized Variance')
xlim([0, nb_days])


%% Graph of comparison between variances
figure

subplot(3,1,1)
hold on
plot(252*spx_RV(:,1),'Color' ,'r', 'LineWidth', 0.1)
plot(V_ret_spx_est(:,1),'Color','k','LineWidth', 2)
legend('Calculated realized variance','Filtered Variance with returns', 'Location','northwest')
title('Volatility filtered using estimated parameters vs Calculated Realized Variance')
xlim([0, nb_days])
ylim([0,0.1])
hold off


subplot(3,1,2)
hold on
plot(252*spx_RV(:,1),'Color' ,'r', 'LineWidth', 0.1)
plot(V_RV_spx_est(:,1),'Color','b','LineWidth', 2)
legend('Calculated realized variance', 'Filtered Variance with returns+RV','Location','northwest')
title('Volatility filtered using estimated parameters vs Calculated Realized Variance')
xlim([0, nb_days])
ylim([0,0.1])
hold off


subplot(3,1,3)
hold on
plot(V_ret_spx_est(:,1) - V_RV_spx_est(:,1),'Color',[0,0,0.5])
legend('difference between ret and ret+rv','Location','northwest')
xlim([0, nb_days])
hold off


%% Graph of comparison between the confidence intervals




%% Graph shape of the log-likelihood function for returns only
figure

ylim_ = [
    min([L_ret_mu; L_ret_kappa; L_ret_theta; L_ret_sigma; L_ret_rho]),...
    max([L_ret_mu; L_ret_kappa; L_ret_theta; L_ret_sigma; L_ret_rho])
];

subplot(3,2,1)
[ret_mu2,idx]=sort(ret_mu);
plot(ret_mu2,L_ret_mu(idx),'k')
hold on
plot(ret_mu(end),L_ret_mu(end),'b*')
ylabel('Log-Likelihood')
xlabel('\mu')
legend('Log-Likelihood','Optimized parameter')
title('Parameter \mu')
ylim(ylim_)

subplot(3,2,2)
[ret_kappa2,idx]=sort(ret_kappa);
plot(ret_kappa2,L_ret_kappa(idx),'k')
hold on
plot(ret_kappa(end),L_ret_kappa(end),'b*')
ylabel('Log-Likelihood')
xlabel('\kappa')
legend('Log-Likelihood','Optimized parameter')
title('Parameter \kappa')
ylim(ylim_)

subplot(3,2,3)
[ret_theta2,idx]=sort(ret_theta);
plot(ret_theta2,L_ret_theta(idx),'k')
hold on
plot(ret_theta(end),L_ret_theta(end),'b*')
ylabel('Log-Likelihood')
xlabel('\theta')
legend('Log-Likelihood','Optimized parameter')
title('Parameter \theta')
ylim(ylim_)

subplot(3,2,4)
[ret_sigma2,idx]=sort(ret_sigma);
plot(ret_sigma2,L_ret_sigma(idx),'k')
hold on
plot(ret_sigma(end),L_ret_sigma(end),'b*')
ylabel('Log-Likelihood')
legend('Log-Likelihood','Optimized parameter')
title('Parameter \sigma')
ylim(ylim_)

subplot(3,2,5)
[ret_rho2,idx]=sort(ret_rho);
plot(ret_rho2,L_ret_rho(idx),'k')
hold on
plot(ret_rho(end),L_ret_rho(end),'b*')
ylabel('Log-Likelihood')
xlabel('\rho')
legend('Log-Likelihood','Optimized parameter')
title('Parameter \rho')
ylim(ylim_)

clear idx ret_mu2 ret_kappa2 ret_theta2 ret_sigma2 ret_rho2 ylim_


%% Graph shape of the log-likelihood function for returns + RV
figure

ylim_ = [
    min([L_RV_mu; L_RV_kappa; L_RV_theta; L_RV_sigma; L_RV_rho]),...
    max([L_RV_mu; L_RV_kappa; L_RV_theta; L_RV_sigma; L_RV_rho])
];

subplot(3,2,1)
[RV_mu2,idx]=sort(RV_mu);
plot(RV_mu2,L_RV_mu(idx),'k')
hold on
plot(RV_mu(end),L_RV_mu(end),'b*')
ylabel('Log-Likelihood')
xlabel('\mu')
legend('Log-Likelihood','Optimized parameter')
title('Parameter \mu')
ylim(ylim_)

subplot(3,2,2)
[RV_kappa2,idx]=sort(RV_kappa);
plot(RV_kappa2,L_RV_kappa(idx),'k')
hold on
plot(RV_kappa(end),L_RV_kappa(end),'b*')
ylabel('Log-Likelihood')
xlabel('\kappa')
legend('Log-Likelihood','Optimized parameter')
title('Parameter \kappa')
ylim(ylim_)

subplot(3,2,3)
[RV_theta2,idx]=sort(RV_theta);
plot(RV_theta2,L_RV_theta(idx),'k')
hold on
plot(RV_theta(end),L_RV_theta(end),'b*')
ylabel('Log-Likelihood')
xlabel('\theta')
legend('Log-Likelihood','Optimized parameter')
title('Parameter \theta')
ylim(ylim_)

subplot(3,2,4)
[RV_sigma2,idx]=sort(RV_sigma);
plot(RV_sigma2,L_RV_sigma(idx),'k')
hold on
plot(RV_sigma(end),L_RV_sigma(end),'b*')
ylabel('Log-Likelihood')
legend('Log-Likelihood','Optimized parameter')
title('Parameter \sigma')
ylim(ylim_)

subplot(3,2,5)
[RV_rho2,idx]=sort(RV_rho);
plot(RV_rho2,L_RV_rho(idx),'k')
hold on
plot(RV_rho(end),L_RV_rho(end),'b*')
ylabel('Log-Likelihood')
xlabel('\rho')
legend('Log-Likelihood','Optimized parameter')
title('Parameter \rho')
ylim(ylim_)

clear idx RV_mu2 RV_kappa2 RV_theta2 RV_sigma2 RV_rho2 ylim_


