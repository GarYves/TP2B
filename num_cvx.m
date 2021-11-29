function [cvx, dydx, d2ydx2] = num_cvx(y, x, x_eval)
    [x,i] = sort(x);
    y = y(i);
    dydx = gradient(y)./gradient(x);
    d2ydx2 = gradient(dydx)./gradient(x);
    cvx = interp1(x, d2ydx2, x_eval, 'linear');
end