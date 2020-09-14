%Create a (N-1)-layer Laplacian Pyramid from a given N-layer Gaussian
%Pyramid C
function D=createLaplaciannPyramid(C,N)
for i=1:N-1
    upsample=size(C{1,i})/size(C{1,i+1});
    successive=imresize(C{1,i+1},upsample,'bilinear');
    D{1,i}=C{1,i}-successive(1:size(C{1,i},1),1:size(C{1,i},2));
end