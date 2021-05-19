clear all
% Assumption-the function is unimodal

% Fibonacci function
clc

N=8;
fprintf('N= %d\n',N)
a=-0.25;
fprintf('Xl= %g\n',a)
b=6;
fprintf('Xu= %g\n',b)

I_initial=b-a;
fprintf('I_initial= %g\n',I_initial)

for i=1:N
    fprintf('\nIteration: %g\n',i)
	I=fibo(N-i)/fibo(N)*I_initial;
    fprintf('I= %g\n',I)
    fprintf('Xl= %g\n',a)
    fprintf('Xu= %g\n',b)
	a_new=b-I;
    fprintf('Xa= %g\n',a_new)
	b_new=a+I;
    fprintf('Xb= %g\n',b_new)
	fprintf('f(Xa)= %g\n',func(a_new))
    fprintf('f(Xb)= %g\n',func(b_new))
	
    % Looping
	if func(a_new)<func(b_new)
		b=b_new;
	else 
		a=a_new;
    end
    
    % Stopping criteria
    if func(a_new)==func(b_new)
        break;
    end
end

function num=fibo(N)
f=[1,2,3,5,8,13,21,34];

    if N==0
        num=1
    else
        num=f(N)
    end

end
% Function evaluation
function num1=func(x)
	num1=4/3*x^3+x^2-8*x+6;%x^2-8*x+19;%x^2-10*x+26;
end