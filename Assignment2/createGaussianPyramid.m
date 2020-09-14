%Create a N-layer Gaussian Pyramid from a given image A
function C=createGaussianPyramid(A,N)
C=cell(1,7);
sigma=zeros(1,N);
sigma(1)=1;
for i=1:7   
    G=fspecial('gaussian',3*sigma(i)+1,sigma(i));
    B=conv2(A,G,'same');
    downsample=1/sigma(i);
    C{1,i}=imresize(B,downsample,'nearest');
    sigma(i+1)=2*sigma(i);
end