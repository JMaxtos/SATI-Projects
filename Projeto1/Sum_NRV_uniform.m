
% CHAPTER 2: RANDOM VARIABLE

%  Uniform variable, histogram, probability and density.

% Generation of sum of N independent RVs each one uniformly distributed in [0,1]

clear all;
close all;

NRV=2;
N=10000000; % Number of values

Y=0;
for ind_NRV=1:NRV

X=rand(1,N);
% plot(X)
% xlabel('n')
% ylabel('Amplitude')
% title('UNIFORM RANDOM VARIABLE in [0,2pi], N=10000')
% figure
% plot(X(1:1000))
% title('UNIFORM RANDOM VARIABLE in [0,2pi], N=1000')
% ylabel('Amplitude')
% xlabel('n')

Y=Y+X; 
%Y=-sin(X); %prob. 2.14

end

figure(1)
plot(X(1:1000),'+')
title(' 1 RV uniforme, N=1000')
ylabel('Amplitude')
xlabel('n')

figure(2)
plot(Y(1:1000),'+')
title(' Soma de NRV RVs uniformes ind., N=1000')
ylabel('Amplitude')
xlabel('n')


NN=160;
R1=0;
R2=NRV;
PDF=prob_density_function(Y,N,NN,R1,R2);







