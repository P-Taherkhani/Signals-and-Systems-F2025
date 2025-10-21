%% Part 3 : Radar Distance Estimation via Correlation
clc; clear; close all;

%% Parameters
c  = 3e8;
ts = 1e-9;
T  = 1e-5;
tau = 1e-6;
t = 0:ts:T;

alpha = 0.5;
R_true = 450;
td = 2 * R_true / c;
index = round(tau / ts);

%% 3-1: Transmitted Signal
x = zeros(size(t));
x(1:index) = 1;

figure;
plot(t * 1e6, x, 'LineWidth', 2);
xlabel('Time [\mus]'); 
ylabel('Amplitude');
title('Transmitted Rectangular Pulse x(t)');
xlim([0 T * 1e6]); 
ylim([-0.2 1.2]); 
grid on;

%% 3-2: Received Signal
startIndex = round(td / ts);
y = zeros(size(t));
y(startIndex+1:startIndex+index) = alpha;

figure;
plot(t * 1e6, x, 'b', 'LineWidth', 2); 
hold on;
plot(t * 1e6, y, 'r', 'LineWidth', 2);
xlabel('Time [\mus]'); ylabel('Amplitude');
legend('x(t)', 'y(t)');
title('Transmitted and Received Signals');
xlim([0 T * 1e6]); ylim([-0.2 1.2]); 
grid on;

%% 3-3: Correlation Function
corrVals = zeros(size(t));
finalIndex = length(t);

for i = 1:finalIndex - index
    shiftedPulse = zeros(size(t));
    shiftedPulse(i:i+index-1) = 1;
    corrVals(i) = sum(shiftedPulse .* y);
end

[~, maxIndex] = max(corrVals);
td_est = t(maxIndex);
R_est = (td_est * c) / 2;

fprintf('True R = %.2f m | Estimated R = %.2f m\n', R_true, R_est);

figure;
plot(t * 1e6, corrVals, 'LineWidth', 2);
xlabel('Time [\mus]'); ylabel('Correlation Value');
title('Correlation Output for Distance Estimation');
grid on;

%% 3-4: Effect of Noise
noiseLevels = 0:0.1:5;
numIterations = 100;
estimationError = zeros(size(noiseLevels));

for i = 1:length(noiseLevels)
    noiseStd = noiseLevels(i);
    totalError = 0;

    for j = 1:numIterations
        noisySignal = y + noiseStd * randn(size(y));
        corrValsNoisy = zeros(size(t));

        for k = 1:(finalIndex - index + 1)
            shiftedPulse = zeros(size(t));
            shiftedPulse(k:k+index-1) = 1;
            corrValsNoisy(k) = sum(shiftedPulse .* noisySignal);
        end

        [~, maxIdx] = max(corrValsNoisy);
        td_noisy = t(maxIdx);
        R_noisy = (td_noisy * c) / 2;
        totalError = totalError + abs(R_noisy - R_true);
    end

    estimationError(i) = totalError / numIterations;
    fprintf('Noise %.1f -> Mean Error = %.2f m\n', noiseStd, estimationError(i));
end

figure;
plot(noiseLevels, estimationError, '-o', 'LineWidth', 2);
xlabel('Noise Power (Standard Deviation)');
ylabel('Average Distance Error [m]');
title('Distance Estimation Error vs Noise Power');
grid on;

disp('Simulation completed successfully.');