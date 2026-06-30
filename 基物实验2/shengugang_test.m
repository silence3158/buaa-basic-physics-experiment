% 定义数据点
x = [80.096 90.033 95.061 100.042 105.019 110.057 120.023 97.526 102.58 98.714 98.014];
y = [7.0 8.0 8.2 8.5 8.0 7.1 4.8 8.6 8.2 8.6 8.7];

% 使用二次多项式进行拟合
P = polyfit(x, y, 2);


% 拟合曲线系数
a = P(1);
b = P(2);
c = P(3);

% 找二次曲线顶点，也就是最大值位置
x_peak = -b / (2*a);
y_peak = polyval(P, x_peak);

% 计算 y_peak / sqrt(2)
y_target = y_peak / sqrt(2);

% 解方程 ax^2 + bx + c = y_target
% 即 ax^2 + bx + (c - y_target) = 0
x_cross = roots([a, b, c - y_target]);

% 两个交点
x1 = min(x_cross);
x2 = max(x_cross);

% 计算 delta x
delta_x = x2 - x1;

% 输出结果
fprintf('峰值位置 x_peak = %.4f\n', x_peak);
fprintf('峰值 y_peak = %.4f\n', y_peak);
fprintf('y_peak/sqrt(2) = %.4f\n', y_target);
fprintf('左交点 x1 = %.4f\n', x1);
fprintf('右交点 x2 = %.4f\n', x2);
fprintf('delta x = %.4f\n', delta_x);

xi = 50:0.2:130;
yi = polyval(P, xi);

plot(xi, yi, 'b-', x, y, 'r*');
hold on;

yline(y_target, '--k', 'y_{max}/sqrt(2)');
xline(x1, '--r', 'x_1');
xline(x2, '--r', 'x_2');

xlabel('超声波频率/MHz');
ylabel('光强/小格');
title('二次拟合曲线');
grid on;

legend('拟合曲线', '实验数据', 'y_{max}/sqrt(2)', 'x_1/x_2');