%Full Wave Bridge Controlled Rectifier with RL Load

clc;clear all; close all;
em=230*sqrt(2);
alphal=input('enter the delay angle at which thyristor is trigger degree=');
alpha=alphal*pi/180; td=pi/256;
r=2;
l=0.08;
omegal=2*pi*50*l;
xl=omegal/r;
i0min=2*em*sin(alpha)/(pi*xl);
t0=[0:td:alpha];
t1=[alpha:td:pi+alpha];
t2=[pi+alpha:td:2*pi+alpha]; 
t=[t0 t1 t2];
vdc=2*(em/pi)*cos(alpha);
i0=vdc/r;
v0=[0*sin(t0) em*sin(t1) -em*sin(t2)];
vth1=[em*sin(t0) 0*em*sin(t1) em*sin(t2)]; 
plot(t,zeros(size(v0)),t,v0,'-',t,vth1,'--',t,vdc,'-.',t,i0);
xlabel('frequncy');
ylabel ('magnitude');
grid;
legend('v0','vth1','vdc');
title('Full Wave Bridge Controlled Rectifier with RL Load');

%{
enter the delay angle at which thyristor is trigger degree=30
%}