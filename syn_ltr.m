w = logspace(-2, 3);
XI = eye(8);
Wr = eye(2)*10^(-2);
TH = Wr*Wr';
RHO = 1e5; 
%Tano più il recupero è basso tanto meglio sono le azioni di controllo
%la risposta transitoria rimane buona anche nel caso incerto

%[9]
%Facciamo il recupero
figure(1)
Tc =  Klqr*inv(s*eye(8)-Gau.A)*Gau.B;
sigma(Tc, w);
hold on;
grid on;
[Kltr,SVL,W1] = ltrsyn(Gau,Klqr,XI,TH,RHO,w);

%Confrontiamo i valori singolari dopo il recupero
figure(2)
sigma(Tc, w);       %FdT d'anello con LQR
hold on;
grid on;
Td = Kltr*Gau;
sigma(Td, w)        %FdT d'anello con LTR
title(' Singular values recovery ');
leg = legend('\sigma( T_c )','\sigma( T_{lqg} )','Location', 'SouthWest');
leg.FontSize = 14;

% [10]
%Verifichiamo la stabilità robusta del sistema con LTR 
figure(3)
sigma(eye(2)+inv(Td))       %dovrebbe stare sopra l ma facciamolo con 1/2
hold on
grid on
sigma(1/2*s/s)
%sigma(l)
title(' Primo test di stabilità robusta ')
leg = legend('\sigma( I + T_{lqg}^{-1} )','1/2','Location', 'NorthWest');
leg.FontSize = 14;
%
% figure(4)
% sigma(Td*inv(eye(2)+Td), w)    %deve stare sotto 1/l
% hold on
% grid on
% sigma(1/l, w)
% title(' Secondo test di stabilità robusta')
% leg = legend('\sigma[ T_{lqg} ( I + T_{lqg})^{-1} ]','\sigma[ 1/l_m ]','Location', 'SouthWest');
% leg.FontSize = 14;
% %PROBLEMA: a frequenze MOLTO basse questo vincolo non è rispettato
% 
% %Veifichiamo le performance robuste del sistema con LTR
% figure(5)
% sigma(Kltr*Gau) %deve stare sopra (alle basse frequenze)
% hold on
% grid on
% sigma(p/(1-l))
% title(' Prestazioni robuste ')
% leg = legend('\sigma[ Kltr * Gau ]','\sigma[ p/(1-l_m) ]','Location', 'SouthWest');
% leg.FontSize = 14;