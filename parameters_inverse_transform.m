function [mu, kappa, theta, sigma, rho, eta] = parameters_inverse_transform(transformed_params)
    x = transformed_params;
    mu = x(1) / 10;
    kappa = exp(x(2));
    theta = exp(x(3));
    sigma = exp(x(4));
    rho = (1-exp(-x(5))) ./ (1+exp(-x(5)));
    if length(x) == 6
        eta = exp(x(6));
    else
        eta = 0;
    end
end