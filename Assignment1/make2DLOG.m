function g = make2DLOG(N, sigma)
% N is assumed to be odd, and so the origin (0,0) is positioned at indices
% (M+1,M+1) where N = 2*M + 1.
M=(N-1)/2;

[x, y] = meshgrid(-M:M, -M:M);
k=(x.^2+y.^2)/(2*sigma^2);
g=-1/(pi*sigma^4)*exp(-k).*(1-k);
end





