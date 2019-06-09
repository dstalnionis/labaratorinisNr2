close all; clear all; clc; format long;
global f
f = @(x)100*(x(2) - x(1)^2)^2 + (1 - x(1))^2
stud_nr = 20170166
x01  = mod(stud_nr,10)/2+1
x02  = mod(stud_nr,10)/2+1
alfa = 0.5
maxiter = 10^5

x0 = [1.2,1];
eps=10^-4;
[x,K,KK] = nelder_mead(x0,alfa,eps,maxiter)

x0 = [x01,x02];
eps=10^-6;
[x,K,KK] = nelder_mead(x0,alfa,eps,maxiter)

f = @(x)100*(x(2) - x(1)^2)^2 + (1 - x(1))^2;

x0 = [1,1];
options = optimset('Display','iter','PlotFcns',@optimplotfval);
x = fminsearch(f,x0,options)
Fmin=f(x)

x0 = [x01,x02];
tiksl = 1e-6;
options = optimset('TolX',tiksl,'Display','iter','PlotFcns',@optimplotfval);
x = fminsearch(f,x0,options)
Fmin=f(x)

x1 = [-10:1:10];
x2 = [-10:1:10];
[xx1,xx2]=meshgrid(x1,x2);
zz=100.*(xx2-xx1.^2).^2+(1-xx1).^2;
surf(xx1,xx2,zz);
