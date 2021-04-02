%Program to find the series Resonance
clc;clear all;close all;
r=input('Enter the resistance value----->');
l=input('Enter the inductance value------>');
c=input('Enter the capacitance value----->');
v=input('Enter the input voltage------->');
f=5:2:300;
XL=2*pi*f*l;
XC=(1./(2*pi*f*c)); 
x=XL-XC;
z=sqrt((r^2)+(x.^2));
i=v./z;
subplot(2,2,1);
plot(f,XL);
grid;
xlabel('frequency');ylabel('XL');title('frequency vs reactance XL');
subplot(2,2,2);
plot(f,XC);
grid;
xlabel('frequency');ylabel('XC');title('frequency vs reactance XC');
subplot(2,2,3);
plot(f,z);
grid;
xlabel('frequency');ylabel('Z');title('frequency vs Impedance Z');
subplot(2,2,4);
plot(f,i);
grid;
xlabel('frequency');ylabel('I');title('frequency vs current I');


%{
result
Enter the resistance value----->15
Enter the inductance value------>0.1
Enter the capacitance value----->10*10^-6
Enter the input voltage------->50
%}