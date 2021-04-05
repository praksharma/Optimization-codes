clc;clear all
syms x y z
f=2*x^2+2*y^2+4*x^2*y^2;
gradf=gradient(f);
fprintf('The Gradient is: %s\n',char(gradf));
Hsym=(jacobian(gradient(f)))
itermax=3; % Quadratic
fprintf('Iteration 1:\n')
x0=[0.5;0.5]   % initial search point
tol=1e-2;error=1;

for i=1:itermax
    grad = double(subs(gradf,{x,y},x0'))
    H=double(subs(Hsym,{x,y},x0'))
    invHessian=inv(H)
    disp('Inverse of hessian')
    disp(sym(invHessian));
    x0=x0-invHessian*grad
    % Minor determinant
    h11=det(H(1,1))
    h22=det(H)
    if h11>0 && h22>0
        disp('Hessian is positive definite')     
    else
        fprintf('Saddle point encountered')
        break;
    end
fprintf('Iteration %d:\n',i+1)
end