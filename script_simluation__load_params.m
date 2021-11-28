
% Choose a set of parameters
mu = 0.06;  % drift 
kappa = 5;  % speed of mean reversion
theta = 0.02;  % mean reversion level  
sigma = 0.3;  % volatility of volatility
rho = -0.7;  % correlation
eta = 0.2;  % stddev of relative error of variance
v = 0.01;  % initial vol at first time step

num_days = 1000;  % days to simulate
num_part = 10000;  % number of particules

x_original = [mu, kappa, theta, sigma, rho, eta];
x_transformed = parameters_transform(mu, kappa, theta, sigma, rho, eta);


% Generating the random variables
simul = simulate_random_variables(num_part, num_days, 666);
