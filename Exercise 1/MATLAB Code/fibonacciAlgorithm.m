function [a, b] = fibonacciAlgorithm(a1, b1, l, epsilon, f)
i = 1;
n = 1;
while fibonacci(i) <= (b1-a1)/l
    n = n+1;
    i = i+1;
end
a = zeros(n, 1);
b = zeros(n, 1);
a(1) = a1;
b(1) = b1;
x1 = zeros(n);
x2 = zeros(n);
x1(1) = a(1) + fibonacci(n-2) / fibonacci(n) * (b(1)-a(1));
x2(1) = a(1) + fibonacci(n-1) / fibonacci(n) * (b(1)-a(1));
k = 1;
while k <= n
    if f(x1(k)) > f(x2(k))
        a(k+1) = x1(k);
        b(k+1) = b(k);
        x1(k+1) = x2(k);
        x2(k+1) = a(k+1) + fibonacci(n-k-1) / fibonacci(n-k) * (b(k+1) - a(k+1));
    else
        a(k+1) = a(k);
        b(k+1) = x2(k);
        x2(k+1) = x1(k);
        x1(k+1) = a(k+1) + fibonacci(n-k-2) / fibonacci(n-k) * (b(k+1) - a(k+1));
    end

    if k == n-2
        x1(n) = x1(n-1);
        x2(n) = x1(n-1) + epsilon;
        if f(x1(n)) > f(x2(n))
            a(n) = x1(n);
            b(n) = b(n-1);
            break;
        else
            a(n) = a(n-1);
            b(n) = x2(n);
            break
        end
    else
        k = k+1;
    end
end
end