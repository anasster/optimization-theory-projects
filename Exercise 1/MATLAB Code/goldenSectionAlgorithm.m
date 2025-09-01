function [a, b] = goldenSectionAlgorithm(a1, b1, l, f)
gamma = 0.618;
a = zeros(0);
b = zeros(0);
a(end+1) = a1;
b(end+1) = b1;
x1_k = a(1) + (1-gamma) * (b(1)-a(1));
x2_k = a(1) + gamma * (b(1)-a(1));
while abs(b(end)-a(end)) >= l
    if f(x1_k(end)) > f(x2_k(end))
        a(end+1) = x1_k(end);
        b(end+1) = b(end);
        x1_k(end+1) = x2_k(end);
        x2_k(end+1) = a(end) + gamma * (b(end)-a(end));
    else
        a(end+1) = a(end);
        b(end+1) = x2_k(end);
        x2_k(end+1) = x1_k(end);
        x1_k(end+1) = a(end) + (1-gamma) * (b(end)-a(end));
    end
end
end