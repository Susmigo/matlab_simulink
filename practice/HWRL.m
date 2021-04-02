% Half wave rectifier with RL load
clc;clear;close all;
r=input('enter the value of the load resistance in ohms='); 
xl=input ('enter the value of load inductancebb reactance in (ohms) ='); 
t=linspace(0,4*pi);
em=230*sqrt(2);
wt=atan(xl/r);
vs=em*sin(t);
z=sqrt(r^2+xl^2);
iO=em/(z)*(sin(wt)*exp(-r*t/1)+sin(t-wt));
vO=vs.*(iO>=0);
iO=iO.*(0>=0);
vd=(vs-vO);
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