% Demo for the first question of Workshop 3 (Optimization Techniques)

syms x1 x2;
f = 1/3*x1^2 + 3*x2^2;

% Steepest Descent Algorithm for a random initial point other than (0, 0)
% and several vallues of gamma
[x_choice_1, n_iters_1] = steepestDescentAlgorithm(f, [10;-10], 0.1, 0.001, NaN, NaN, NaN);
[x_choice_2, n_iters_2] = steepestDescentAlgorithm(f, [10;-10], 0.3, 0.001, NaN, NaN, NaN);
[x_choice_3, n_iters_3] = steepestDescentAlgorithm(f, [10;-10], 3, 0.001, NaN, NaN, NaN);
[x_choice_4, n_iters_4] = steepestDescentAlgorithm(f, [10;-10], 5, 0.001, NaN, NaN, NaN);

f_values_1 = [];
f_values_2 = [];
f_values_3 = [];
f_values_4 = [];
for i=1:length(x_choice_1)
    f_values_1(end+1) = double(subs(f, [x1;x2], x_choice_1(:,i)));
end
for i=1:length(x_choice_2)
    f_values_2(end+1) = double(subs(f, [x1;x2], x_choice_2(:,i)));
end
for i=1:length(x_choice_3)
    f_values_3(end+1) = double(subs(f, [x1;x2], x_choice_3(:,i)));
end
for i=1:length(x_choice_4)
    f_values_4(end+1) = double(subs(f, [x1;x2], x_choice_4(:,i)));
end



% Plotting the results
set(groot, 'defaultTextInterpreter', 'latex');
[X1, X2] = meshgrid(-12:0.1:12, -12:0.1:12);

figure;
subplot(1, 2, 1);
scatter(1:(n_iters_1+1), f_values_1, 'filled', 'o', MarkerFaceColor=[0.749 0.055 0.071]);
hold on;
plot(1:(n_iters_1+1), f_values_1, LineWidth=2, Color=[0.749 0.055 0.071]);
hold off;
xlabel('$N_{iterations}$', FontSize=28);
ylabel('$f(x_1,x_2)$', FontSize=28);
title("Values of $f$ during the algorithm's iterations", FontSize=20);

subplot(1, 2, 2);
hold on;
s1 = scatter(x_choice_1(1, :), x_choice_1(2, :), 'filled', 'o', MarkerFaceColor=[0.749 0.055 0.071]);
plot(x_choice_1(1, :), x_choice_1(2, :), Color=[0.749 0.055 0.071], LineWidth=2);

contour(X1, X2, double(subs(f, {x1, x2}, {X1, X2})), 200);
hold off;

xlabel('$x_1$', FontSize=28);
ylabel('$x_2$', FontSize=28);
title('Convergence of Steepest Descent algorithm for initial point $(x_1,x_2)=(10,-10)$', FontSize=20);
colorbar;

sgtitle('Steepest Descent results for f with $\gamma_k=0.1$', fontsize=20);



figure;
subplot(1, 2, 1);
scatter(1:(n_iters_2+1), f_values_2, 'filled', 'o', MarkerFaceColor=[0.545 0.055 0.749]);
hold on;
plot(1:(n_iters_2+1), f_values_2, LineWidth=2, Color=[0.545 0.055 0.749]);
hold off;
xlabel('$N_{iterations}$', FontSize=28);
ylabel('$f(x_1,x_2)$', FontSize=28);
title("Values of $f$ during the algorithm's iterations", FontSize=20);

subplot(1, 2, 2);
hold on;
s1 = scatter(x_choice_2(1, :), x_choice_2(2, :), 'filled', 'o', MarkerFaceColor=[0.545 0.055 0.749]);
plot(x_choice_2(1, :), x_choice_2(2, :), Color=[0.545 0.055 0.749], LineWidth=2);

contour(X1, X2, double(subs(f, {x1, x2}, {X1, X2})), 200);
hold off;

xlabel('$x_1$', FontSize=28);
ylabel('$x_2$', FontSize=28);
title('Convergence of Steepest Descent algorithm for initial point $(x_1,x_2)=(10,-10)$', FontSize=20);
colorbar;

sgtitle('Steepest Descent results for f with $\gamma_k=0.3$', fontsize=20);




figure;
subplot(1, 2, 1);
scatter(1:(n_iters_3+1), f_values_3, 'filled', 'o', MarkerFaceColor=[0.192 0.831 0.118]);
hold on;
plot(1:(n_iters_3+1), f_values_3, LineWidth=2, Color=[0.192 0.831 0.118]);
hold off;
xlabel('$N_{iterations}$', FontSize=28);
ylabel('$f(x_1,x_2)$', FontSize=28);
title("Values of $f$ during the algorithm's iterations", FontSize=20);

subplot(1, 2, 2);
hold on;
s1 = scatter(x_choice_3(1, :), x_choice_3(2, :), 'filled', 'o', MarkerFaceColor=[0.192 0.831 0.118]);
plot(x_choice_3(1, :), x_choice_3(2, :), Color=[0.192 0.831 0.118], LineWidth=2);

contour(X1, X2, double(subs(f, {x1, x2}, {X1, X2})), 200);
hold off;

xlabel('$x_1$', FontSize=28);
ylabel('$x_2$', FontSize=28);
title('Convergence of Steepest Descent algorithm for initial point $(x_1,x_2)=(10,-10)$', FontSize=20);
colorbar;

sgtitle('Steepest Descent results for f with $\gamma_k=3$', fontsize=20);




figure;
subplot(1, 2, 1);
scatter(1:(n_iters_4+1), f_values_4, 'filled', 'o', MarkerFaceColor=[0.961 0.945 0]);
hold on;
plot(1:(n_iters_4+1), f_values_4, LineWidth=2, Color=[0.961 0.945 0]);
hold off;
xlabel('$N_{iterations}$', FontSize=28);
ylabel('$f(x_1,x_2)$', FontSize=28);
title("Values of $f$ during the algorithm's iterations", FontSize=20);

subplot(1, 2, 2);
hold on;
s1 = scatter(x_choice_4(1, :), x_choice_4(2, :), 'filled', 'o', MarkerFaceColor=[0.961 0.945 0]);
plot(x_choice_4(1, :), x_choice_4(2, :), Color=[0.961 0.945 0], LineWidth=2);

contour(X1, X2, double(subs(f, {x1, x2}, {X1, X2})), 200);
hold off;

xlabel('$x_1$', FontSize=28);
ylabel('$x_2$', FontSize=28);
title('Convergence of Steepest Descent algorithm for initial point $(x_1,x_2)=(10,-10)$', FontSize=20);
colorbar;

sgtitle('Steepest Descent results for f with $\gamma_k=5$', fontsize=20);
