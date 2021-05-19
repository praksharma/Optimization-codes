clc;clear all;
% The method is univariate

syms x
f=4/3*x^3+x^2-8*x+6
a=-0.25
b=6
gradf=gradient(f)
fa=double(subs(gradf,{x},a))
fb=double(subs(gradf,{x},b))
if fa*fb<0
    disp('fa*fb<0: Midpoint can be used');
else
    disp('Choose another set of initial conditions')
    return
end
tol=1e-3
error=1;
i=2;
itermax=10;
while error>tol && i<itermax
    fprintf('Iteration: %d\n',i);
    c=(a+b)/2
    fc=double(subs(gradf,{x},c))
    
    if fc*fa>0
        a=c
        b
    else
        a
        b=c
    end
    fa=double(subs(gradf,{x},a))
    fprintf('fa= %s\n',char(sym(fa)))
    fb=double(subs(gradf,{x},b))
    fprintf('fb= %s\n',char(sym(fb)))
    error =abs(fc)
    i=i+1;
    
end