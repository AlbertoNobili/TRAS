% FILES FOR ANALYSIS AND DESIGN OF TWIN-ROTOR AERODYNAMIC SYSTEM
%
%-------------------------------------
% Construction of the open-loop system
%
% sys_olw.m	      Creates the open-loop weighted interconnection 
% sys_ol.m        Creates the open-loop unweighted interconnection
%
%-------------------
% Controllers design
%
% syn_hin.m	      Design of Hinf controller
% syn_mu.m	      Design of mu-controller
% syn_lqr         Design of lqr-controller
% syn_ltr         Design of ltr-controller
%
%-----------------------------------
% Analysis of the closed-loop system (2dof)
%
% mu_analysis.m	        Analysis of robust stability and robust performance
% risp_freq.m	        Frequency responses of the closed-loop system
% risp_trans_nom.m	    Transient responses of the closed-loop system 
%                       with nominal parameters
% risp_trans_inc.m      Transient responses of the closed-loop system 
%                       for random values of the uncertain parameters
%
% Analysis of the closed-loop system (1dof)
%
% mu_analysis_ltr.m
% risp_freq_ltr.m
% risp_trans_ltr_nom.m
% risp_trans_ltr_inc.m
%
%-----------------------------------------------
% Simulation of the nonlinear closed-loop system
%
% TRAS_2dof_model.mdl Simulink model of the nonlinear sampled-data system
%                     
% plot_nonl_tras      Plots the results of nonlinear system simulation
%
%----------------
% Auxiliary files
%
% sys_TRAS.m	      Creates the uncertain TRAS plant model
% tras_char.mat	      Mat-file containing the data for nonlinear plant 
%                     thrust characteristics
% approx_char.m       Approximation of the TRAS thrust characteristics
%                     (uses the file trash_char.mat)
% wts_hin.m           Sets the performance weighting functions 
%                     for Hinf design
% wts_mu.m            Sets the performance weighting functions  
%                     for mu-synthesis
% TRAS_2dof_exper.mat Results of the real-time control experiment
% plot_exper_tras     Plots the results of real-time experiments
%                     (uses the file TRAS_2dof_exper.mat)