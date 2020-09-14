function [even, odd] = make2DGabor(N, lambda, angle)
% N is assumed to be odd, and so the origin (0,0) is positioned at indices
% (M+1,M+1) where N = 2*M + 1.
% lambda : wavelength of the Gabor filter
% angle : orientation of the Gabor filter
% Set sigma of Gaussian part of filter = wavelength lambda 
M=(N-1)/2;

[x, y] = meshgrid(-M:M, -M:M);

rotation=x*cosd(angle)+y*sind(angle);
%even
sinusoid_even = cos(2*pi/lambda*rotation);
%odd
sinusoid_odd = sin(2*pi/lambda*rotation);
%Gaussian filter
g=exp(-(x.^2+y.^2)/(2*lambda^2))/(2*pi*lambda^2);

even=g.*sinusoid_even;
odd=g.*sinusoid_odd;
end