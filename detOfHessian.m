syms x y
f=3*x^2+6*y^2+4*x^2*y^2+6*x+2;%2*x^2+2*y^2+4*x^2*y^2;
gradf=gradient(f);
Hsym=(jacobian(gradient(f)));
xSample=-10:0.1:14;
ySampleGradient=[];
ySampleH11=[];
ySampleH22=[];
for i=1:length(xSample)
    H=double(subs(Hsym,{x,y},{xSample(i),xSample(i)}));
    ySampleGradient=[ySampleGradient double((subs(gradf,{x,y},{xSample(i),xSample(i)})))];
    ySampleH11=[ySampleH11 double(det(H(1,1)))];
    ySampleH22=[ySampleH22 double(det(H))];
    if H(1,1)>=0 && H(2,2)>=0
        disp('diagonal>0')
    else
        disp ('diagonal!>0')
    end
end
figure(1)
plot(xSample,ySampleH11,'b',xSample,ySampleH22,'g',xSample,ySampleGradient(1,:),'k',xSample,ySampleGradient(2,:),'k')
grid on
xlabel('Sample space within the given domain')
ylabel('parameter values')
legend('det(M1)','det(M2)','Slope-X','Slope-Y')

figure(2)
fsurf(f,[0 1 0 1 ])