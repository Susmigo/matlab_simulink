%  Full Wave Bridge Controlled Rectifier with R Load
clc;clear all;close all;
em=230*sqrt(2);
alphal=input('enter the delay angle at which thyristor is trigger degree=');
alpha=alphal*pi/180;
r=2;
t0=linspace(0,alpha,256);
t1=linspace(alpha,pi,256); 
t2=linspace(pi,pi+alpha,256);
t3=linspace(pi+alpha,2*pi,256);
t=[t0 t1 t2 t3];
vdc=(em/pi)*(1+cos(alpha));
v0=[0*sin(t0) em*sin(t1) 0*sin(t2) -em*sin(t3)];
i0=v0/r;
vth1=[em*sin(t0) 0*em*sin(t1) em*sin(t2) em*sin(t3)];
plot(t,v0,'-',t,i0,'--',t,vth1,'-.',t, vdc);
xlabel('cycle');
ylabel('magnitude');title(' Full Wave Bridge Controlled Rectifier with R Load');
grid;
legend('v0','i0','vth1','vdc');

%{
result
enter the delay angle at which thyristor is trigger degree=30

%}