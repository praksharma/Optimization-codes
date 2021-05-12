clc;clear all
syms x y z
f=4*x^2+y^2-2*x*y%2*x^2+2*y^2+4*x^2*y^2;
x0=[1;1]   % initial search point
gradf=gradient(f)
%fprintf('The Gradient is: %s\n',char(gradf));
Hsym=(jacobian(gradient(f)))
itermax=3; % Quadratic
fprintf('Iteration 1:\n')

tol=1e-2;error=1;

for i=1:itermax
    grad = double(subs(gradf,{x,y},x0'))
    fprintf('grad= %s\n',char(sym(grad)))
    H=double(subs(Hsym,{x,y},x0'))
    fprintf('H= %s\n',char(sym(H)))
    disp('Determinant of hessian')
    det(H)
    disp(sym(det(H)));
    disp('Inverse of hessian')
    invHessian=inv(H)
    disp(sym(invHessian));
    x0=x0-invHessian*grad
    fprintf('x0= %s\n',char(sym(x0)))
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