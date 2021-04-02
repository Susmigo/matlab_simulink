clc;clear;close all;
num=input('enter the numerator coefficients');
den=input('enter the denominator coefficients');
t=tf(num,den)
rlocus(t);
