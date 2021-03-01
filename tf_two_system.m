%{
Transfer function of two systems , to find two systems connected as 
cascade system , parallel system and feedback system
%}
clc;clear all;close all;
%{
g1=tf('s')
g2=tf('s')
gc=tf('s')
gp=tf('s')
gf=tf('s')
above section is useless
%}
num_cof1=[0 0 8];den_cof1=[1 2 9];
disp('system 1');
g1=tf([num_cof1],[den_cof1])
num_cof2=[0 4];den_cof2=[1 6];
disp('system 2');
g2=tf([num_cof2],[den_cof2])
[num_cofc,den_cofc]=series(num_cof1,den_cof1,num_cof2,den_cof2);
disp('---------------cascade system---------------');
gc=tf([num_cofc],[den_cofc])
[num_cofp,den_cofp]=parallel(num_cof1,den_cof1,num_cof2,den_cof2);
disp('---------------parallel system---------------');
gp=tf([num_cofp],[den_cofp])
[num_coff,den_coff]=feedback(num_cof1,den_cof1,num_cof2,den_cof2);
disp('---------------Feedback system---------------');
gf=tf([num_coff],[den_coff])



%{
Result:
system 1

g1 =
 
        8
  -------------
  s^2 + 2 s + 9
 
Continuous-time transfer function.

system 2

g2 =
 
    4
  -----
  s + 6
 
Continuous-time transfer function.

---------------cascade system---------------

gc =
 
            32
  -----------------------
  s^3 + 8 s^2 + 21 s + 54
 
Continuous-time transfer function.

---------------parallel system---------------

gp =
 
     4 s^2 + 16 s + 84
  -----------------------
  s^3 + 8 s^2 + 21 s + 54
 
Continuous-time transfer function.

---------------Feedback system---------------

gf =
 
         8 s + 48
  -----------------------
  s^3 + 8 s^2 + 21 s + 86
 
Continuous-time transfer function.
%}


