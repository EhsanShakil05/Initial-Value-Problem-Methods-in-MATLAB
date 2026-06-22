clc;
clear;
close all;

% IVP
f = @(t,y) t.*exp(3*t) - 2*y;
y_exact_fun = @(t) ((5*t - 1).*exp(3*t) + exp(-2*t))/25;

% Step sizes
h_values = [0.2 0.1 0.05 0.025];

% Store final errors
euler_error = zeros(size(h_values));
taylor3_error = zeros(size(h_values));
midpoint_error = zeros(size(h_values));
modified_euler_error = zeros(size(h_values));
rk4_error = zeros(size(h_values));

for j = 1:length(h_values)

    h = h_values(j);
    t0 = 0;
    tf = 1;
    y0 = 0;

    t = t0:h:tf;
    N = length(t);

    euler = zeros(1,N);
    taylor3 = zeros(1,N);
    midpoint = zeros(1,N);
    modified_euler = zeros(1,N);
    rk4 = zeros(1,N);

    euler(1) = y0;
    taylor3(1) = y0;
    midpoint(1) = y0;
    modified_euler(1) = y0;
    rk4(1) = y0;

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

    exact_final = y_exact_fun(1);

    euler_error(j) = abs(exact_final - euler(end));
    taylor3_error(j) = abs(exact_final - taylor3(end));
    midpoint_error(j) = abs(exact_final - midpoint(end));
    modified_euler_error(j) = abs(exact_final - modified_euler(end));
    rk4_error(j) = abs(exact_final - rk4(end));

end

% Convergence Table
Convergence_Table = table(h_values', euler_error', taylor3_error', ...
    midpoint_error', modified_euler_error', rk4_error', ...
    'VariableNames', {'h','Euler','Taylor_Order3','Midpoint', ...
    'Modified_Euler','RK4'});

disp(Convergence_Table)

% Convergence Plot
figure

loglog(h_values, euler_error, 'o-', 'LineWidth', 1.5)
hold on
loglog(h_values, taylor3_error, 's-', 'LineWidth', 1.5)
loglog(h_values, midpoint_error, 'd-', 'LineWidth', 1.5)
loglog(h_values, modified_euler_error, '^-', 'LineWidth', 1.5)
loglog(h_values, rk4_error, 'x-', 'LineWidth', 1.5)

xlabel('Step Size h')
ylabel('Absolute Error at t = 1')
title('Convergence Study')
legend('Euler', 'Taylor Order 3', 'Midpoint', ...
    'Modified Euler', 'RK4', 'Location', 'best')
grid on

saveas(gcf, 'convergence_study.png')