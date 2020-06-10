function [bet,R0] = beta_with(gamma,mio)
% beta function with demography
t = 1:12; % From 03/04/2020 to 03/15/2020
t = t';
T = [ones(length(t),1) t]; % add a column of ones
I = [1; 2; 4; 4; 6; 11; 15; 23; 29; 50; 75; 98]; % Infected cases in NJ from 03/04/2020 to 03/15/2020 based on [3]
% linear regression
b = T\log(I); 
slope = b(2);
% estimating R0 based on [5]
R0 = (slope/(gamma+mio))+1;
% Beta for NJ
bet = R0 * (gamma+mio);