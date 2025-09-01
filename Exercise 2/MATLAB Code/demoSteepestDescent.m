% Demo script for the Steepest Descent algorithm

% Define the function
syms x y;
f = x^3 * exp(-x^2-y^4);

% The initial points that will be used
[x_final, n] = steepestDescentAlgorithm(f, [-1; -1], 0.1, 10^-4);
