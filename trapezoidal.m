function [I,x,w] = trapezoidal(fun,n)
% this is a function to caculate the approximate intergration 
% using the trapezoidal rule
% all operations are vertorized and contains no for loops
% author:Mingye Liu 21220003044
% last update: 3.23.2023 21:20

h=2/(n-1);
x=-1:h:1;
w=h*ones(n,1);
w(1)=h/2;
w(n)=h/2;
f=fun(x);
f=f(:);
w_f=w.*f;
I=sum(w_f,'all');
end
