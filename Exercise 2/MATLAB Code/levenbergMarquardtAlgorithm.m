function [x_current, num_iters] = levenbergMarquardtAlgorithm(f, x_initial, gamma, epsilon)
x_current = x_initial;
grad_f = gradient(f, [x; y]);
hess_f = hessian(f, [x; y]);
gradient_at_point = double(subs(grad_f, [x; y], x_current));
hessian_at_point = double(subs(hess_f, [x; y], x_current));
num_iters = 0;
m = 0;
if ~all(eig(hessian_at_point) > 0)
    
end