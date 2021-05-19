clear all
format short
% Assumption-the function is unimodal

% Golden section search
clc

N=15; % maximum iteration
a=0;
fprintf('Xl= %g\n',a)
b=2;
fprintf('Xu= %g\n',b)
K=1.61803398875;
fprintf('Golden ratio= %g\n',K)
I=b-a;
fprintf('I_initial= %g\n',I)
tol=0.01;
fprintf('Tolerance= %g\n',tol)

for i=1:N
    fprintf('\nIteration: %g\n',i)
	I=I/K;
    fprintf('I= %g\n',I)
    
	a_new=b-I;
    fprintf('Xa= %g\n',a_new)
	b_new=a+I;
    fprintf('Xb= %g\n',b_new)
	fprintf('f(Xa)= %g\n',func(a_new))
    fprintf('f(Xb)= %g\n',func(b_new))
    % looping
    % for minimization use (<), and for maximization use (>)
	if func(a_new)<func(b_new)
		b=b_new;
        disp('f(Xa)<f(Xb)')
        
	else 
		a=a_new;
        disp('f(Xa)>f(Xb)')
    end
    fprintf('Xl= %g\n',a)
    fprintf('Xu= %g\n',b)
    fprintf('abs(a-b)= %g\n',abs(a-b))
    
    % Stopping criteria
    if abs(a-b)<tol
       
        break ;
      
    end
    
end


% Function evaluation
function num1=func(x)
	num1=4/3*x^3+x^2-8*x+6;%4*sin(x).*(1+cos(x));%x^2-8*x+19;
end