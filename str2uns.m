tic
s = tf('s');
%l = 0.003*(s+10)^2/((s/40+1)^2*(1+(2*0.3*s/30)+s^2/(30^2)))*(1+s/150)^2
l = (0.1789*s^2 + 35.99*s + 218.5)/(s^2 + 8.025*s + 774.2) 
% Nota: siccome ho già trovato la funzione l(w), in fondo ho commentato il
%comando wfit
sys_TRAS  %Generiamo il sistema TRAS
G_red = G([3 6], 3:4);
L = inv(G_red.NominalValue)*(G_red-G_red.NominalValue);
nsample = 50;
omega = logspace(-3,4);
sampled = usample(L,nsample);
figure(1)
sigma(l,'r--',omega)
hold on
grid on
for i = 1:nsample
    ref_loop = sampled(:,:,i);
    figure(1)
    sigma(ref_loop,'b-',omega)
    hold on
end
title(' Upper bound for uncertainty ');
leg = legend('l_m ','\sigma[G_{nom} (G - G_{nom})]','Location', 'SouthWest');
leg.FontSize = 14;
toc %31s per 50 campioni, 100s per 100 campioni
%wfit