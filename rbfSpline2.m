function u = rbfSpline2(x, y, xj, yj, fj)
% function for constructing high order interpolants 
% of unstructured data

% specify the radial basis function
phi=@(r) r;  
xj=xj(:);
yj=yj(:);
fj=fj(:);
N = length(fj);
dist = sqrt((xj-xj').^2 + (yj-yj').^2);
A = [zeros(3,3) [ones(N,1) xj yj]'
     ones(N,1) xj yj dist];
abc = A\[zeros(3,1); fj];

% compute the spline at the specified points
u=nan(size(x));
dist = sqrt((x(:)-xj').^2 + (y(:)-yj').^2)
u(:) = abc(1) + abc(2)*x(:) + abc(3)*y(:) + dist*abc(4:N+3);
end