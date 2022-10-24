function yy = newton(x, y, xx)
N = length(x);
d = y;
for  k = 1 : N-1
     for i = 1: N - k
          d(i) = (d(i+1) - d(i)) / (x(i+k) - x(i));
      end
end
yy = d(1) * ones(size(xx));
for k = 2 : N
     yy = d(k) + (xx - x(k)) .* yy;
end
end