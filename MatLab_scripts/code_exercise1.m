% Generate 1000 uniformly distributed data points
xmin_uniform = 30;
xmax_uniform = 40;
ymin_uniform = 10;
ymax_uniform = 20;

uniform_data = [rand(1000, 1) * (xmax_uniform - xmin_uniform) + xmin_uniform, ...
                rand(1000, 1) * (ymax_uniform - ymin_uniform) + ymin_uniform];

% Generate 1000 normally distributed data points
mean_normal = [20, 35];
cov_normal = eye(2); % Unit variance

normal_data = mvnrnd(mean_normal, cov_normal, 1000);

% Create a figure and plot the points
figure;
hold on;

% Plot uniformly distributed points as blue circles
scatter(uniform_data(:, 1), uniform_data(:, 2), 50, 'bo', 'filled', 'DisplayName', 'Uniform distribution');

% Plot normally distributed points as red stars
scatter(normal_data(:, 1), normal_data(:, 2), 50, 'r*', 'DisplayName', 'Normal distribution');

hold off;

% Set axis limits
axis([0 50 0 50]);

% Add legend and axis labels
legend('Location', 'best');
xlabel('x axis');
ylabel('y axis');

% Display the graph title
title('Scatter Plot of Uniform and Normal Distributions');

% Plus - Plots of Distributions in two dimensions
% Create a figure for the box plot
figure;

% Box plot
boxplot(normal_data, 'Labels', {'X', 'Y'}, 'Colors', 'r');

% Add axis labels
xlabel('Dimension');
ylabel('Value');

% Add a title to the box plot
title('Box Plot of Normal Distribution', 'FontSize', 12);

% Extract x and y from normal_data
x_normal = normal_data(:, 1);
y_normal = normal_data(:, 2);

% Create a figure for the scatter plot and scatterhist
figure('Position', [125 125 1200 500]);

% Scatter plot of normal data
subplot(1, 2, 1);
plot(x_normal, y_normal, '.');
xlabel('x axis');
ylabel('y axis');
title('Scatter Plot of Normally Distributed Data');

% Visualize marginal distributions and correlation structure using scatterhist
subplot(1, 2, 2);
scatterhist(x_normal, y_normal, 'Direction', 'out');
xlabel('x axis');
ylabel('y axis');
title('Marginal Distributions and Correlation Structure');

% Extract x and y from uniform_data
x = uniform_data(:, 1);
y = uniform_data(:, 2);

% Create a figure with specified position
figure('Position', [125 125 1200 500]);

% Plot the data points
subplot(1, 2, 1);
plot(x, y, '.');
xlabel('x axis');
ylabel('y axis');
title('Scatter Plot of Uniformly Distributed Data');

% Visualize marginal distributions and correlation structure using scatterhist
subplot(1, 2, 2);
scatterhist(x, y, 'Direction', 'out');
xlabel('x axis');
ylabel('y axis');
title('Marginal Distributions and Correlation Structure');