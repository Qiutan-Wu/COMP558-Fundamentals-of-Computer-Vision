function I0=RotateScale2(image,x0,y0,theta,s)
%save the original size of the image in N0
N0=size(image,1);
%first step: scale the image by s, obtain a new image I1
I1=imresize(image,s);
%the new position of (x0,y0) in the scaled image
x1=floor(x0*s);
y1=floor(y0*s);
N1=size(I1,1);
%if s<1, put the scaled image in a original-size image
%zero pad the rest of the image
%make this new original-size image I1
if(s<1)
    It=I1;
    I1=zeros(N0);
    I1(x0-x1+1:x0-x1+N1,y0-y1+1:y0-y1+N1)=It;
    x1=x0;
    y1=y0;
    N1=size(I1,1);
end
%construct a larger image I2 which contains the scaled image and the center is (x1,y1)
%zero pad the region other than I1
Nx=2*max(x1-1,N1-x1)+1;
Ny=2*max(y1-1,N1-y1)+1;
cx=(Nx-1)/2+1;
cy=(Ny-1)/2+1;
I2=zeros(Nx,Ny);
I2(cx-x1+1:cx-x1+N1,cy-y1+1:cy-y1+N1)=I1;

%use imrotate() to rotate I2 since now (x1,y1) is its center
I2=imrotate(I2,theta,'crop');

%crop the origina-size image from I2
I0=I2(cx-x0+1:cx-x0+N0,cy-y0+1:cy-y0+N0);



