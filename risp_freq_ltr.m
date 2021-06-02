% Frequency responses of the TRAS with the LTR controller

Ts = 0.01;
% Generiamo il sistema open loop senza pesi di performance
sys_ol
% Otteniamo il cls
cls = lft(sim_1dof,Kltr,2,2);

nsample = 30;
cls_30 = usample(cls,nsample);
for i = 1:nsample
   
%   Bode plot of the closed-loop system 
%   riferiemento->uscita
    ref_loop = cls_30([3,6],3:4,i);
    omega = logspace(-1,log10(pi/Ts),200);
    figure(1)
    sigma(ref_loop,'b-',wm1,'r--',wm2,'m-.',omega)
    hold on

%   singular values of the output sensitivity function
%   disturbo->uscita
    sen_loop = cls_30([3,6],1:2,i);
    omega = logspace(-8,log10(pi/Ts),200);
    figure(2)
    sigma(sen_loop,'b-',1/wp1,'r--',1/wp2,'m-.',omega)
    hold on

%   singular values of the noise transfer function
%   rumore->uscita
    nois_loop = cls_30([3,6],5:6,i);
    omega = logspace(-2,log10(pi/Ts),200);
    figure(3)
    sigma(nois_loop,'b-',omega)
    hold on

%   singular values of the input sensitivity function
%   disturbo->controllo
    cont_loop = cls_30(7:8,1:2,i);
    omega = logspace(0,log10(pi/Ts),500);
    figure(4)
    sigma(cont_loop,'b-',1/wu1,'r--',1/wu2,'m-.',omega)
    hold on

%   singular values of the noise to control action transfer function
%   rumore->controllo
    cont_loop = cls_30(7:8,5:6,i);
    omega = logspace(0,log10(pi/Ts),500);
    figure(5)
    sigma(cont_loop,'b-',1/wu1,'r--',1/wu2,'m-.',omega)
    hold on    
end   

figure(1)
grid
temp1 = 'Singular Value Plot of the';
temp2 = ' Closed-loop Transfer Function Matrix';
title([temp1,temp2])
xlabel('Frequency')
axis([10^(-1) 10 -50 20]);
leg = legend('\sigma(T_{ry})','w_{m1}', 'w_{m2}','Location', 'SouthWest');
leg.FontSize = 14;
hold off
%
figure(2)
grid
temp1 = 'Singular Value Plot of the';
temp2 = ' Sensitivity Transfer Function Matrix';
title([temp1,temp2])
xlabel('Frequency')
axis([10^(-8) pi/Ts -100 40]);
leg = legend('\sigma(T_{dy})','1/w_{p1}', '1/w_{p2}','Location', 'SouthEast');
leg.FontSize = 14;
hold off
%
figure(3)
grid
temp1 = 'Singular Value Plot of the';
temp2 = ' Noise Transfer Function Matrix';
title([temp1,temp2])
xlabel('Frequency')
axis([10^(-2) pi/Ts -150 0]);
leg = legend('\sigma(T_{ny})','Location', 'SouthWest');
leg.FontSize = 14;
hold off
%
figure(4)
grid
temp1 = 'Singular Value Plot of the';
temp2 = ' Input Sensitivity Transfer Function Matrix'; 
title([temp1,temp2])
xlabel('Frequency')  
axis([10^0 pi/Ts -60 100]);
leg = legend('\sigma(T_{du})','1/w_{u1}', '1/w_{u2}','Location', 'SouthWest');
leg.FontSize = 14;
hold off
%
figure(5)
grid
temp1 = 'Singular Value Plot of the';
temp2 = ' Noise to Control Transfer Function Matrix'; 
title([temp1,temp2])
xlabel('Frequency')  
axis([10^0 pi/Ts -60 100]);
leg = legend('\sigma(T_{nu})','1/w_{u1}', '1/w_{u2}','Location', 'SouthEast');
leg.FontSize = 14;
hold off
%
% Singular values of the controller
%    Kr = Kltr(1:2,1:2);
%    Ky = Kltr(1:2,3:4);
omega = logspace(-8,log10(pi/Ts),200);
figure(6)
sigma(Kltr,'r-',omega), grid
title('Singular Value Plot of the Controller')
xlabel('Frequency')   
%
% Singular values of the open loop transfer function Gu*Ky
open_loop = G([3,6],3:4)*Kltr(1:2,1:2);
omega = logspace(-8,log10(pi/Ts),200);
figure(7)
sigma(open_loop,'b-',omega), grid
axis([10^(-8) pi/Ts -100 150]);
title('Singular Value Plot of G_uK_y')
xlabel('Frequency')   
leg = legend('\sigma(G_u*K_y)','Location', 'SouthWest');
leg.FontSize = 14;