syms x y;
f = x^3 * exp(-x^2-y^4);

% The initial points that will be used
[x_final, n] = newtonAlgorithm(f, [2; 1], 0.1, 10^-4);
