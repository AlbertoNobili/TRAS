% Polynomial approximation of the TRAS thrust characteristics

load tras_char.mat

% Main rotor thrust characteristics
p1 = polyfit(control_p,rpm_p,7);
p2 = polyfit(rpm_p,force_p,5);

figure(1)
x = linspace(-1,1,100);
y = polyval(p1,x);
plot(control_p,rpm_p,'b-',x,y,'r--'), grid
xlabel('Control')
ylabel('Velocity (rpm)')
title('Main rotor velocity')
legend('Exact value','Approximation','Location', 'NorthWest')

figure(2)
x = linspace(-4000,4000,100);
y = polyval(p2,x);
plot(rpm_p,force_p,'b-',x,y,'r--'), grid
xlabel('Velocity (rpm)')
ylabel('Thrust (N)')
title('Main rotor thrust')
legend('Exact value','Approximation','Location', 'NorthWest')

u_v_nom = 0.3;
omega_v_nom = polyval(p1,u_v_nom)
der_p1 = polyder(p1);
der_p2 = polyder(p2);
k_H_v_nom = polyval(der_p1,u_v_nom)
k_F_v_nom = polyval(der_p2,omega_v_nom)

% Tail rotor thrust characteristics
p3 = polyfit(control_a,rpm_a,5);
p4 = polyfit(rpm_a,force_a,5);

figure(3)
x = linspace(-1,1,100);
y = polyval(p3,x);
plot(control_a,rpm_a,'b-',x,y,'r--'), grid
xlabel('Control')
ylabel('Velocity (rpm)')
title('Tail rotor velocity')
legend('Exact value','Approximation','Location', 'NorthWest')

figure(4)
x = linspace(-8000,8000,100);
y = polyval(p4,x);
plot(rpm_a,force_a,'b-',x,y,'r--'), grid
xlabel('Velocity (rpm)')
ylabel('Thrust (N)')
title('Tail rotor thrust')
legend('Exact value','Approximation','Location', 'NorthWest')

u_h_nom = 0;
omega_h_nom = 0;
der_p3 = polyder(p3);
der_p4 = polyder(p4);
k_H_h_nom =  polyval(der_p3,u_h_nom)
k_F_h_nom =  polyval(der_p4,omega_h_nom)