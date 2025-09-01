function [a, b] = bisectorDerivativeAlgorithm(a1, b1, l, df)
n = ceil(log(l/(b1-a1)) / log(0.5));
a = zeros(n, 1);
b = zeros(n, 1);
k  = 1;
a(1) = a1;
b(1) = b1;
while k < n
    x = (a(k)+b(k)) / 2;
    if df(x) == 0
        break
    elseif df(x) > 0
        a(k+1) = a(k);
        b(k+1) = x;
        k = k+1;
    elseif df(x) < 0
        a(k+1) = x;
        b(k+1) = b(k);
        k = k+1;
    end
end
end