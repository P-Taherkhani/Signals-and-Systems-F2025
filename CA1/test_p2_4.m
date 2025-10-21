%% Test p2_4 function
alpha_true = 2.5;
beta_true  = -1.2;
t = 0:0.001:1;
x = sin(2*pi*5*t);     % sample input
y_clean = alpha_true*x + beta_true;

% Add small Gaussian noise
noise = 0.05*randn(size(y_clean));
y_noisy = y_clean + noise;

% Estimate parameters from noisy data
[alpha_est, beta_est] = p2_4(x, y_noisy);

fprintf('True alpha = %.3f, Estimated alpha = %.3f\n', alpha_true, alpha_est);
fprintf('True beta  = %.3f, Estimated beta  = %.3f\n', beta_true, beta_est);