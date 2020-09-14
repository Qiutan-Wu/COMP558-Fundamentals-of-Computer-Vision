function matchedPoints=findMatchedPoints(img1,img2,threshold)
[keypoints1,features1]=sift(img1,'Levels',4,'PeakThresh',5);
[keypoints2,features2]=sift(img2,'Levels',4,'PeakThresh',5);
keypoints1=keypoints1.';
features1=features1.';
keypoints2=keypoints2.';
features2=features2.';

indexPairs = matchFeatures(features1,features2,'MatchThreshold',threshold);
matchedPoints(:,1:2) = keypoints1(indexPairs(:,1),1:2);
matchedPoints(:,3:4) = keypoints2(indexPairs(:,2),1:2);
size(matchedPoints,1)