rgb = imread('2.png');
img = single(rgb2gray(rgb));
theta = 45;
rgb2=imrotate(rgb,theta,'crop');
img2=imrotate(img,theta,'crop');

Rx=100;
Ry=100;
k=0;
Cx=floor(size(img,1)/2);
Cy=floor(size(img,2)/2);
Rimg=img(Cx-Rx:Cx+Rx,Cy-Ry:Cy+Ry,:);
Rimg2=img2(Cx-Rx:Cx+Rx,Cy-Ry:Cy+Ry,:);
Rrgb=rgb(Cx-Rx:Cx+Rx,Cy-Ry:Cy+Ry,:);
Rrgb2=rgb2(Cx-Rx:Cx+Rx,Cy-Ry:Cy+Ry,:);

figure(3)
[keypoints,features] = sift(Rimg,'Levels',4,'PeakThresh',5);
subplot(1,2,1)
imshow(Rrgb);hold on;
viscircles(keypoints(1:2,:)',keypoints(3,:)');

theta = 45;
[keypoints,~] = sift(Rimg2,'Levels',4,'PeakThresh',5);
subplot(1,2,2)
imshow(Rrgb2);hold on;
viscircles(keypoints(1:2,:)',keypoints(3,:)');

