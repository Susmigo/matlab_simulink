%Program to find the Parallel Resonance
clc;
clear all;
close all;
r=input('enter the resistance value----->');
l=input('enter the inductance value------>');
c=input('enter the capacitance value----->');
v=input('enter the input voltage------->');
f=linspace(0,50);
xl=2*pi.*f*l;
xc=(1./(2*pi.*f*c));
b1=1./xl;
bc=1./xc;
b=b1-bc; 
g=1/r;
y=sqrt((g^2)+(b.^2));
i=v.*y;
subplot(2,2,1);
plot(f,b1);
grid;
xlabel('frequency');
ylabel('BL');
title('frequency vs. BL');
subplot(2,2,2);
plot(f,bc);
grid;
xlabel('frequency');
ylabel('Bc');
title('frequency vs. BC');
subplot(2,2,3);
plot(f,y);
grid;
xlabel('frequency');
ylabel('Y');
title('frequency vs. Y');
subplot(2,2,4);
plot(f,i);
grid;
xlabel('frequency');
ylabel('I');
title('frequency vs. I');

%{
enter the resistance value----->1000
enter the inductance value------>1
enter the capacitance value----->400*10^-6
enter the input voltage------->50
%}

