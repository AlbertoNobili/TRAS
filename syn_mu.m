tic
% Mu-synthesis of the Twin-Rotor Aerodynamical System

Ts = 0.01;
nmeas = 4;
ncont = 2;
fv = linspace(10^(-3),pi/Ts,100);
opt = dkitopt('FrequencyVector',fv, ...
              'DisplayWhileAutoIter','on', ...
              'NumberOfAutoIterations',4);
[K_mu,CL_mu,bnd_mu,dkinfo] = dksyn(sys_ic,nmeas,ncont,opt);
%K_mu è il controllore 
%cl_mu = lft(sys_ic,K_mu) è il sistema closed loop 
%bnd_mu è il robust closed-loop performance bound
%dkinfo contiene il log dell'esecuzione dell'algoritmo

%Plottiamo i valori singolari del controllore
figure(1)
sigma(K_mu,'b-')
grid
title('Singular Value Plot of controller K_{mu}')
xlabel('Frequency')
ylabel('Singular values')

K = K_mu;

toc %60 sec Dislpay on, 40 sec Dislpay off
