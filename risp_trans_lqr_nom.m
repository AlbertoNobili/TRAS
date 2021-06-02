% Transient responses of the TRAS (nominal parameters)
% controlled by LQR (non funziona: non so cosa rappresentano gli stati)

%Generiamo il sistema closed loop 
Gu = G.NominalValue([3,6],3:4);
s = tf('s');
Gau = 1/s*Gu;
cls_lqr = ss((Gau.A - Gau.B*Klqr), Gau.B, eye(8), zeros(8,2));

% Response to the reference input
r1 = 0.4;     % rad
r2 = 0.1;     % rad
ti = 0.01;    % s
[ref,time] = gensig('square',1000,2000,ti); 
ref1 = r1*(2*ref - 1);
[ref,time] = gensig('square',1000,2000,ti); 
%[ref,time] = gensig('sin',1000,2000, ti);
ref2 = r2*(2*ref - 1);
nstep = size(time,1);
input = [ref1,ref2];
y = lsim(cls_lqr,input,time);
%

%plottiamo velocità angolare dei rotori
figure(1)

subplot(2,1,1)
plot(time,y(:,1),'b-')
grid
xlabel('Time (secs)')
ylabel('\omega_h')
title('Azimuth and pitch rpm')

subplot(2,1,2)
plot(time,y(:,4),'b-')
grid
xlabel('Time (secs)')
ylabel('\omega_v')
%

%plottiamo velocità di imbardata e beccheggio
figure(2)

subplot(2,1,1)
plot(time,y(:,4),'b-')
grid
xlabel('Time (secs)')
ylabel('\Omega_h')
title('Azimuth and pitch velocities')

subplot(2,1,2)
plot(time,y(:,7),'b-')
grid
xlabel('Time (secs)')
ylabel('\Omega_v')
%
%plottiamo risposta transitoria del sistema closed loop
figure(3)

subplot(2,1,1)
plot(time,ref1,'b--')
hold on
plot(time,y(:,5),'r-')
grid
xlabel('Time (secs)')
ylabel('\alpha_h')
hold off
title('Closed-loop Transient Responses')

subplot(2,1,2)
plot(time,ref2,'b--')
hold on
plot(time,y(:,8),'r-')
grid
xlabel('Time (secs)')
ylabel('\alpha_v')
hold off
%
% % plottiamo le azioni di controllo
% figure(4)
% 
% subplot(2,1,1)
% plot(time,y(:,7),'r-')
% grid
% xlabel('Time (secs)')
% ylabel('u_h')
% title('Azimuth and pitch control actions')
% 
% subplot(2,1,2)
% plot(time,y(:,8),'r-')
% grid
% xlabel('Time (secs)')
% ylabel('u_v')

%

clear ref1, clear ref2
clear dist1, clear dist2
clear noise1, clear noise2