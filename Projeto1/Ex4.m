%Parâmetros comuns a todos os exerícios
clear;
close all;

% Parâmetros
tm = 6*10^(-3); % Valor de tm
tmax = 9.5*10^(-4); % Valor de tmax
lambda = 1/tm; 
miu = 1/lambda;
NN = 200; % Número de bins
N = 10000000; % Número de amostras
R1 = 0;
R2 = tmax; 


% Geração das amostras exponenciais
Y = exprnd(miu, 1, N);

%Geração de Amostras
X=rand(1,N)* tmax;

%Atraso Total
Z= X + Y;

% EX4

%Estimativa PDF de Fila  Espera
prob_density_function(X,N,NN,R1,R2);
title("PDF Atraso Fila de Espera Estimada");

% Estimativa da PDF do Atraso de Serviço
plot_prob_density_function(Y, N, NN, R1, 10/lambda);
title("PDF Atraso de Serviço Estimada");

%Estimativa da PDF Total

prob_density_function(Z,N,NN,R1,0.06);
title("PDF Total");


%EX5


% Estimativa da PDF do Atraso Total
plot_prob_density_function(Z,N,NN,R1,0.06);
hold on;

% Definindo o intervalo e o valor da PDF
x_PDFTotal = linspace(0, 0.06, NN); 

%Definir a PDF Total por ramos
f = zeros(1, length(x_PDFTotal)); % Inicializa f com zeros
f(x_PDFTotal > 0 & x_PDFTotal < 0.00095) = 1052.63 * (-exp(-166.67 * x_PDFTotal(x_PDFTotal > 0 & x_PDFTotal < 0.00095)) + 1);
f(x_PDFTotal > 0.00095) = 1052.63 * (-exp(-166.67 * x_PDFTotal(x_PDFTotal > 0.00095)) + exp(-166.67 * (x_PDFTotal(x_PDFTotal > 0.00095) - 0.00095)));

%PDF Total Teórica
plot(x_PDFTotal, f);
title('PDF Total Teórica e Estimada');
ylabel('f(x)');
xlabel('x');
ylim([0, 160]); % Define os limites do eixo y
xlim([0, 0.035]); % Define os limites do eixo x

%Ex 6
%CDF Total
cum_distrib_function(Z,N,NN,R1,0.1);
title("CDF Total");
hold on;
% Calculando o 95º percentil do atraso total
percentile_95 = prctile(Z, 95);

fprintf('O 95º percentil do atraso total é %f\n', percentile_95);
line([percentile_95 percentile_95], ylim, 'Color', 'r');
hold off;

