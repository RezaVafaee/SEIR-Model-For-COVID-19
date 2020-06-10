% Author: Reza Vafaee
% email: reza.vafaee.1986@gmail.com
% April. 2020; Last revision: 03-May-2020
%------------- BEGIN CODE --------------
clc;
clear all;
close all;

% References:
% [1] https://www-doh.state.nj.us/doh-shad/
% [2] Wang, H. et. al(2020). Phase-adjusted estimation of the number of
%     coronavirus disease 2019 cases in Wuhan, China. Cell discovery.
% [3] https://github.com/nytimes/covid-19-data
% [4] Blackwood, J. et. al(2018). An introduction to compartmental modeling
%     for the budding infectious disease modeler. Letters in Biomathematics.
% [5] https://kingaa.github.io/clim-dis/parest/parest.html

%%
            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            % SEIR model without births/deaths%
            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% dS/dt = - lambda(I) * S 
% dE/dt = lambda(I) * S - delta * E
% dI/dt = delta * E - gamma * I
% dR/dt = gamma * I
% lambda(I) = beta * I/N
% Susceptible (S): the population which are susceptible to get the disease.
% Exposed (E): the population which are infected but no symptoms.
% Infected (I): the population which are infected.
% Recovered (R): the population which are recovered by the disease.

% Parameters
infectious_period = 18;                 % infectious period /Obtained from [2]
latent_period = 5.2;                     % latent period /Obtained from [2]

gamma = 1 / infectious_period;
delta = 1 / latent_period;

% mio------------------------------------
% Birth rate of NJ in 2018 = 11.4 per 1,000
% Death rate of NJ in 2018 = 8.5 per 1,000
% Birth&Death rate collected from New Jersey State Health Assessment Data [1]
mio = (11.4+8.5)/(2*1000); % per 1 person

[beta,R0_without] = beta_without(gamma);% beta function without demography

R0_without % an estimation of basic reproductive number for NJ without demography

% Initialization
N = 9e6;   % Total population of NJ state
I_0 = 98;    % infected/ Obtained form [3]
E_0 = 20 * I_0;    % exposed  / in accordance with [2] 
R_0 = 0;    % recovered / immune
S_0 = N - E_0 - I_0 - R_0;    % susceptible
y0 = [S_0, E_0, I_0, R_0];

% Period of simulation
days = 365; % one year
h = 1;   % step (1 day)
tspan = 1:h:days;
% ODE solver
[t,y] = ode45(@(t,y) without(t,y,N,beta,delta,gamma), tspan, y0);
% y = [S, E, I, R];

figure;
plot(t,y(:,1),t,y(:,2),t,y(:,3),t,y(:,4)); grid on
axis([0 days 0 10e6]);
title('Solution of SEIR model without demography');
xlabel('Time (days)');
ylabel('Individuals');
legend('S','E','I','R');

figure;
plot(t,y(:,3)); grid on
axis([0 days 0 5e6]);
title('Number of infectious individuals versus time');
xlabel('Time (days)');
ylabel('Individuals');


%% Reducing the transmission rate by 80%
days = 2 * days;   % 2-year period
tspan = 1:h:days;
sol = zeros (length(tspan),2); % space to save number of infectious individuals 
[~,y] = ode45(@(t,y) without(t,y,N,beta,delta,gamma), tspan, y0);
sol(:,1) = y(:,3);

Reduced_beta = 0.2 * beta;
[t,y] = ode45(@(t,y) without(t,y,N,Reduced_beta,delta,gamma), tspan, y0);
sol(:,2) = y(:,3);

figure;
plot(t,sol(:,1),t,sol(:,2)); grid on
axis([0 days 0 5e6]);
title('Number of infectious individuals versus time');
xlabel('Time (days)');
ylabel('Individuals');
legend('The case of part (a)','The reduced transmission case of part (b)');


%%
            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            % SEIR model with births/deaths%
            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% dS/dt = mio*N - lambda(I)*S - mio*S
% dE/dt = lambda(I)*S -(delta + mio)E
% dI/dt = delta*E - (gamma + mio)I
% dR/dt = gamma*I - mio*R
[beta,~] = beta_with(gamma,mio); % beta function with demography
% days = 2 * days;   % 2-year period
% tspan = 1:h:days;
[t_w,y_w] = ode45(@(t,y) with(t,y,N,beta,delta,gamma,mio), tspan, y0);

figure;
plot(t_w,y_w(:,1),t_w,y_w(:,2),t_w,y_w(:,3),t_w,y_w(:,4)); grid on
axis([0 days 0 10e6]);
title('Solution of SEIR model with demography');
xlabel('Time (days)');
ylabel('Individuals');
legend('S','E','I','R');

figure;
plot(t_w,y_w(:,3)); grid on
axis([0 days 0 4e6]);
title('Number of infectious individuals versus time with demography');
xlabel('Time (days)');
ylabel('Individuals');
