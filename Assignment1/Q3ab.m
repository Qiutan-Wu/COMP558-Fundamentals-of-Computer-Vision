close all;

sigma=02;
n=13;

%A is the original image, A1 is its gray version
A=imread('Paolina.jpg');
% A=imread('myImage.jpg');
A1=rgb2gray(A);

[N,M]=size(A1);

log=make2DLOG(n,sigma);

B=conv2(A1,log,'same');

% A pixel is detected as lying on an edge if it is a zero crossing of the
% filtered response.
%Check zero-crossing in a 3*3 area and for 8 directions(4 pairs of neighbors)
%A pixel lies on the edge if one or more pairs of neighbors have different
%signs
%The threshold of zero-crossing detection, set as 0 if not use.
threshold=1;
C=zeros(size(A1));
for i=2:N-1
    for j=2:M-1
        if((B(i-1,j)*B(i+1,j)<0&&abs(B(i-1,j)-B(i+1,j))>threshold)||(B(i,j-1)*B(i,j+1)<0&&abs(B(i,j-1)-B(i,j+1))>threshold)||(B(i+1,j-1)*B(i-1,j+1)<0&&abs(B(i+1,j-1)-B(i-1,j+1))>threshold)||(B(i-1,j-1)*B(i+1,j+1)<0&&abs(B(i-1,j-1)-B(i+1,j+1))>threshold))    
            C(i,j)=255;
        end
    end
end

%plot the edges on the original image
D = imoverlay(A,C,[1,1,0]);

g=make2DGaussian(n,sigma);
E=conv2(A1,g,'same');

figure(1)
imshow(E,[])

figure(2)
imshow(B,[])

figure(3)
imshow(C,[])

figure(4)
imshow(D,[])
