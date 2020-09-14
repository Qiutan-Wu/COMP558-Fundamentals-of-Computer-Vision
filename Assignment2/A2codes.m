
%A is the original image
A=imread('manor.png');
A=rgb2gray(A);
A=double(A);

%--------------------------------------------------------------------------
%Q1
%C is A's 7-level Gaussian Pyramid
C=createGaussianPyramid(A,7);
plotPyramid(C,7,1);

%Q2
%D is A's 6-level Laplacian Pyramid
D=createLaplaciannPyramid(C,7);
plotPyramid(D,6,2);

%--------------------------------------------------------------------------
%Q3
threshold=3;
keypoints=findKeypoints(D,6,threshold);
plotKeypoints(A,keypoints,3);

%--------------------------------------------------------------------------
%Q4 & Q5
%K is the index of the selected keypoint fo illustration in the keypoint list
K=100;
features=constructFeatures(C,keypoints,K,4);

%--------------------------------------------------------------------------
% %Q6
x0=[400 600];
y0=[700 650];
theta=[10 -30];
s=[0.8 1.2];

% x0=[500 600];
% y0=[500 650];
% theta=[45 -30];
% s=[0.8 1.2];

A1=RotateScale(A,x0(1),y0(1),theta(1),s(1));
A2=RotateScale(A,x0(2),y0(2),theta(2),s(2));

RSfigureCompare(A,A1,x0(1),y0(1),theta(1),s(1),6);
RSfigureCompare(A,A2,x0(2),y0(2),theta(2),s(2),7);
% 
% 
%-------------------------------------------------------------------------- 
%Q7
%Select a region of interest and crop it out of the original image.
%The region's size is defined by (2Rx+1)*(2Ry+1)

Rx=300;
Ry=300;

Acropped1=A(x0(1)-Rx:x0(1)+Rx,y0(1)-Ry:y0(1)+Ry);
Acropped2=A(x0(2)-Rx:x0(2)+Rx,y0(2)-Ry:y0(2)+Ry);
A1cropped=A1(x0(1)-Rx:x0(1)+Rx,y0(1)-Ry:y0(1)+Ry);
A2cropped=A2(x0(2)-Rx:x0(2)+Rx,y0(2)-Ry:y0(2)+Ry);

threshold2=2;
Ccropped1=createGaussianPyramid(Acropped1,7);
Dcropped1=createLaplaciannPyramid(Ccropped1,7);
keypointsCropped1=findKeypoints(Dcropped1,6,threshold2);
featuresCropped1=constructFeatures(Ccropped1,keypointsCropped1,0,0);

Ccropped2=createGaussianPyramid(Acropped2,7);
Dcropped2=createLaplaciannPyramid(Ccropped2,7);
keypointsCropped2=findKeypoints(Dcropped2,6,threshold2);
featuresCropped2=constructFeatures(Ccropped2,keypointsCropped2,0,0);

C1cropped=createGaussianPyramid(A1cropped,7);
D1cropped=createLaplaciannPyramid(C1cropped,7);
keypoints1Cropped=findKeypoints(D1cropped,6,threshold2);
features1Cropped=constructFeatures(C1cropped,keypoints1Cropped,0,0);

C2cropped=createGaussianPyramid(A2cropped,7);
D2cropped=createLaplaciannPyramid(C2cropped,7);
keypoints2Cropped=findKeypoints(D2cropped,6,threshold2);
features2Cropped=constructFeatures(C2cropped,keypoints2Cropped,0,0);

match1=findMatchPoints(featuresCropped1,features1Cropped,0.2);
plotMatchPointsInRegionOfInterest(Acropped1,A1cropped,match1,Rx,Ry,8);


match2=findMatchPoints(featuresCropped2,features2Cropped,0.18);
plotMatchPointsInRegionOfInterest(Acropped2,A2cropped,match2,Rx,Ry,9);

