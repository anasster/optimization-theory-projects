% Demo for the 3rd question of the project

syms x1 x2;
f = 1/3*x1^2+3*x2^2;
x1_bounds = [-10; 5];
x2_bounds = [-8; 12];
x_initial = [-5; 10];

[x_current, n_iters] = steepestDescentProjectionAlgorithm(f, x_initial, x1_bounds, x2_bounds, 0.1, 15, 0.01, 10);
f_values = [];
for i=1:n_iters
    f_values(end+1) = double(subs(f, [x1; x2], x_current(:, i)));
end

set(groot, 'defaultTextInterpreter', 'latex');
[X1, X2] = meshgrid(-15:0.1:15, -15:0.1:15);

figure;
subplot(1, 2, 1);

scatter(1:n_iters, f_values, 'filled', 'o', MarkerFaceColor=[0.545 0.055 0.749]);
hold on;
plot(1:n_iters, f_values, LineWidth=2, Color=[0.545 0.055 0.749]);
hold off;
xlabel('$N_{iterations}$', FontSize=28);
ylabel('$f(x_1,x_2)$', FontSize=28);
title("Values of $f$ during the algorithm's iterations", FontSize=20);

subplot(1, 2, 2);
hold on;
scatter(x_current(1, :), x_current(2, :), 'filled', 'o', MarkerFaceColor=[0.545 0.055 0.749]);
plot(x_current(1, :), x_current(2, :), Color=[0.545 0.055 0.749], LineWidth=2);
contour(X1, X2, double(subs(f, {x1, x2}, {X1, X2})), 200);
xlabel('$x_1$', FontSize=28);
ylabel('$x_2$', FontSize=28);
title('Convergence of Steepest Descent algorithm with projection for initial point $(x_1,x_2)=(-5,10)$', FontSize=20);
colorbar;
hold off

sgtitle('Steepest Descent with projection results for f with $\gamma_k=0.1$, $s_k=15$, $\epsilon=0.01$', fontsize=20);
