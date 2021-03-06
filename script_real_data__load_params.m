% load data
spx = readmatrix("Data.xlsx");
spx_ret = spx(1:2000, 2);
spx_RV = spx(1:2000, 3);


% Generate the random variables
nb_part = 20000;
nb_days = length(spx_ret);
simul_real = simulate_random_variables(nb_part, nb_days, 666);


% initialize values [mu, kappa, theta, sigma , rho];
mu = 252*mean(spx_ret);  % drift
kappa = 5;  % speed of mean reversion
theta = mean(sqrt(252*spx_RV)) - 1.6*std(sqrt(252*spx_RV));  % mean reversion level
sigma = 0.30;  % volatility of volatility
rho = -0.5;  % correlation
eta = 0.35;  % stddev of relative error of variance

x_init_original = [mu, kappa, theta, sigma, rho, eta];
x_init_transformed = parameters_transform(mu, kappa, theta, sigma, rho, eta);
