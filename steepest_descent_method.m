clc;clear all
syms x y z
f=0.5*x^2+2.5*y^2;
gradf=gradient(f);
fprintf('The Gradient is: %s\n',char(gradf));
H=double(jacobian(gradient(f)))
itermax=5; % Quadratic
fprintf('Iteration 1:\n')
x0=[5;1]   % initial search point
tol=1e-2;error=1;
for i=1:itermax
functionValueOld=double(subs(f,{x,y},x0'))
grad = double(subs(gradf,{x,y},x0'))
disp('Numerator and denominator')
gradgrad=grad'*grad
gradHgrad=grad'*H*grad
lambda=(gradgrad)/(gradHgrad)
x0=x0-lambda*grad
functionValue=double(subs(f,{x,y},x0'))
error=abs((functionValue-functionValueOld)/functionValueOld)
if abs(error)<tol
    disp('Convergence reached')
    break;
end
fprintf('Iteration %d\n',i+1)
end
