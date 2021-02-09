% Half wave rectifier with r load
clc;
clear;close all; 
f=500;
t=1/f:1/f:1;
x=sin(2*pi*t);
em=230*sqrt(2);
r=2;
es=em*sin(2*pi*t);
vO=es.*(es>=0);
iO=vO/r; 
vd=es-vO;
vdc=em/pi;
vv=ones(size(t))*vdc;
plot (t,es);
xlabel ('time'); 
ylabel ('amplitude');
plot(t,vO,'-',t,iO,'--',t, vd,':',t, vv);
xlabel ('time');
ylabel ('amplitude');
title ('Half wave rectifier with r load');
legend('v0','i0','vd','vv');
grid;

