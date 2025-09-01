% Demo for Golden Sector Algorithm

% Definition of the functions and interval
syms f1(x) f2(x) f3(x)
f1(x) = (x-1)^3 + (x-4)^2 * cos(x);
f2(x) =  exp(-2*x) + (x-2)^2;
f3(x) = x^2*log(0.5*x) + sin(0.2*x)^2;
df1 = diff(f1, x);
df2 = diff(f2, x);
df3 = diff(f3, x);
df1 = matlabFunction(df1, 'Vars', {x});
df2 = matlabFunction(df2, 'Vars', {x});
df3 = matlabFunction(df3, 'Vars', {x});

a0 = 0;
b0 = 3;

l_var = 0.02:-0.001:2*epsilon_const+0.001;
% Variables to store the search intervals
a_f1_2 = cell(1, numel(l_var));
b_f1_2 = cell(1, numel(l_var));
a_f2_2 = cell(1, numel(l_var));
b_f2_2 = cell(1, numel(l_var));
a_f3_2 = cell(1, numel(l_var));
b_f3_2 = cell(1, numel(l_var));
for i = 1:numel(l_var)
    [a_f1_tmp, b_f1_tmp] = bisectorDerivativeAlgorithm(a0, b0, l_var(i), df1);
    [a_f2_tmp, b_f2_tmp] = bisectorDerivativeAlgorithm(a0, b0, l_var(i), df2);
    [a_f3_tmp, b_f3_tmp] = bisectorDerivativeAlgorithm(a0, b0, l_var(i), df3);
    a_f1_2{i} = a_f1_tmp;
    a_f2_2{i} = a_f2_tmp;
    a_f3_2{i} = a_f3_tmp;
    b_f1_2{i} = b_f1_tmp;
    b_f2_2{i} = b_f2_tmp;
    b_f3_2{i} = b_f3_tmp;
    
end

a_f1_2_final = NaN(numel(a_f1_2), 1);
a_f2_2_final = NaN(numel(a_f2_2), 1);
a_f3_2_final = NaN(numel(a_f3_2), 1);
b_f1_2_final = NaN(numel(b_f1_2), 1);
b_f2_2_final = NaN(numel(b_f2_2), 1);
b_f3_2_final = NaN(numel(b_f3_2), 1);

for i = 1:numel(a_f1_2)
    a_tmp_1 = a_f1_2{i};
    a_tmp_2 = a_f2_2{i};
    a_tmp_3 = a_f3_2{i};
    b_tmp_1 = b_f1_2{i};
    b_tmp_2 = b_f2_2{i};
    b_tmp_3 = b_f3_2{i};
    a_f1_2_final(i) = a_tmp_1(end);
    a_f2_2_final(i) = a_tmp_2(end);
    a_f3_2_final(i) = a_tmp_3(end);
    b_f1_2_final(i) = b_tmp_1(end);
    b_f2_2_final(i) = b_tmp_2(end);
    b_f3_2_final(i) = b_tmp_3(end);
end

figure;
subplot(1, 3, 1);
plot(l_var, a_f1_2_final, 'b-o', LineWidth=2, DisplayName='a_k', MarkerFaceColor='b');
hold on
plot(l_var, b_f1_2_final, 'r-o', LineWidth=2, DisplayName='b_k', MarkerFaceColor='r');
legend('show');
title("f_1(x) = (x-1)^3+(x-4)^2*cos(x)");
xlabel('l');
ylabel('Decision interval');

subplot(1, 3, 2);
plot(l_var, a_f2_2_final, 'b-o', LineWidth=2, DisplayName='a_k', MarkerFaceColor='b');
hold on
plot(l_var, b_f2_2_final, 'r-o', LineWidth=2, DisplayName='b_k', MarkerFaceColor='r');
legend('show');
title("f_2(x) = exp(-2x)+(x-2)^2");
xlabel('l');
ylabel('Decision interval');

subplot(1, 3, 3);
plot(l_var, a_f3_2_final, 'b-o', LineWidth=2, DisplayName='a_k', MarkerFaceColor='b');
hold on
plot(l_var, b_f3_2_final, 'r-o', LineWidth=2, DisplayName='b_k', MarkerFaceColor='r');
legend('show');
title("f_3(x) = x^2*ln(0.5x)+sin^2(0.2x)");
xlabel('l');
ylabel('Decision interval');

sgtitle('Bisector Derivative Algorithm - Varying l');

% III. Plot a(k) and b(k) for many l values
l_var_2 = 0.02:-0.004:0.0021;
functions = {df1, df2, df3};
for i = 1:numel(functions)
    figure;
    sgtitle('Bisector Derivative Algorithm - Variations of a_k and b_k for f_'+string(i));
    for j = 1:numel(l_var_2)
        [a, b] = bisectorDerivativeAlgorithm(a0, b0, l_var_2(j), functions{i});
        k = 1:numel(a);
        subplot(2, ceil(numel(l_var_2)/2), j);
        plot(k, a, 'b-o', LineWidth=2, DisplayName='a(k)', MarkerFaceColor='b');
        hold on
        plot(k, b, 'r-o', LineWidth=2, DisplayName='b(k)', MarkerFaceColor='r');
        hold off
        xlabel('k-th iteration');
        ylabel('a_k | b_k');
        legend('show');
        title('Variation of a_k, and b_k for l = '+string(l_var_2(j)));
    end
end