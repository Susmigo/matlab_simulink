%{
closed loop transfer function  of the second order system
%}
clc;clear all;close all;
t=linspace(0,12,100);
c=zeros(size(t));
zeta=0:0.2:1;
for n=1:6
    num_cof=[0 0 1];
    den_cof=[1 2*zeta(n) 1];
    c(1:100,n)=step(num_cof,den_cof,t);
end
plot(t,c);grid on;
xlabel('time in sec');
ylabel('unit step response c(t)');
text(2.8,1.8,'\zeta=0');
text(2.8,1.5,'\zeta=0.2');
text(2.8,1.3,'\zeta=0.4');
text(2.8,1.1,'\zeta=0.6');
text(2.8,0.9,'\zeta=0.8');
text(2.8,0.7,'\zeta=1.0');
legend('\zeta=0','\zeta=0.2','\zeta=0.4','\zeta=0.6','\zeta=0.8','\zeta=1.0');

    
