% Transient responses of the TRAS (nominal parameters)
% controlled by LQG LTR

%Generiamo il sistema open loop senza pesi di performance
sys_ol

% Response to the reference input
r1 = 0.4;     % rad
r2 = 0.1;     % rad
ti = 0.01;    % s
[ref,time] = gensig('square',50,120,ti); 
ref1 = r1*(2*ref - 1);
[ref,time] = gensig('square',60,120,ti); 
%[ref,time] = gensig('sin',60,120, ti);
ref2 = r2*(2*ref - 1);
nstep = size(time,1);
dist1(1:nstep) = 0.0;
dist2(1:nstep) = 0.0;
noise1(1:nstep) = 0.0;
noise2(1:nstep) = 0.0;
input = [dist1',dist2',ref1,ref2,noise1',noise2'];
cls_nom = lft(sim_1dof.NominalValue,Kltr,2,2); %otteniamo il cls nominale
y = lsim(cls_nom,input,time);
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
plot(time,y(:,2),'b-')
grid
xlabel('Time (secs)')
ylabel('\Omega_h')
title('Azimuth and pitch velocities')

subplot(2,1,2)
plot(time,y(:,5),'b-')
grid
xlabel('Time (secs)')
ylabel('\Omega_v')
%
%plottiamo risposta transitoria del sistema closed loop
figure(3)

subplot(2,1,1)
plot(time,ref1,'b--')
hold on
plot(time,y(:,3),'r-')
grid
xlabel('Time (secs)')
ylabel('\alpha_h')
hold off
title('Closed-loop Transient Responses')

subplot(2,1,2)
plot(time,ref2,'b--')
hold on
plot(time,y(:,6),'r-')
grid
xlabel('Time (secs)')
ylabel('\alpha_v')
hold off
%
% plottiamo le azioni di controllo
figure(4)

subplot(2,1,1)
plot(time,y(:,7),'r-')
grid
xlabel('Time (secs)')
ylabel('u_h')
title('Azimuth and pitch control actions')

subplot(2,1,2)
plot(time,y(:,8),'r-')
grid
xlabel('Time (secs)')
ylabel('u_v')

%

clear ref1, clear ref2
clear dist1, clear dist2
clear noise1, clear noise2