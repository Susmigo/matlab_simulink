% Half wave rectifier with RL load
clc;clear;close all;
r=input('enter the value of the load resistance in ohms='); 
l=input ('enter the value of load inductance in (henry) ='); 
td=pi/256;
t=0:td:2*pi-td;
em=230*sqrt(2);
phase=atan(l/r);
es=em*sin(t);
iO=em/(sqrt(r^2+1^2))*(sin(phase)*exp(-r*t/1)+sin(t-phase));
vO=es.*(iO>=0) ; vO; iO=iO.*(0>=0);
vd=(es-vO);
plot (t, vO, '-',t,iO,'--',t,vd,':');
xlabel ('frequency');
ylabel('amplitude'); 
legend ('vO','iO', 'vd');
title ('Half wave rectifier with RL load');
grid;

%{
result:
enter the value of the load resistance in ohms=10
enter the value of load inductance in (henry) =10
%}