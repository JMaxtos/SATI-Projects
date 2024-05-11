% Constants
a = 1.8;
b = -2.1;
N = 0.5;

% Generating a range of c values
c_values = linspace(0, a, 13);

% Array to hold error probabilities
error_probs = zeros(length(c_values));

% Loop to estimate error probabilities for each value of
%c
for i = 1:length(c_values)
    num_errors = 0;
    total_symbols = 0;
    
    while num_errors < 200
        symbol = FonteInformacao();
        Si = Codificador(symbol);
        So = Canal(Si);
        finalSo = Recetor(So, c_values(i));
        
        if finalSo ~= symbol
            num_errors = num_errors + 1;
        end
        
        total_symbols = total_symbols + 1;
    end
    
    error_probs(i) = num_errors / total_symbols;
end

% Theoretical error probabilities using Q-function
theoric_function = 1/3 * (2 * qfunc(abs(c_values) / N) + qfunc(abs(c_values - b) / N) +qfunc(abs(c_values + a) / N) +(qfunc(abs(-c_values + a) / N) - qfunc(abs(-c_values - a) / N)) +(qfunc(abs(-c_values - b) / N) - qfunc(abs(-c_values + b) / N)));

% Display the error probability estimates for each value of c
fprintf('Estimativas da probabilidade de erro para cada valor de c:\n');
for i = 1:length(c_values)
    fprintf('c = %f: %f\n', c_values(i), error_probs(i));
end

% Plot the error probability estimates and the theoretical function
figure;
semilogy(c_values, error_probs, 'o-', 'LineWidth', 2, 'Color', 'b');
hold on;
semilogy(c_values, theoric_function, '-', 'LineWidth', 2, 'Color', 'r');
hold off;
% Adding a legend to the plot
legend('Probabilidade de Erro do Sistema Simulada','Location', 'Best');

% Setting plot parameters
xlabel('Valor de C');
ylabel('Probabilidade de Erro');
ylim([1e-2 1]);
title('Expressões da Probabilidade de Erro Total do Sistema - Simulada e Teórica');
grid on;
