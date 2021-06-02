% H_infinity design of Twin-Rotor Aerodynamic System

hin_ic = sys_ic.Nominal;
Ts = 0.01; % s
nmeas = 4;
ncont = 2;
gmin = 0.1;
gmax = 100;
gamRange = [gmin gmax];
opts = hinfsynOptions('RelTol',0.001);
[K_hin,clp_hin,gopt] = hinfsyn(hin_ic,nmeas,ncont,gamRange,opts);
%K_hin è il controllore 
%clp_hin = lft(hin_ic,K_hin) è il sistema closed loop nominale con pesi di
%performance
%gopt = ||clp_hin||_inf è il gamma ottenuto

%Mandiamo in display i poli del sistema closed loop
disp(' ')
get(K_hin)
disp(' ')
disp('Closed-loop poles of c.l.s.')
sp = pole(clp_hin)

%Plottiamo i valori singolari del sistema closed loop
figure(1)
omega = logspace(-3,log10(pi/Ts),100);
sigma(clp_hin,'m-',omega), grid
title('Singular Value Plot of c.l.s.')
xlabel('Frequency')
ylabel('Magnitude')

%Plottiamo i valori singolari del controllore
figure(2)
sigma(K_hin,'b-')
grid
title('Singular Value Plot of controller K_{hin}')
xlabel('Frequency')
ylabel('Singular values')

K = K_hin;