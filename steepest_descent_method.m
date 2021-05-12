clc;clear all
syms x y z
f=x-y+2*x^2+2*x*y+y^2 %x^2+y^2%0.5*x^2+2.5*y^2;
x0=[0;0]   % initial search point
gradf=gradient(f);
fprintf('The Gradient is: %s\n',char(gradf));
Hfunc=double(jacobian(gradient(f)))
itermax=5; % Quadratic
fprintf('Iteration 1:\n')
tol=1e-2;error=1;

for i=1:itermax
H = double(subs(Hfunc,{x,y},x0'))
fprintf('H= %s\n',char(sym(H)))
functionValueOld=double(subs(f,{x,y},x0'))
fprintf('functionValueOld= %s\n',char(sym(functionValueOld)))
grad = double(subs(gradf,{x,y},x0'))
fprintf('grad= %s\n',char(sym(grad)))
disp('Numerator and denominator')
gradgrad=grad'*grad
fprintf('gradgrad= %s\n',char(sym(gradgrad)))
gradHgrad=grad'*H*grad
fprintf('gradHgrad= %s\n',char(sym(gradHgrad)))
lambda=(gradgrad)/(gradHgrad)
fprintf('lambda= %s\n',char(sym(lambda)))
x0=x0-lambda*grad
fprintf('x0= %s\n',char(sym(x0)))
functionValue=double(subs(f,{x,y},x0'))
fprintf('functionValue= %s\n',char(sym(functionValue)))
error=abs((functionValue-functionValueOld)/functionValueOld)
if abs(error)<tol
    disp('Convergence reached')
    break;
end
fprintf('Iteration %d\n',i+1)
end
