%Program to find Bode Plot
%{ 
  25(s+1)(s+7)
 -------------
 s(s+2)(s+4)(s+8)
 %}
clc;clear all;close all;
% initialzations
k=input('enter the gain---->');
z=input('enter the zeros---->');
p=input('enter the ploes---->');
t=zpk(z,p,k);
bode(t);
grid on;
[Gm,Pm,Wgc,Wpc]=margin(t);
disp(Gm);
disp(Pm);
disp(Wgc);
disp(Wpc); 

%{
result:

enter the gain---->25
enter the zeros---->[-1 -7]
enter the ploes---->[0 -2 -4 -8]
   Inf

   63.1105

   Inf

    3.7440
%}