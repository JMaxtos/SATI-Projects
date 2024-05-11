function [PDF]=prob_density_function(Y,N,NN,R1,R2);

% CHAPTER 2: RANDOM VARIABLE - PDF
%   histogram, probability and density.



% [PDF]=prob_density_function(X,N,NN,R1,R2);
% This is the functional file for the estimation and plot of relative
% frequency and PDF
% Y is a vector whose elements are the random values.
% N is the number of trials (length of Y). 
% NN is the number of bins.
% R1 is the started point of the range.
% R2 is the final point of the range.
% rel_freq is the relative frequency of Y.


r=R2-R1;       % Length of the range
delta=r/NN;  %bin width
bin_centers=R1+delta/2:delta:R2-delta/2;

% H=hist(Y,NN);  % Histogram
H=hist(Y,bin_centers);  % Histogram

rel_freq=H/N;   %  Relative frequency
PDF=rel_freq/delta; % PDF

% figure(10)
% bar(R1+delta/2:delta:R2-delta/2,rel_freq,1) % Plot
% grid
% xlabel('x')
% ylabel('Relative frequency')

figure;
% bar(R1+delta/2:delta:R2-delta/2,PDF,1) % Plot
bar(bin_centers,PDF,1) % Plot
grid
xlabel('x')
ylabel('PDF')
title('Probability density function')
