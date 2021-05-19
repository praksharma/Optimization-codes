%CREATE  3 script files from the list below and place them in the SAME workspace - directory.
clc;clear all;
%PLACE CODE IN     newton.m

%      program newton
%***********************************************************************
% Program to find a root of a given function f(x) by the NEWTON-RAPHSON
% METHOD. MGE
%***********************************************************************

syms x
f=4/3*x^3+x^2-8*x+6
% read initial guess, convergence tolerance and maximum number of
% iterations
      x0   = 0
      eps = 0.001
      maxiter = 7
      
 
% Start Newton-Raphson iteration loop
 derivf=gradient(f)
 doublederivf=gradient(derivf)
       
       for iter=1:maxiter
 
% obtain new guess
 
        fderivx=double(subs(derivf,{x},x0))
        fdoublederivx=double(subs(doublederivf,{x},x0))
        x0=x0-fderivx/fdoublederivx
 
% check convergence
        if(abs(fdoublederivx)<=eps)
          disp([' The approximate root obtained is:',num2str(x0)]);
          disp([' It was obtained in ', num2str(iter), ' iterations']);
          break;
        end
 
      if(abs(fdoublederivx)>eps & iter==maxiter)
      disp(' The Newton-Raphson algorithm failed to find the root');
      disp(' within the prescribed tolerance after');
      disp([' ',num2str(maxiter),' iterations!!!']);
      break;
      end
      
      end


