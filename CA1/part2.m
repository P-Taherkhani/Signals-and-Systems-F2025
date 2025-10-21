%% Part 2 - Linear System Identification
clc; clear; close all;

% Load the given data
load('p2.mat');

%% 2-1 Plot x(t)
figure;
plot(t, x, 'LineWidth', 1.2);
xlabel('t'); 
ylabel('x(t)');
title('Input Signal x(t)');
grid on;

%% 2-2 Plot y(t)
figure;
plot(t, y, 'LineWidth', 1.2);
xlabel('t'); 
ylabel('y(t)');
title('Output Signal y(t)');
grid on;

%% 2-3 Scatter Plot y vs x
figure;
plot(x, y, '.', 'MarkerSize', 8);
xlabel('x(t)');
ylabel('y(t)');
title('y vs x');
grid on;

%% 2-4 Estimating alpha and beta
[alpha, beta] = p2_4(x, y);
figure;
plot(x, y, '.');
xlabel("x");
ylabel("y");
title("y vs x and fitted curve");
hold on;
t1 = -1:0.001:1;
plot(t1, alpha .* t1 + beta, "Color", "Red", "LineWidth", 2);
legend("Data", "Fitted line");

fprintf('Estimated alpha = %.3f\n', alpha);
fprintf('Estimated beta  = %.3f\n', beta);
