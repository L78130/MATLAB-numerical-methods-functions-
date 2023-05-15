function [I,x,w] = gausscheby(fun,n)
% this is a function to to caculate the approximate intergration 
% using Gauss-Chebyshev quadrature
% all operations are vertorized and contains no for loops
% author:Mingye Liu 21220003044
% last update: 3.23.2023 21:25

x_raw=pi/(n+1):pi/(n+1):(n*pi)/(n+1);
x=cos(x_raw);
w=pi/(n+1)*sin(x_raw);
f=fun(x);
w_f=w.*f;
I=sum(w_f,'all');
end