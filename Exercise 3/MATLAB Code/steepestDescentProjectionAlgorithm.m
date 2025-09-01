function [x_current, num_iters] = steepestDescentProjectionAlgorithm(f, x_initial, x1_bound, x2_bound, gamma, s, epsilon, oscillation_breakpoint)
% Steepest descent algorithm with projection
syms x1 x2;

x_current = x_initial;
gradient_at_point = double(subs(gradient(f), [x1;x2], x_current));
num_iters = 1;
n_oscillations = 0;
while norm(gradient_at_point) > epsilon 
    % Check if x_current is feasible, else project it to the feasible space
    % X formed by the bounding restrictions
    x_tmp = x_current(:, end) - s*gradient_at_point;
    if ~isFeasible(x_tmp, x1_bound, x2_bound)
        x_bar = projectToX(x_tmp, x1_bound, x2_bound);
        x_current(:, end+1) = x_current(:, end) + gamma*(x_bar - x_current(:, end));
    else
        x_current(:, end+1) = x_tmp;
    end
    gradient_at_point = double(subs(gradient(f), [x1; x2], x_current(:, end)));
    num_iters = num_iters + 1; 
    % Check if the points are oscillating, if we have 10 or more
    % oscillations the algorithm ends. The oscillations are checked by the
    % equality in euclidean distances of consecutive points
    if num_iters > oscillation_breakpoint + 1
        for i = 0:(oscillation_breakpoint-1)
            if norm(x_current(:, end-i) - x_current(:, end-i-1)) == norm(x_current(:, end-i-1) - x_current(:, end-i-2))
                n_oscillations = n_oscillations+1;
            end
        end
    end
    if n_oscillations >= oscillation_breakpoint
        return
    else
        n_oscillations = 0;
    end
            

end
end