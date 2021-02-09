% Half wave bridge controlled rectifier with r load

clc; clear all;close all;
td=pi/512;
alphal=input('enter the value of delay angle in degree=');
alpha=alphal*pi/180;
em=230;
r=15; 
t1=[0:td:alpha];
t2=[alpha:td:pi];
t3=[pi:td:2*pi];
t=[t1 t2 t3];
v0=[zeros(size(t1)) em*sin(t2) em* sin(t3)];
i0=v0/r;
plot(t,zeros(size(t)),t, v0,'-',t,i0,'--');
xlabel('conduction angle');
ylabel('output voltage (VO) & current (i0)');
title('Half wave bridge controlled rectifier with r load');
grid;
legend('v0','io');


%{ 
result:
enter the value of delay angle in degree=30
%}