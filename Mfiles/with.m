function dydt = with(t,y,N,beta,delta,gamma,mio)

dydt = zeros(4,1);

dydt(1) = (mio * N) - ((beta/N) * y(1) * y(3)) - (mio * y(1));
dydt(2) = ((beta/N) * y(1) * y(3)) - ((delta + mio) * y(2));
dydt(3) = (delta * y(2)) - ((gamma + mio) * y(3));
dydt(4) = (gamma * y(3)) - (mio * y(4));

% y = [S, E, I, R];