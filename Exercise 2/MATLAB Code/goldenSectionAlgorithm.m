function [a, b] = goldenSectionAlgorithm(f, a1, b1, l)
syms x;
gamma = 0.618;
a = a1;
b = b1;
x1_k = a + (1-gamma) * (b-a);
x2_k = a + gamma * (b-a);
while abs(b-a) >= l
    if double(subs(f, x, x1_k)) > double(subs(f, x, x2_k))
        a = x1_k;
        x1_k = x2_k;
        x2_k = a + gamma * (b-a);
    else
        b = x2_k;
        x2_k = x1_k;
        x1_k = a + (1-gamma) * (b-a);
    end
end
end