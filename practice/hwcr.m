clc; clear all;close all;
alphal=input('enter the value of delay angle in degree=');
alpha=alphal*pi/180;
t1=linspace(0,alpha,1024);
t2=linspace(alpha,pi,1024);
t3=linspace(pi,2*pi,1024);
t=[t1 t2 t3];
vm=230*sqrt(2);
vs=vm*sin(2*pi*t);
r=15; 
v0=(vm/2*pi)*(1+cos(alpha));
plot(t,v0,'*');
v0=[0*sin(t1) vm*sin(t2) vm* sin(t3)];
i0=v0/r;
plot(t,v0,'-',t,i0,'--');
xlabel('conduction angle');
ylabel('output voltage (VO) & current (i0)');
title('Half wave bridge controlled rectifier with r load');
grid;
legend('v0','io');
