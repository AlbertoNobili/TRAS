% Generates the open-loop connection for the 
% TRAS + sensor noise weight (2dof)

sys_TRAS

systemnames = ' G Wn ';
inputvar    = '[ dist{2}; ref{2}; noise{2}; control{2} ]';
outputvar   = '[ G; control; ref(1); ref(2); -G(3)-Wn(1); -G(6)-Wn(2) ]';
input_to_G  = '[ dist; control ]';
input_to_Wn = '[ noise ]';
sim_ic      = sysic;

% Generates the open-loop connection for the 
% TRAS + sensor noise weight + integrators (1dof)

sys_TRAS

s = tf('s');
it = eye(2)*1/s;
systemnames = ' G Wn it';
inputvar    = '[ dist{2}; ref{2}; noise{2}; control{2} ]';
outputvar   = '[ G; control; ref(1)-G(3)-Wn(1); ref(2)-G(6)-Wn(2)]';
input_to_it = '[ control ]';
input_to_G  = '[ dist; it ]';
input_to_Wn = '[ noise ]';
sim_1dof      = sysic;