%practice
clc;clear;close all;
k=input('enter the gain=');
z=input('enter the zeros=');
p=input('enter the poles=');
sys=zpk(z,p,k);
t=tf(sys)
bode(sys);
grid;
[Gm,Pm,Wgc,Wpc] = margin(sys);
fprintf('gain margin is %f\n',Gm);
fprintf('phase margin is %f\n',Pm);
fprintf('gain cross over frequency is %f\n',Wgc);
fprintf('phase cross over frequency is %f\n',Wpc);

