% to load data: run the following
% script_real_data__load_params
% load("real_data_optimization_results.mat")


%% Graph of returns volatility and volatility filtered returns
figure

subplot(3,1,1)
plot(spx_ret,'k')
xlabel('days')
ylabel('log-returns')
title('Simulated returns')
xlim([0, nb_days])

subplot(3,1,2)
hold on
plot(V_ret_spx_est(:,1),'Color','b')
plot(V_ret_spx_est(:,2),'Color' ,'r','LineStyle','--')
plot(V_ret_spx_est(:,3),'Color' ,'r','LineStyle','--')
legend('Filtered variance','2.5%','97.5%','Location','northwest')
title('Volatility filtered using returns and the estimated parameters')
xlim([0, nb_days])

subplot(3,1,3)
hold on
plot((252)*spx_RV(:,1),'Color' ,'r')
plot(V_ret_spx_est(:,1),'Color','b')
legend('Calculated realized variance ','Filtered Variance estimated parameters','Location','northwest')
title('Volatility filtered using estimated parameters vs Calculated Realized Variance')
xlim([0, nb_days])


%% Graph of returns volatility and volatility filtered returns + RV
figure

subplot(3,1,1)
plot(spx_ret,'k')
xlabel('days')
ylabel('log-returns')
title('Simulated returns')
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
title('Volatility filtered using estimated parameters vs Calculated Realized Variance')
xlim([0, nb_days])

