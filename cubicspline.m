function [y, yd, ydd, abc] = cubicspline(x, xj, fj)
% function for creating piecewise polynomials interpolants

% define functions and variables
phi = @(x) abs(x).^3;
phi2= @(x) x.^2;
phi3= @(x) abs(x)

N = length(xj);
A = [ones(N,1) xj phi(xj - xj(2:N-1)')];
abc = A\fj;

% evaluate at specified points
X = x-xj(2:N-1)';
y = abc(1) + abc(2)*x +  phi(X)*abc(3:N);
yd = abc(2) + 3*phi2(X)*sign(X)*abc(3:N);
ydd = 6*phi3(X)*abc(3:N);