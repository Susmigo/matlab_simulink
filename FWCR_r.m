%  Full Wave Bridge Controlled Rectifier with R Load
clc;clear all;close all;
em=230*sqrt (2);
alphal=input('enter the delay angle at which thyristor is trigger degree=');
alpha=alphal*pi/180; td=pi/256;
r=2;
t0=[0:td:alpha];
t1=[alpha:td:pi]; 
t2=[pi:td:pi+alpha];
t3=[pi+alpha:td: 2*pi];
t=[t0 t1 t2 t3];
vdc=(em/pi)*(1+cos(alphal));
v0=[0*sin(t0) em*sin(t1) 0*sin(t2) -em*sin(t3)];
i0=[0*sin(t0) em*sin(t1)/r 0*sin(t2) -em*sin(t3)/r];
vth1=[em*sin(t0) 0*em*sin(t1) em*sin(t2) em*sin(t3)];
plot(t,v0,'-',t,i0,'--',t,vth1,':',t, vdc);
xlabel('cycle');
ylabel('magnitude');title(' Full Wave Bridge Controlled Rectifier with R Load');
grid;
legend('v0','i0','vth1','vdc');

%{
result
enter the delay angle at which thyristor is trigger degree=30

%}