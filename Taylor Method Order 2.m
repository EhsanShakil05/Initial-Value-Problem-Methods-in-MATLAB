% y′=te^(3t)−2y, y(0)=0, 0≤t≤1, h=0.1

% y"=3te^(3t)+e^(3t)-2y′
% y"=e^(3t)(3t+1)-e^(3t)(2t)+4y
% y"=e^(3t)(t+1)+4y

% Problem
f = @(t,y) t*exp(3*t) - 2*y;
fy = @(t,y) (t+1).*exp(3*t) + 4*y;

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

% Taylor Method Order 2
for i = 1:N

    y1 = f(t(i),y(i));
    y2 = fy(t(i),y(i));
    y(i+1) = y(i) + h*y1 + y2*h^2/2;
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
title('Taylor Method Order 2 vs Exact Solution')
legend('Exact Solution','Taylor Method Order 2')
grid on