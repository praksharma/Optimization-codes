clc;clear all
syms x y z
f=x-y+2*x^2+2*x*y+y^2;
gradf=gradient(f);
fprintf('The Gradient is: %s\n',char(gradf));
H=double(jacobian(gradient(f)))
itermax=3; % Quadratic
fprintf('Iteration 1:\n')
x0=[0;0]   % initial search point
tol=1e-2;error=1;

for i=1:itermax
functionValueOld=double(subs(f,{x,y},x0'))
grad = double(subs(gradf,{x,y},x0'))
lambda=(grad'*grad)/(grad'*H*grad)
x0=x0-lambda*grad
grad_new=double(subs(gradf,{x,y},x0'))
% conjugate gradient
S0=-grad
beta=(grad_new'*grad_new)/(grad'*grad)
S0=-grad_new+beta*S0
% optimal distance
lambda=(-grad_new'*S0)/(S0'*H*S0)
x0=x0+lambda*S0
functionValue=double(subs(f,{x,y},x0'))
error=abs((functionValue-functionValueOld)/functionValueOld)
if abs(error)<tol
    disp('Convergence reached')
    break;
end
fprintf('Iteration %d\n',i+1)
end
