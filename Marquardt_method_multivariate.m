clc;clear all
syms x y z lambda
variables=2
f=4+4.5*x-4*y+x^2+2*y^2-2*x*y+x^4-2*x^2*y%4*x^2+y^2-2*x*y%2*x^2+2*y^2+4*x^2*y^2;
x0=[1;2]   % initial search point
gamma=1   % adding a positive constant
gradf=gradient(f)

Hsym=(jacobian(gradient(f)))
itermax=3; % Quadratic
fprintf('Iteration 1:\n')

tol=1e-2;error=1;

for i=1:itermax
    grad = double(subs(gradf,{x,y},x0'))
    fprintf('grad= %s\n',char(sym(grad)))
    H=double(subs(Hsym,{x,y},x0'))
    fprintf('H= %s\n',char(sym(H)))
    
    % principal leading Minor determinant
    disp('principal leading Minor determinant')
    h11=det(H(1,1))
    h22=det(H)
    if h11>0 && h22>0
        disp('Hessian matrix is positive definite')     
    else
        fprintf('Need to modify the Hessian matrix')
        disp('det(H-lambda*I)=')
        charpoly=det(H-lambda*eye(variables))
        eigval=eig(H)
        negativeEig = eigval(eigval<0)
        if size(negativeEig)==0
            disp('There are no negative eigenvalues')
        end
        smallestNegativeEig=min(abs(negativeEig))
        beta=abs(smallestNegativeEig)+gamma
        H=H+beta*eye(variables)
    end
    
    
    
    disp('Determinant of hessian')
    det(H)
    disp(sym(det(H)));
    disp('Inverse of hessian')
    invHessian=inv(H)
    disp(sym(invHessian));
    x0=x0-invHessian*grad
    fprintf('x0= %s\n',char(sym(x0)))
    
fprintf('Iteration %d:\n',i+1)
end