% IVP
f = @(t,y) t.*exp(3*t) - 2*y;
y_exact_fun = @(t) ((5*t - 1).*exp(3*t) + exp(-2*t))/25;

% Parameters
h = 0.1;
t0 = 0;
tf = 1;
y0 = 0;

t = t0:h:tf;
N = length(t);

y_exact = y_exact_fun(t);

% Preallocate
euler = zeros(1,N);
taylor3 = zeros(1,N);
midpoint = zeros(1,N);
modified_euler = zeros(1,N);
rk4 = zeros(1,N);

% Initial conditions
euler(1) = y0;
taylor3(1) = y0;
midpoint(1) = y0;
modified_euler(1) = y0;
rk4(1) = y0;

% Numerical Methods
for i = 1:N-1

    % Euler
    euler(i+1) = euler(i) + h*f(t(i), euler(i));

    % Taylor Order 3
    yp = t(i)*exp(3*t(i)) - 2*taylor3(i);
    ypp = exp(3*t(i))*(1 + t(i)) + 4*taylor3(i);
    yppp = exp(3*t(i))*(4 + 7*t(i)) - 8*taylor3(i);

    taylor3(i+1) = taylor3(i) ...
        + h*yp ...
        + (h^2/2)*ypp ...
        + (h^3/6)*yppp;

    % Midpoint
    k1 = f(t(i), midpoint(i));
    k2 = f(t(i) + h/2, midpoint(i) + (h/2)*k1);
    midpoint(i+1) = midpoint(i) + h*k2;

    % Modified Euler
    y_predictor = modified_euler(i) + h*f(t(i), modified_euler(i));
    modified_euler(i+1) = modified_euler(i) + (h/2)*( ...
        f(t(i), modified_euler(i)) + f(t(i+1), y_predictor));

    % RK4
    k1 = f(t(i), rk4(i));
    k2 = f(t(i) + h/2, rk4(i) + (h/2)*k1);
    k3 = f(t(i) + h/2, rk4(i) + (h/2)*k2);
    k4 = f(t(i) + h, rk4(i) + h*k3);

    rk4(i+1) = rk4(i) + (h/6)*(k1 + 2*k2 + 2*k3 + k4);

end

% Final Error Table
Method = {'Euler'; 'Taylor Order 3'; 'Midpoint'; 'Modified Euler'; 'RK4'};

Final_y = [euler(end); taylor3(end); midpoint(end); modified_euler(end); rk4(end)];

Exact_y = y_exact_fun(1)*ones(5,1);

Absolute_Error = abs(Exact_y - Final_y);

Comparison_Table = table(Method, Final_y, Exact_y, Absolute_Error);

disp(Comparison_Table)

% Combined Plot
figure

plot(t, y_exact, 'k', 'LineWidth', 2)
hold on
plot(t, euler, 'o-', 'LineWidth', 1.3)
plot(t, taylor3, 's-', 'LineWidth', 1.3)
plot(t, midpoint, 'd-', 'LineWidth', 1.3)
plot(t, modified_euler, '^-', 'LineWidth', 1.3)
plot(t, rk4, 'x-', 'LineWidth', 1.3)

xlabel('t')
ylabel('y')
title('Comparison of IVP Numerical Methods')
legend('Exact Solution', 'Euler', 'Taylor Order 3', ...
    'Midpoint', 'Modified Euler', 'RK4', 'Location', 'northwest')
grid on

saveas(gcf, 'comparison_graph.png')

% Error Comparison Bar Chart
figure

bar(Absolute_Error)

set(gca, 'XTickLabel', Method)
xtickangle(30)

ylabel('Absolute Error at t = 1')
title('Final Error Comparison')
grid on

saveas(gcf, 'error_comparison.png')