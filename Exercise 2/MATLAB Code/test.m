syms x y g;
f = x^3*exp(-x^2-y^4);

grad = double(subs(gradient(f), [x; y], [1; 1]));
hess = double(subs(hessian(f), [x; y], [1; 1]));
eigs = eig(hess);
try
    r = chol(hess);
catch
    disp('Hessian Matrix must be positively definite');
end
h = subs(f, [x; y], [1; 1] - g * grad);
assume(g, 'positive');
eq = gradient(h, g) == 0;
sol = solve(eq, ReturnConditions=true, Real=true);

