clc;clear all
syms x y z
f=x-y+2*x^2+2*x*y+y^2;
gradf=gradient(f);
fprintf('The Gradient is: %s\n',char(gradf));
Hfunc=double(jacobian(gradient(f)))
itermax=3; % Quadratic
fprintf('Iteration 1:\n')
x0=[0;0]   % initial search point
tol=1e-2;error=1;


H = double(subs(Hfunc,{x,y},x0'))
fprintf('H= %s\n',char(sym(H)))
functionValueOld=double(subs(f,{x,y},x0'))
fprintf('functionValueOld= %s\n',char(sym(functionValueOld)))
grad = double(subs(gradf,{x,y},x0'))
fprintf('grad= %s\n',char(sym(grad)))
gradgrad=grad'*grad
fprintf('gradgrad= %s\n',char(sym(gradgrad)))
gradHgrad=grad'*H*grad
fprintf('gradHgrad= %s\n',char(sym(gradHgrad)))
lambda=(gradgrad)/(gradHgrad)
fprintf('lambda= %s\n',char(sym(lambda)))
 
x0=x0-lambda*grad
fprintf('x0= %s\n',char(sym(x0)))
for i=2:itermax
fprintf('Iteration %d:\n',i)   
grad_new=double(subs(gradf,{x,y},x0'))
fprintf('grad_new= %s\n',char(sym(grad_new)))
% conjugate gradient
disp('conjugate gradient')
S0=-grad
fprintf('S0= %s\n',char(sym(S0)))
numerator=grad_new'*grad_new
denominator=grad'*grad
beta=(numerator)/(denominator)
fprintf('beta= %s\n',char(sym(beta)))
S0=-grad_new+beta*S0
fprintf('S0= %s\n',char(sym(S0)))
% optimal distance
numerator=-grad_new'*S0
denominator=S0'*H*S0
lambda=(numerator)/(denominator)
fprintf('lambda= %s\n',char(sym(lambda)))
x0=x0+lambda*S0
fprintf('x0= %s\n',char(sym(x0)))
functionValue=double(subs(f,{x,y},x0'))
fprintf('functionValue= %s\n',char(sym(functionValue)))
error=abs((functionValue-functionValueOld)/functionValueOld)
if abs(error)<tol
    disp('Convergence reached')
    break;
end
%fprintf('Iteration %d\n',i+1)
end
