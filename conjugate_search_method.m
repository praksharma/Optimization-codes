% Conjugate search method
clc 
clear all
syms x y z S2
f=x^2-x*y+3/2*y^2+0.5*x;%2*x^2+y^2-3;
%b=[0,0,0] % coeff of x,y,z
%c=-3       % coeff of constant
gradf=gradient(f);
fprintf('The Gradient is: %s\n',char(gradf));
H=double(jacobian(gradient(f)))
itermax=2; % Quadratic
fprintf('Iteration 1:\n')
x0=[-1;-1]   % initial search point
S0=[1;1]  % initial search direction

for i=1:itermax
grad = double(subs(gradf,{x,y},x0'))
disp('Numerator and denominator')
gradS0=grad'*S0
sHs=S0'*H*S0
lambda=-gradS0/sHs
% fprintf('shs= %s\n',char(sym(sHs)))
% fprintf('lambda= %s\n',char(sym(lambda)))
x0=x0+lambda*S0
functionValue=double(subs(f,{x,y},x0'))
if i<itermax    
    fprintf('Iteration %d\n',i+1)
    % getting S2
    temp=sym(S0'*H);
    equation=temp*[1;S2]==0
    
    S2=double(solve(equation))
    S0=[1;S2]
end
end
fprintf('The optimal value are %g and %g\n',x0(1),x0(2))
