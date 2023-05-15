function [f, fx, fy] = GaussSpline2D(x, y, xj, yj, fj, epsilon)
% Function for evaluating interpolant using gaussian radial
% basis function
% Author: Mingye Liu 21220003044
% Last update: 7 April 2023 19:51

% specify the radial basis function and variables
phi=@(r) exp(-(epsilon^2)*(r.^2)); 

xj=xj(:);
yj=yj(:);
fj=fj(:);

f=nan(size(x));
fx=nan(size(x));
fy=nan(size(y));

% calculate coefficients
N = length(fj);
dist = sqrt((xj-xj').^2 + (yj-yj').^2);
A = [zeros(3,3) [ones(N,1) xj yj]'
ones(N,1),xj,yj,phi(dist)];
abc = A\[zeros(3,1); fj];

% calculate interpolant points
dist = sqrt((x(:)-xj').^2 + (y(:)-yj').^2);
f(:) = abc(1) + abc(2)*x(:) + abc(3)*y(:) + phi(dist)*abc(4:N+3);
fx(:) = abc(2) + (-1)*2*(epsilon^2)*phi(dist).*(x(:)-xj')*abc(4:N+3);
fy(:) = abc(3) + (-1)*2*(epsilon^2)*phi(dist).*(y(:)-yj')*abc(4:N+3);

end