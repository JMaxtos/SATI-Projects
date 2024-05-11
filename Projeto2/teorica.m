%Definição das Constantes do Problema
a = 1.8;
N = sqrt(0.25);
b = -2.1;
c = linspace(0, a, 10000);
%Expressão Teórica do Erro Total Do Sistema
theoric_function = 1/3* (2*qfunc(abs(c)/N) + qfunc(abs(c-b)/N) + qfunc(abs(c+a)/N) + (qfunc(abs(-c+a)/N)-qfunc(abs(-c-a)/N)) + (qfunc(abs(-c-b)/N)-qfunc(abs(-c+b)/N)) );
%Cálculo do valor mínimo da Probabilidade de Erro Total
[min_val, min_index] = min(theoric_function);
min_prob_error = min_val;
min_c_value = c(min_index);

%PRepresentação Gráfica da Probabilidade de Erro Total do Sistema
semilogy(c, theoric_function);
title("Expressão da Probabilidade de Erro Total Teórica");
xlabel("Valor de C");
ylabel("Probabilidade de Erro Total");
ylim([min_prob_error/5 1]);

fprintf('Menor Probabilidade de Erro: %.10f\n C igual a: %4f\n ', min_prob_error,min_c_value);
