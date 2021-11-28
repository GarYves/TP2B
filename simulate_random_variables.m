function [simul] = simulate_random_variables(nb_part, num_days, seed)

    if nargin < 3
        rng(666);
    else
        rng(seed);
    end
    
    simul.U = unifrnd(0, 1, nb_part, 1);
    simul.ZZ = normrnd(0, 1, nb_part, num_days, 5);
    simul.UU = unifrnd(0, 1, nb_part, num_days);
    simul.Z = normrnd(0, 1, nb_part, num_days);

end

