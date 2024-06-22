clear all 
% load('date_j1.mat')
g=9.81;
Ts=0.01;
load('Rezultate_J(theta)_GA_j1_j2.mat');
%
Be = 5;
Bde = 5;
%
eta_theta_urc=2.5;
eta_theta_ulc=3.75;
%
Kp_urc_theta = 0.22;
Ki_urc_theta = 0.037;
%
Ki_ulc_theta = 0.03;
%
ki_theta_FT1 = 0.0001;
%
%
delta_theta=[delta(1) delta(2) delta(3) delta(4) delta(5) delta(6) delta(7) delta(8) delta(9) delta(10)];
%
a=newfis('regPI','sugeno');
a=addvar(a,'input','etheta',[-2*delta(1) 2*delta(1)]);
a=addmf(a,'input',1,'Nm','trapmf' ,[-2*delta(1) -2*delta(1) -delta(1) 0]);
a=addmf(a,'input',1,'Ze','trimf' ,[-delta(1) 0 delta(1)]);
a=addmf(a,'input',1,'Pm','trapmf' ,[0 delta(1) 2*delta(1) 2*delta(1)]);
% plotmf(a,'input',1)
% pause
a=addvar(a,'input','detheta',[-2*delta(2) 2*delta(2)]);
a=addmf(a,'input',2,'Nm','trapmf' ,[-2*delta(2) -2*delta(2) -delta(2) 0]);
a=addmf(a,'input',2,'Ze','trimf' ,[-delta(2) 0 delta(2)]);
a=addmf(a,'input',2,'Pm','trapmf' ,[0 delta(2) 2*delta(2) 2*delta(2)]);
% plotmf(a,'input',2)
% pause
a=addvar(a,'output','dukr_theta',[-0.5 0.5]);
a=addmf(a,'output',1,'unu' ,'linear',delta(3)*[delta(5) delta(6) 0]);
a=addmf(a,'output',1,'doi','linear',delta(4)*[delta(7) delta(8) 0]);
%
a=addvar(a,'output','dukl_theta',[-0.5 0.5]);
a=addmf(a,'output',2,'unu' ,'linear',delta(4)*[delta(5) delta(6) 0]);
a=addmf(a,'output',2,'doi','linear',delta(3)*[delta(7) delta(8) 0]);
%
ListaReguli=[1 1 1 1 1 1
		     1 2 1 2 1 1
             1 3 2 1 1 1
			 2 1 2 2 1 1
		     2 2 1 1 1 1
             2 3 1 2 1 1
             3 1 2 1 1 1
		     3 2 2 2 1 1
             3 3 2 1 1 1];

assignin('base','ListaReguli',ListaReguli)
a=addrule(a,ListaReguli);assignin('base','a',a)
writefis(a,'regPI');assignin('base','a',a)