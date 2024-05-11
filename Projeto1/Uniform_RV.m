
% Generation of uniform random variable in [0,1]
%  Uniform variable, histogram, PDF and CDF.

clear all;
close all;

N=100000; % Number of values
X=rand(1,N);
plot(X,'.')
xlabel('n')
ylabel('Amplitude')
title('UNIFORM RANDOM VARIABLE in [0,1]')
figure
plot(X(1:1000),'.')
title('UNIFORM RANDOM VARIABLE in [0,1]')
ylabel('Amplitude')
xlabel('n')

NN=80;
R1=-0.5;
R2=1.5;

% figure(10)
CDF=cum_distrib_function(X,N,NN,R1,R2);
% plot(bin_centers,CDF)

figure(20)
PDF=plot_prob_density_function(X,N,NN,R1,R2);
hold on


r=R2-R1;       % Length of the range
delta=r/NN;  %bin width
bin_centers=R1+delta/2:delta:R2-delta/2;

% for ind=1:NN
%     if bin_centers(ind)<0
%         PDF_analytic(ind)=0;
%     elseif bin_centers(ind)>1
%         PDF_analytic(ind)=0;
%     else
%         PDF_analytic(ind)=1;
%     end
% end

for ind=1:NN
    if (bin_centers(ind)<0) || (bin_centers(ind)>1)
        PDF_analytic(1,ind)=0;
    else
        PDF_analytic(1,ind)=1;
    end
end


plot(bin_centers,PDF_analytic)
