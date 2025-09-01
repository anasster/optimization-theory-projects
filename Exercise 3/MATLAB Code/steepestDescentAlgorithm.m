function [x_current, num_iters] = steepestDescentAlgorithm(f, x_initial, gamma, epsilon, a, b, s)
% Function that utilizes the steepest descent algorithm on 3 different
% occasions:
% 1. By the user's choice of the step gamma
% 2. The algorithm chooses the gamma in order to minimize a certain
% expression
% 3. By using Armijo's rule

syms x1 x2 g;

% Initialize values
x_current = x_initial;
grad_f = gradient(f, [x1; x2]);
gradient_at_point = double(subs(grad_f, [x1; x2], x_current(:, end)));
d = gradient_at_point;
num_iters = 0;

% 1. User's choice
if isnumeric(gamma)
    while norm(gradient_at_point) > epsilon
        x_current(:, end+1) = x_current(:, end) - gamma*d;
        gradient_at_point = double(subs(grad_f, [x1; x2], x_current(:, end)));
        d = gradient_at_point;
        num_iters = num_iters + 1;
    end

% 2. Minimization
elseif isequal(gamma, 'minimize')
    while norm(gradient_at_point) > epsilon
        h = subs(f, [x1; x2], x_current(:, end) - g*d); 
        assume(g, 'positive');
        eq = gradient(h, g) == 0;
        sol = solve(eq, g, ReturnConditions=true, Real=true);
        gamma_min = min(double(sol.g));
        x_current(:, end+1) = x_current(:, end) - gamma_min*d;
        gradient_at_point = double(subs(gradient(f), [x1; x2], x_current(:, end)));
        d = gradient_at_point;
        num_iters = num_iters + 1;
    end

% 3. Armijo's rule
elseif isequal(gamma, 'armijo')
    while norm(gradient_at_point) > epsilon
        m = 0;
        gamma_armijo = s*b^m;
        x_tmp = x_current(:, end) - gamma_armijo*d;
        while double(subs(f, [x1; x2], x_current(:, end))) - double(subs(f, [x1; x2], x_tmp)) < -a*gamma_armijo*dot(d, gradient_at_point)
            m = m+1;
            gamma_armijo = s*b^m;
            x_tmp = x_current(:, end) - gamma_armijo*d;
        end
        x_current(:, end+1) = x_tmp;
        gradient_at_point = double(subs(gradient(f), [x1; x2], x_current(:, end)));
        d = gradient_at_point;
        num_iters = num_iters + 1;
    end
else
    error('Parameter gamma must either be numeric, or "minimize" or "armijo".');
end
end
