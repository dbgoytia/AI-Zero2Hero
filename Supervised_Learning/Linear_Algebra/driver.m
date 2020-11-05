# Load sample data
data = load ('data.txt');

# Take the first column of our data file
X = data(:, 1);

# Take the second column form our data file
y = data(:, 2);

# What does 'm' represent ?
m = length(y);

# Add an extra line of ones to our X values.
X = [ones(m, 1), data(:, 1)];

alpha = 0.01

# Create a vector to store values for m and b
weights = [0;0];

# Plug in our X values from our dataset
# into the equation that we are going to form
# from the weights m and b, and iterate over it 

for i = 1:2000
  hypothesis = X * weights;
  weights -= alpha * (1/m) * X' * (hypothesis - y)
end


disp(weights)
# just displays the weights that we found
# The for loop  structure for octave is for i = 1:n … end.


# Plot the data
plot(X, y, '+b', X ,  hypothesis, '--r')
title ('linear regression first try')
