% Script where the function is plotted

syms x1 x2;
f = 1/3*x1^2+3*x2^2;

[X1, X2] = meshgrid(-1:0.02:1, -1:0.02:1);
Z = double(subs(f, {x1, x2}, {X1, X2}));

% Surface plot
figure;
subplot(1, 2, 1);
surf(X1, X2, Z);
xlabel('$x_1$', 'Interpreter','latex');
ylabel('$x_2$', 'Interpreter','latex');
zlabel('$f(x_1,x_2)$', 'Interpreter','latex');
title('Surface plot of the function', 'Interpreter','latex', FontSize=26);
colorbar;

% Contour plot
subplot(1, 2, 2);
contour(X1, X2, Z, 200);
xlabel('$x_1$', 'Interpreter','latex');
ylabel('$x_2$', 'Interpreter','latex');
title('Contour plot of the function', 'Interpreter','latex', FontSize=26);
colorbar;

sgtitle('Plot of $f(x_1,x_2)=\frac{1}{3} \cdot x_{1}^{2}+3 \cdot x_{2}^{2}$', 'Interpreter', 'latex', fontsize=26);