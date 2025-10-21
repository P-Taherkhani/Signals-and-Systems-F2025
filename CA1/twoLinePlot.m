clc, clearvars;

figure;

t = 0:0.001:2 * pi;
plot(t, sin(t));

hold on;

plot(t, cos(t), "Color","Red");
xlabel("Time");
ylabel("Function Value");
title("Sine and Cosine Signals");
legend("Sin", "Cos");

xlim([0, 2 * pi]);
ylim([-1.4, 1.4]);