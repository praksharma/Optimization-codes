% Conjugate search method
clc 
clear all
syms x y z S2
f= 2*x^2+y^2-3%x^2-x*y+3/2*y^2+0.5*x;%2*x^2+y^2-3;
x0=[1;1]   % initial search point
S0=[-4;-2]  % initial search direction
%b=[0,0,0] % coeff of x,y,z
%c=-3       % coeff of constant
gradf=gradient(f);
fprintf('The Gradient is: %s\n',char(gradf));
Hfunc=double(jacobian(gradient(f)))

itermax=2; % Quadratic
fprintf('Iteration 1:\n')



for i=1:itermax
H = double(subs(Hfunc,{x,y},x0'))
fprintf('H= %s\n',char(sym(H)))
grad = double(subs(gradf,{x,y},x0'))
fprintf('grad= %s\n',char(sym(grad)))
disp('Numerator and denominator')

gradS0=-grad'*S0
fprintf('gradS0= %s\n',char(sym(gradS0)))
sHs=S0'*H*S0
fprintf('shs= %s\n',char(sym(sHs)))
lambda=gradS0/sHs
fprintf('lambda= %s\n',char(sym(lambda)))
x0=x0+lambda*S0
fprintf('x0= %s\n',char(sym(x0)))
functionValue=double(subs(f,{x,y},x0'))
fprintf('f(x0)= %s\n',char(sym(functionValue)))
if i<itermax    
    fprintf('Iteration %d\n',i+1)
    % getting S2
    temp=sym(S0'*H);
    disp('New search direction');
    equation=temp*[1;S2]==0
    
    S2=double(solve(equation))
    S0=[1;S2]
end
end
fprintf('The optimal value are %g and %g\n',x0(1),x0(2))
