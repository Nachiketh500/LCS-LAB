%NACHIKETH E T
% NNM23EE048
% BATCH 1
% 11-01-2025

clear all; 
close all; 
clc; 
%%%Defining displacement x(t), charge q(t) and flux phi(t) using symbolic math functions 
syms x(t) q(t) phi(t) 
%%%Defining variables to provide initial conditions 
Dx=diff(x); 
Dq=diff(q); 
Dphi=diff(phi); 
%%%Enter design specifications  
M=input('Enter value of Mass in kg: '); 
B=input('Enter value of Damper constant in Ns/m:'); 
K=input('Enter value of Spring constant in N/m:'); 
F=input('Enter Force applied in N:'); 
%%%Defining second order mechanical differential equation and giving initial conditions 
ode=M*diff(x,t,2)+B*diff(x,t)+K*x==F; 
cond1=x(0)==0; 
cond2=Dx(0)==0; 
conds=[cond1 cond2]; 
%%%Solving differential equation  
ySol(t)=dsolve(ode,conds) 
ySol=simplify(ySol)
%%%Plotting the equation 
figure 
fplot(ySol,[0 50]) 
grid on 
xlabel('time(s)')
ylabel('displacement (m)') 
title('Displacement variation in a mechanical system') 
%%Force-voltage analogy 
R_FV=B 
C_FV=1/K 
L_FV=M 
V=F 
Ode_FV=L_FV*diff(q,t,2)+R_FV*diff(q,t)+(1/C_FV)*q==V; 
cond3=q(0)==0; 
cond4=Dq(0)==0; 
conds1=[cond3 cond4]; 
ySol1(t)=dsolve(Ode_FV,conds1) 
ySol1=simplify(ySol1) 
figure 
fplot(ySol1,[0 50]) 
grid on 
xlabel('time') 
ylabel('charge') 
title('Force-Voltage analogy') 
%%Force-current analogy 
R_FI=1/B 
C_FI=M 
L_FI=1/K 
I=F 
Ode_FI=C_FI*diff(phi,t,2)+(1/R_FI)*diff(phi,t)+(1/L_FI)*phi==I; 
cond5=phi(0)==0; 
cond6=Dphi(0)==0; 
conds2=[cond5 cond6]; 
ySol2(t)=dsolve(Ode_FI,conds2) 
ySol2=simplify(ySol2) 
figure 
fplot(ySol2,[0 50]) 
grid on 
xlabel('time') 
ylabel('flux') 
title('Force-Current analogy') 
