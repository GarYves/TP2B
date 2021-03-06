function [params_transformed] = parameters_transform(mu, kappa, theta, sigma, rho, eta)
    params_transformed = [...
        mu*10,...
        log(kappa),...
        log(theta),...
        log(sigma),...
        log(1+rho) - log(1-rho),...
        log(eta)...
    ];
end