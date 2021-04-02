% Half wave bridge controlled rectifier with r load

clc; clear all;close all;
alphal=input('enter the value of delay angle in degree=');
alpha=alphal*pi/180;
t1=linspace(0,alpha,1024);
t2=linspace(alpha,pi,1024);
t3=linspace(pi,2*pi,1024);
t=[t1 t2 t3];
em=230*sqrt(2);
r=15; 
v0=[0*sin(t1) em*sin(t2) em* sin(t3)];
i0=v0/r;
plot(t, v0,'-',t,i0,'--');
xlabel('conduction angle');
ylabel('output voltage (VO) & current (i0)');
title('Half wave bridge controlled rectifier with r load');
grid;
legend('v0','io');


%{ 
result:
enter the value of delay angle in degree=30
%}