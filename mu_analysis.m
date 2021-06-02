tic
% Mu-analysis of the TRAS (with H_inf or mu controller)

% Obtaining the closed-loop system
cls_ic = lft(sys_ic,K,2,4);
omega = logspace(-3,3,100);
cls_g = ufrd(cls_ic,omega);

% Robust stability analysis
opt = robopt('Display','on');
[stabmarg,destabu,report,info] = robuststab(cls_g,opt);
report
figure(1)
semilogx(info.MussvBnds(1,1),'r-',info.MussvBnds(1,2),'b--')
grid
title('Robust stability')
xlabel('Frequency (rad/sec)')
ylabel('mu')
leg = legend('\mu-upper bound','\mu-lower bound','Location', 'SouthWest');
leg.FontSize = 14;

% Nominal performance
figure(2)
sv = sigma(cls_ic.Nominal,omega);
sys = frd(sv(1,:),omega);
semilogx(sys,'r-')
grid
xlabel('Frequency (rad/sec)')
title('Nominal performance')

% Robust performance
opt = robopt('Display','on');
[perfmarg,perfmargunc,report,info] = robustperf(cls_g,opt);
report
figure(3)
semilogx(info.MussvBnds(1,1),'r-',info.MussvBnds(1,2),'b--')
grid
title('Robust performance')
xlabel('Frequency (rad/sec)')
ylabel('mu')
leg = legend('\mu-upper bound','\mu-lower bound','Location', 'SouthWest');
leg.FontSize = 14;

toc %450 secondi 