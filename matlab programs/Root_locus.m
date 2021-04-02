%Program to find the root locus of transfer function%
%{
  (s+5)
----------
 (s^2+7s+25)

%}
clc;clear all;close all;
num=input('enter the numerator coefficients---->');
den=input('enter the denominator coefficients---->');
sys=tf(num,den);
rlocus(sys); 
title('root locus');
grid;

%{
enter the numerator coefficients---->[1 5]
enter the denominator coefficients---->[1 7 25]
%}
