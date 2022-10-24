clear all;
folder = 'second';
% Интервал [a,b]
a = -pi;
b = pi/2;
k = 1000; % Количество точек
h = (b - a) / (k - 1); % Шаг
x = a : h : b; % Массив точек
y = sin(x); % Функция
xN(1) = x(1);
yN(1) = y(1);
m = 15;
for i = 1 : m
    W = vander(xN);
    A = inv(W) * yN';
    P = polyval(A, x);
    pogr(i) = max(abs(y - P));
    hx = (b - a) / i;
    for j = 1 : i
        xN(j + 1) = xN(j) + hx;
    end
    yN = sin(xN);
    saveas(plot(x, abs(y - P), 'b'), strcat(folder, '/plot', int2str(i), '.png'));
end
saveas(plot(log10(pogr), 'r'), strcat(folder, '/pogr', '.png'));