w = logspace(-2,2);

Gu = G.NominalValue([3,6],3:4);    % Ricaviamo il sistema nominale
s = tf('s');
Gau = 1/s*Gu;    % Aumentiamo il sistema aggiungendo gli integratori
phi = inv(s*eye(8)-Gau.A);
p = 1/s;

% Impostiamo H e rho
H = diag([100,10000,0.5,10000,10000,2,1,1]); % (8x8)
rho = 1e7;  %Il soddisfacimeto dei vincoli ce li ho per rho=10^7
            %tuttavia buone azioni di controllo ce le ho per rho=10^10
R = eye(2)*rho; % (2x2)

% [4]
% Verifichiamo le prestazioni a basse frequenze
figure(1)
sigma(p/(1-l))
hold on
grid on
sigma(1/sqrt(rho)*H*phi*Gau.B)
title(' Prestazioni alle basse frequenze ')
leg = legend('\sigma[p/(1 - l_{m})]','1/{sqrt(\rho) \sigma[H\PhiB}]','Location', 'SouthWest');
leg.FontSize = 14;
% Verifichiamo le prestazioni ad alte frequenze (???)
svds = svd(H*Gau.B/sqrt(rho));
smax = svds(1)
omegac = 15

%[5]
% Calcoliamo il controllore
Klqr = lqr(Gau, H'*H, R);
% e verifichiamo la coincidenza alle basse frequenze
figure(2)
Tc = Klqr*phi*Gau.B;
sigma(Tc, w)
hold on
grid on
sigma(1/sqrt(rho)*H*phi*Gau.B)
title(' Verifica validità approssimazione ')
leg = legend('\sigma(K_c\PhiB ','1/sqrt(\rho) \sigma(H\PhiB)','Location', 'SouthWest');
leg.FontSize = 14;

% [6]
% Verifichiamo la robustezza (classica stabilità robusta dell'LQG)
figure(3)
sigma(eye(2)+inv(Tc))    % deve stare sopra 1/2
hold on
grid on
sigma(1/2*s/s)
%sigma(l)
title(' Verifica primo test di robustezza ')
leg = legend('\sigma( I + T^{-1})','1/2','Location', 'SouthWest');
leg.FontSize = 14;

% [7]
% Test aggiuntivo sulla robustezza (stabilità robusta)
% Questo test è equivalente a quello precedente in cui si 
% verifica che stia sopra sigma(l)
figure(4)
sigma(Tc*inv(eye(2)+Tc))    %deve stare sotto 1/l
hold on
grid on
sigma(1/l)
title(' Verifica secondo test di robustezza')
leg = legend('\sigma[ Tc ( I + Tc)^{-1}]','\sigma[1/l_m ]','Location', 'SouthWest');
leg.FontSize = 14;

% [8]
% Verifica sistema a fase minima
scaled = prescale(Gau);
tzero(scaled.C*inv(s*eye(8)-scaled.A)*scaled.B)
