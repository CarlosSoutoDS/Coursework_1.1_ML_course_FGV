% Generate 10,000 normally distributed 3D points
mean_vector = [0, 0, 0];
cov_matrix = eye(3); % Unit variance

data_points = mvnrnd(mean_vector, cov_matrix, 10000);

% Filter points with all positive components
positive_points = data_points(all(data_points > 0, 2), :);

% Normalize points to have unit length
normalized_points = positive_points ./ vecnorm(positive_points, 2, 2);

% Create a figure for 3D plot
figure;
scatter3(normalized_points(:, 1), normalized_points(:, 2), normalized_points(:, 3), ...
    50, 'r*', 'filled');
grid on;
axis equal;

% Set axis labels
xlabel('X Axis');
ylabel('Y Axis');
zlabel('Z Axis');

% Set graph background to white
set(gcf, 'Color', 'w');

% Add a title to the plot
title('Normalized 3D Points with Positive Components', 'FontSize', 14);

% Display the mass of each distribution as red stars
hold on;
text(normalized_points(:, 1), normalized_points(:, 2), normalized_points(:, 3), ...
    arrayfun(@num2str, 1:size(normalized_points, 1), 'UniformOutput', false), ...
    'Color', 'red', 'FontSize', 8, 'HorizontalAlignment', 'left', 'VerticalAlignment', 'bottom');
hold off;
