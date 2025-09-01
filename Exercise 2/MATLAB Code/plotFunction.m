f = @(x, y) x.^3 .* exp(-x.^2 - y.^4);

x = -3:0.1:3;
y = -3:0.1:3;
[X, Y] = meshgrid(x, y);
figure;
subplot(1, 2, 1);
surf(X, Y, f(X, Y));
xlabel('x');
ylabel('y');
zlabel('f(x, y)');
colorbar;
title('3-D plot of the function');
subplot(1, 2, 2);
contour(X, Y, f(X, Y), 50);
xlabel('x');
ylabel('y');
colorbar;
contourTitle = sprintf('Contour plot of the function\n(N = 50 levels)');
title(contourTitle);
sgtitle('Plots of f(x,y)=x^3*exp(-x^2-y^4)');

