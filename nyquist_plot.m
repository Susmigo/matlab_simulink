%Program to find the Nyquist Plot
%{
    50(s+1)
  ------------
   s(s+3)(s+5)
 %}
clc;clear all;close all;
% initialzations
num=input('enter the numerator coefficients---->');
den=input('enter the denominator coefficients---->');
sys=tf(num,den);
nyquist(sys);
title('Nyquist Plot');
[Gm,Pm,Wgc,Wpc]=margin(sys);
disp(Gm);
disp(Pm);
disp(Wgc);
disp(Wpc);


%{
result

enter the numerator coefficients---->[50 50]
enter the denominator coefficients---->[1 8 15]

 Inf

   98.0516

   NaN

   49.6681


%}

