function x_proj = projectToX(x, x1_bound, x2_bound)
% Function that projects a non-feasible point x to the boundary of the
% feasible space X (where X is a 2 dimensional rectangle)
if x(1) <= min(x1_bound)
    x1_proj = min(x1_bound);
elseif x(1) > min(x1_bound) && x(1) < max(x1_bound)
    x1_proj = x(1);
elseif x(1) >= max(x1_bound)
    x1_proj = max(x1_bound);
end

if x(2) <= min(x2_bound)
    x2_proj = min(x2_bound);
elseif x(2) > min(x2_bound) && x(2) < max(x2_bound)
    x2_proj = x(2);
elseif x(2) >= max(x2_bound)
    x2_proj = max(x2_bound);
end

x_proj = [x1_proj; x2_proj];
end
