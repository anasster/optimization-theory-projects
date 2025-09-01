function feasible = isFeasible(x, x1_bound, x2_bound)
% Function to check if a point x is feasible for a rectangular bounding box
% in R2
feasible = true;
if x(1) < min(x1_bound) || x(1) > max(x1_bound) || x(2) < min(x2_bound) || x(2) > max(x2_bound)
    feasible = false;
end
end