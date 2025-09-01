function [a, b] = bisectorAlgorithm(a1, b1, l, epsilon, f)
a = zeros(0);
b = zeros(0);
a(end+1) = a1;
b(end+1) = b1;
while abs(b(end)-a(end)) >= l && l > 2*epsilon
    x1_k = (a(end)+b(end))/2 - epsilon;
    x2_k = (a(end)+b(end))/2 + epsilon;
    if f(x1_k) < f(x2_k)
        a(end+1) = a(end);
        b(end+1) = x2_k;
    else
        a(end+1) = x1_k;
        b(end+1) = b(end);
    end
end
end