% Transient responses of the TRAS
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
%[ref,time] = gensig('sin',60,120,ti);
ref2 = r2*(2*ref - 1);
nstep = size(time,1);
dist1(1:nstep) = 0.0;
dist2(1:nstep) = 0.0;
noise1(1:nstep) = 0.0;
noise2(1:nstep) = 0.0;
input = [dist1',dist2',ref1,ref2,noise1',noise2'];
cls = lft(sim_1dof,Kltr,2,2); %otteniamo il cls 
nsample = 30;
sim_30 = usample(cls,nsample);
for i = 1:nsample
    y = lsim(sim_30(1:8,1:6,i),input,time);
    nstep = size(time,1);
    
    figure(1)
    subplot(2,1,1)
    plot(time,y(:,1),'b-')
    hold on
    subplot(2,1,2)
    plot(time,y(:,4),'b-')
    hold on
    
    figure(2)
    subplot(2,1,1)
    plot(time,y(:,2),'b-')
    hold on
    subplot(2,1,2)
    plot(time,y(:,5),'b-')
    hold on
    
    figure(3)
    subplot(2,1,1)
    plot(time,y(:,3),'r-')
    hold on
    subplot(2,1,2)
    plot(time,y(:,6),'r-')
    hold on
    
    figure(4)
    subplot(2,1,1)
    plot(time,y(:,7),'r-')
    hold on
    subplot(2,1,2)
    subplot(2,1,2)
    plot(time,y(:,8),'r-')
    hold on
end     
%
figure(1)
subplot(2,1,1)
grid
xlabel('Time (secs)')
ylabel('\omega_h')
title('Azimuth and pitch rpm')
hold off
subplot(2,1,2)
grid
xlabel('Time (secs)')
ylabel('\omega_v')
hold off
%
figure(2)
subplot(2,1,1)
grid
xlabel('Time (secs)')
ylabel('\Omega_h')
title('Azimuth and pitch velocities')
hold off
subplot(2,1,2)
grid
xlabel('Time (secs)')
ylabel('\Omega_v')
hold off
%
figure(3)
subplot(2,1,1)
plot(time,ref1,'b--')
grid
title('Closed-loop Transient Responses')
xlabel('Time (secs)')
ylabel('\alpha_h')
hold off
subplot(2,1,2)
plot(time,ref2,'b--')
grid
xlabel('Time (secs)')
ylabel('\alpha_v')
hold off
%
figure(4)
subplot(2,1,1)
grid
xlabel('Time (secs)')
ylabel('u_h')
title('Azimuth and pitch control actions')
hold off
subplot(2,1,2)
grid
xlabel('Time (secs)')
ylabel('u_v')
hold off
%
clear ref1, clear ref2
clear dist1, clear dist2
clear noise1, clear noise2