

% Generation of exponential random variable 
%  Samples, PDF and CDF.

clear all;
close all;

lambda=0.01;
miu=1/lambda;

N=1000000; % Number of values
X=exprnd(miu,1,N);
%plot(X)
%xlabel('n')
%ylabel('Amplitude')
%title('EXPONENTIAL RANDOM VARIABLE')
%figure
%plot(X(1:1000))
%title('EXPONENTIAL RANDOM VARIABLE')
%ylabel('Amplitude')
%xlabel('n')

NN=100;
R1=0;
R2=10/lambda;

r=R2-R1;       % Length of the range
delta=r/NN;  %bin width
bin_centers=R1+delta/2:delta:R2-delta/2;

%CDF=cum_distrib_function(X,N,NN,R1,R2);
%hold on

%theo_exponential_CDF=1-exp(-bin_centers*lambda);
%plot(bin_centers,theo_exponential_CDF)

PDF=plot_prob_density_function(X,N,NN,R1,R2);
hold on

%theo_exponential_PDF=lambda*exp(-bin_centers*lambda);
%plot(bin_centers,theo_exponential_PDF)

mean_exponential=mean(X)
standard_deviation_exponential=std(X)