x = load('ex2x.txt')
y = load('ex2y.txt')


figure % open a new figure window
plot(x, y, 'o');
ylabel('Height in meters')
xlabel('Age in years')

m = length(y); % store the number of training examples

% Gradient descent
x = [ones(m, 1) x];                     % Add a column of ones to x
theta = zeros(size(x(1,:)))';           % initialize fitting parameters
MAX_ITR = 1500;
alpha = 0.07;


% Fit the model
for num_iterations = 1:MAX_ITR
  grad = (1/m).* x' * ((x * theta) - y); % optimized vectorized version.
  theta = theta - alpha .* grad;
endfor


% Make a prediction for boys aged 3.5 and 7
% Predict values for age 3.5 and 7
predict1 = [1, 3.5] *theta             % prediction for a 3.5 year old boy
predict2 = [1, 7] * theta              % prediction for a 7 year old boy

% Couple of demonstrations that good data make good preditctions.
predict2 = [1, 25] * theta              % prediction for a 7 year old boy
predict2 = [1, 99] * theta              % prediction for a 7 year old boy

% plot the linear fitting
hold on;                    % keep the previous plot visible to write on it
plot(x(:,2), x*theta, '-')
legend('Training data', 'Linear regression')
hold off                    % don't overlay more stuff in this graph