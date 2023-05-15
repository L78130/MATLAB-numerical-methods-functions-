function y=euler_gen(func,t,y0)
% function for calculating ODE with euler method
% func must be @(t,y)
   n=length(t);
   y=nan(length(y0),n);
   y(:,1)=y0(:);
   for k=1:n-1
       h=t(k+1)-t(k);
       y(:,k+1)=y(:,k)+h*func(t(k),y(:,k));
   end
end

