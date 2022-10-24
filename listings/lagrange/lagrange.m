function yy = lagrange(x, y, xx)
N = length(x);
z = zeros(size(xx));
for k = 1 : N
    t = 1;
    for j = [1 : k - 1 k + 1 : N]
        t = t * (x(k) - x(j));
    end
    z(k) = y(k) / t
end
w = ones(size(xx));
for k = 1 : N
    w = w.*(xx - x(k));
end
s = zeros(size(xx));
for k = 1 : N
    s = s + z(k)./(xx - x(k));
end
yy = w.*s;
end