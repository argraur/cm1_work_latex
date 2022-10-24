x = 1 : 2 : 9;
y = sin(x);
xx = linspace(1, 9, 1000);
yy = newton(x, y, xx);
figure('Color', 'w')
fplot(@sin, [1 9])
hold on
plot(xx, yy, 'r')
plot(x, y, 'bo')