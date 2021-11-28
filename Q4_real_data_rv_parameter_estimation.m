% load data
spx = readmatrix("Data.xlsx");
spx_ret = spx(:, 2);
spx_RV = spx(:, 3);

% Generating the random variables
rng(666);
nb_part = 10000;
nb_days = length(spx_ret);
simul_real.U = unifrnd(0, 1, nb_part, 1);
simul_real.ZZ = normrnd(0, 1, nb_part, nb_days, 5);
simul_real.UU = unifrnd(0, 1, nb_part, nb_days);
simul_real.Z = normrnd(0, 1, nb_part, nb_days);

% initialize values [mu, kappa, theta, sigma , rho, eta];
x_init_RV = [mean(spx_ret), 1, std(spx_ret), std(spx_RV), corr(spx_ret, spx_RV), 0.2];

% run the optimization
options_RV = optimset('Display', 'iter', 'PlotFcns', @optimplotfval, 'TolFun', 1e-3, 'TolX', 1e-3);
Opt_spx_RV = fminsearch(@(x) Heston93(x, simul_real, [spx_ret, spx_RV]), x_init_RV, options_RV);

% Compute the filtered vlatility and
[Like_H_spx_RV, V_RV_spx_est] = Heston93(Opt_spx_RV, simul_real, [spx_ret, spx_RV], 1);

% save
save("Q4.mat")