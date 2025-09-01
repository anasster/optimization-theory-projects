% Script for plotting the functions
f1 = @(x) (x-1).^3 + (x-4).^2.*cos(x);
f2 = @(x) exp(-2*x) + (x-2).^2;
f3 = @(x) x.^2.*log(0.5*x) + sin(0.2*x).^2;

x = linspace(0, 3, 1000);
figure;
subplot(1, 3, 1);
plot(x, f1(x), 'r', LineWidth=2);
title('f_1(x) = (x-1)^3 + (x-4)^2cos(x)');
xlabel('x');
ylabel('f_1(x)');

subplot(1, 3, 2);
plot(x, f2(x), 'b', LineWidth=2);
title('f_2(x) = exp(-2x) + (x-2)^2');
xlabel('x');
ylabel('f_2(x)');

subplot(1, 3, 3);
plot(x, f3(x), 'g', LineWidth=2);
title('f_3(x) = x^2ln(0.5x) + sin^2(0.2x)');
xlabel('x');
ylabel('f_3(x)');

sgtitle('Function Plots');