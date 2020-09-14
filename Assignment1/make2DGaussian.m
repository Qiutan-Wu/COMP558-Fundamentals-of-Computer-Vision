function g = make2DGaussian(N, sigma)
% N is assumed to be odd, and so the origin (0,0) is positioned at indices
% (M+1,M+1) where N = 2*M + 1.
M=(N-1)/2;

[x, y] = meshgrid(-M:M, -M:M);
A=1/(2*pi*sigma^2);
k=(x.^2+y.^2)/(2*sigma^2);
g=A*exp(-k);

end