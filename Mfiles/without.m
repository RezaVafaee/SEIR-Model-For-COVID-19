function dydt = without(t,y,N,beta,delta,gamma)

dydt = zeros(4,1);

dydt(1) = (-beta/N) * y(1) * y(3);
dydt(2) = ((beta/N) * y(1) * y(3)) - (delta * y(2));
dydt(3) = (delta * y(2)) - (gamma * y(3));
dydt(4) = (gamma * y(3));

% dS = (-beta/N) * S * I;
% dE = ((beta/N) * S * I) - (delta * E);
% dI = (delta * E) - (gamma * I);
% dR = (gamma * I);
% y = [S, E, I, R];