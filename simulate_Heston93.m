function [ret, V, IV] = simulate_Heston93(mu, kappa, theta, sigma, rho, v_start, num_days, seed)
%Autor Rémi Galarneau-Vincent
    
    % Check if the parameters are valid
    k = 0;
    if theta <= 0
        warning('Theta should be greater than 0')
        k = 1;
    end
    if sigma <= 0
        warning('Sigma should be greater than 0')
        k = 1;
    end
    if kappa <= 0
        warning('kappa should be greater than 0')
        k = 1;
    end
    if (2*kappa*sigma) <= (sigma^2)
        warning('2*kappa*theta should be greater than sigma^2')
        k = 1;
    end
    if nargin < 8
        seed = 888;
    end
    if k == 1
        warning('Stopping')
    else
        
        % set seed for repeatable simulations
        rng(seed);

        % time steps, one trading day and 5 intraday steps per day
        delta = 1/252;
        intraday_steps = 5;

        % the d and eta are paramters used for simulating non-central chisquare 
        % distributions
        %         df = 4*kappa*theta/sigma^2;
        %         eta = 4*kappa*exp(-kappa*delta)/(sigma^2*(1-exp(-kappa*delta)));
        %         alpha = exp(-kappa*delta)/eta;

        % preallocation
        V = zeros(num_days,1);
        ret = zeros(num_days,1);
        IV = zeros(num_days,1);
        v = zeros(intraday_steps,1);
        
        vol_past = v_start;
        for t = 1:num_days
            v(1,1) = max(intraday_integrated_variance_increment(vol_past, intraday_steps), 0.000001);
            for d = 2:intraday_steps
                v(d,1) = max(intraday_integrated_variance_increment(v(d-1), intraday_steps), 0.000001);
            end

            vol = [vol_past; v];
            V(t) = v(end, 1);
            IV(t) = sum((vol(1:end-1)+vol(2:end))/2)*delta/intraday_steps;
            ret(t) = mu*delta - IV(t)/2 ...
                + rho/sigma * (V(t) - vol_past - kappa*theta*delta + kappa*IV(t))...
                + sqrt((1-rho.^2)*IV(t))*normrnd(0, 1);
            IV(t) = IV(t) + normrnd(0, 0.1.*IV(t)); % WHAT?
            vol_past = V(t);
        end
    end

    function [v_incr] = intraday_integrated_variance_increment(v_prev, n_steps)
           v_incr = v_prev + kappa*(theta-v_prev)*delta/n_steps + sigma.*sqrt(v_prev*delta/n_steps)*normrnd(0,1);
    end
end