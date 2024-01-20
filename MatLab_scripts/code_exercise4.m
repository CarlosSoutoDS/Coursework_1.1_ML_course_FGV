% Set the random seed for reproducibility
rng(42);

% Define the function
f = @(x) cos(2*x) + (1/2)*x + 4;

% Define the closed interval
x_values = 0:0.01:15;

% Generate the response variable (y) with added Gaussian noise
y_values = f(x_values) + randn(size(x_values));

% Create a table with the columns "predict_x" and "response_y"
model_xy = table(x_values', y_values', 'VariableNames', {'predict_x', 'response_y'});

% Display the dataset
disp(model_xy);

% Scatter plot
figure;
scatter(model_xy.predict_x, model_xy.response_y, 'r.');  % Red dots for the dataset

hold on;

% Plot the equation data points
plot(x_values, f(x_values), 'y-', 'LineWidth', 2);

hold off;

% Set plot properties
title('Scatter Plot of Dataset and Equation Data Points');
xlabel('predict_x');
ylabel('response_y');
set(gca, 'Color', 'k');  % Set background color to black

% Print the chart
print('scatter_plot.png', '-dpng');

% Scatter plot
figure;
scatter(model_xy.predict_x, model_xy.response_y, 30, 'r.', 'MarkerEdgeAlpha', 0.5);  % Red dots for the dataset

hold on;

% Plot the equation data points
plot(x_values, f(x_values), 'LineWidth', 2, 'Color', [1 1 0]);  % Yellow line for the equation

% Mean centering
mean_x = mean(model_xy.predict_x);
mean_y = mean(model_xy.response_y);

model_xy.predict_x_centered = model_xy.predict_x - mean_x;
model_xy.response_y_centered = model_xy.response_y - mean_y;

% Plot the mean-centered data in cyan color
scatter(model_xy.predict_x_centered, model_xy.response_y_centered, 30, 'c.', 'MarkerEdgeAlpha', 0.5);

% Least squares optimization
X = [ones(size(model_xy.predict_x_centered)), model_xy.predict_x_centered];
w = X \ model_xy.response_y_centered;

% Plot the linear model in green
plot(x_values - mean_x, w(1) + w(2) * (x_values - mean_x), 'LineWidth', 2, 'Color', [0 1 0]);

% Plot the model centered on the original data in yellow
plot(x_values, w(1) + w(2) * x_values, 'LineWidth', 2, 'Color', [1 1 0]);

hold off;

% Set plot properties
title('Scatter Plot with Mean-Centered and Least Squares Fit', 'FontSize', 14);
xlabel('predict_x', 'FontSize', 12);
ylabel('response_y', 'FontSize', 12);
set(gca, 'Color', 'k', 'FontSize', 10);  % Set background color to black and adjust font size

% Print the graph
print('combined_plot_updated.png', '-dpng');