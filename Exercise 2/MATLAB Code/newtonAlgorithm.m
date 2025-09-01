function [x_current, num_iters] = newtonAlgorithm(f, x_initial, gamma, epsilon)
% Function that utilizes Newton's algorithm on 3 different occasions:
% 1. By the user's choice of the step gamma
% 2. The algorithm chooses the gamma in order to minimize a certain
% expression
% 3. By using Armijo's rule

syms x y g;

% Initialize values
x_current = x_initial;
grad_f = gradient(f, [x; y]);
hess_f = hessian(f, [x; y]);
gradient_at_point = double(subs(grad_f, [x; y], x_current));
hessian_at_point = double(subs(hess_f, [x; y], x_current));
num_iters = 0;

% 1. User's choice
if isnumeric(gamma)
    while norm(gradient_at_point) > epsilon
        % Do not proceed if Hessian is not positive definite

        if ~all(eig(hessian_at_point) > 0)
            error('Hessian Matrix of function at point must be positive definite');
        end

        x_current = x_current - gamma*dot(inv(hessian_at_point), gradient_at_point);
        gradient_at_point = double(subs(grad_f, [x; y], x_current));
        hessian_at_point = double(subs(hess_f, [x; y], x_current));
        num_iters = num_iters + 1;
    end
elseif isstring(gamma)
    switch gamma
        case 'minimize'
            while norm(gradient_at_point) > epsilon

                if ~all(eig(hessian_at_point) > 0)
                    error('Hessian Matrix of function at point must be positive definite');
                end

                h = double(subs(f, [x; y], x_current - g*gradient_at_point)); 
                assume(g, 'positive');
                eq = gradient(h, g) == 0;
                sol = solve(eq, g, ReturnConditions=true, Real=true);
                gamma_min = min(double(sol.g));
                x_current = x_current - gamma_min*dot(inv(hessian_at_point), gradient_at_point);
                gradient_at_point = double(subs(gradient(f), [x; y], x_current));
                hessian_at_point = double(subs(hess_f, [x; y], x_current));
                num_iters = num_iters + 1;
            end
        case 'armijo'
    end
end

end