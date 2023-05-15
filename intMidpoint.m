function re=intMidpoint(fun,a,b,n)
% creating interpolants by the midpoint rule

h=(b-a)/n;
for i=1:n-1
    x(i)=a+h/2+i*h;
    t(i)=fun(x(i));
end
re=sum(t)*h;
end