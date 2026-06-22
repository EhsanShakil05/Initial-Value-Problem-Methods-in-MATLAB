% y′=te^(3t)−2y, y(0)=0, 0≤t≤1, h=0.1

% Problem
f = @(t,y) t*exp(3*t) - 2*y;

% Exact Solution
y_sol = @(t) 1/25*((5*t-1).*exp(3*t) + exp(-2*t));

% Parameters
a = 0;
b = 1;
y0 = 0;
h = 0.1;

% Steps
N = (b-a)/h;

% Arrays
t = a:h:b;
y = zeros(1,N+1);

% Initial Condition
y(1) = y0;

% RK4 Method
for i = 1:N
    k1 = h*f(t(i),y(i));
    k2 = h*(f(t(i)+h/2,y(i)+k1/2));
    k3 = h*(f(t(i)+h/2,y(i)+k2/2));
    k4 = h*(f(t(i)+h,y(i)+k3));
    y(i+1) = y(i) + (1/6)*(k1+2*k2+2*k3+k4);
end

% Exact Solution
y_exact = y_sol(t);

% Absolute Error
error = abs(y-y_exact);

% Results Table
fprintf('t\t y\t\t y_exact\t error\n')
for j = 1:N
    fprintf('%.1f\t %.6f\t %.6f\t %.6f\n', t(j), y(j), y_exact(j), error(j))
end

% Plot
figure;

plot(t,y_exact,'k','LineWidth',2)
hold on

plot(t,y,'ro-','LineWidth',1.5)

xlabel('t')
ylabel('y')
title('Runge-Kutte Order 4 Method vs Exact Solution')
legend('Exact Solution','Runge-Kutte Order 4 Method')
grid on