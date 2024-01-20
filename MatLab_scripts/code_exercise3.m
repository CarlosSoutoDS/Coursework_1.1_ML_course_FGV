% Script: code_exercise3.m
% Example usage:
err_values = [1e-2, 1e-3, 1e-4, 1e-5, 1e-6];
ecompare(err_values);

function n = myevalueA(err)
    % Function to approximate e using the first method
    % 1/e = (1 - (1/n))^n

    % Initialize n with a slightly larger value to avoid division by zero
    n = 1.01;  % Initial value slightly larger than 1
    approx_e = (1 - 1/n)^n;

    % Continue iteration until the difference is less than err or a maximum number of iterations
    max_iterations = 10000;
    while abs(exp(1) - approx_e) > err && n < max_iterations
        n = n + 1;
        approx_e = (1 - 1/n)^n;
    end

    % Error handling if maximum iterations reached without desired tolerance
    if n == max_iterations
        warning('Maximum iterations reached in myevalueA without achieving desired error tolerance.');
    end
end

function n = myevalueB(err)
    % Function to approximate e using the second method
    % e = ∑1/i! (until n and i=0)

    % Initialize variables
    n = 0;
    approx_e = 0;

    % Use the built-in factorial function for efficiency
    factorial_i = factorial(0);  % Start with factorial of 0

    % Continue iteration until the difference is less than err or a maximum number of iterations
    max_iterations = 10000;
    while abs(exp(1) - approx_e) > err && n < max_iterations
        n = n + 1;
        factorial_i = factorial(n);  % Use built-in factorial function
        approx_e = approx_e + 1/factorial_i;
    end

    % Error handling if maximum iterations reached without desired tolerance
    if n == max_iterations
        warning('Maximum iterations reached in myevalueB without achieving desired error tolerance.');
    end
end

function ecompare(err_values)
    % Function to compare the two methods for different err values
    
    % Initialize vectors to store results
    n_values_A = zeros(size(err_values));
    n_values_B = zeros(size(err_values));
    
    % Calculate n values for each method
    for i = 1:length(err_values)
        n_values_A(i) = myevalueA(err_values(i));
        n_values_B(i) = myevalueB(err_values(i));
    end
    
    % Plot the results
    figure;
    plot(err_values, n_values_A, 'o-', 'DisplayName', 'Method A');
    hold on;
    plot(err_values, n_values_B, 's-', 'DisplayName', 'Method B');
    hold off;
    
    % Add labels and legend
    xlabel('Error (err)');
    ylabel('Number of Iterations (n)');
    title('Comparison of Methods for Approximating e');
    legend('Location', 'best');
end