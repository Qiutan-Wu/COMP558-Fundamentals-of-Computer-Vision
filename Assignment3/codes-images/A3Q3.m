% %Q2
% rgb=cell(1,6);
% img=cell(1,6);
% for i=2:3
%     rgb{i} = imread([num2str(i-1) '.png']);
%     img{i}=single(rgb2gray(rgb{i}));
%     [keypoints{i},features{i}]=sift(img{i},'Levels',4,'PeakThresh',5);
%     keypoints{i}=keypoints{i}.';
%     features{i}=features{i}.';
% end
% 
% indexPairs=cell(1,5);
% matchedPoints=cell(1,5);
% for i=2:2
%     indexPairs{i} = matchFeatures(features{i},features{i+1},'MatchThreshold',0.5);
%     matchedPoints{i}(:,1:2) = keypoints{i}(indexPairs{i}(:,1),1:2);
%     matchedPoints{i}(:,3:4) = keypoints{i+1}(indexPairs{i}(:,2),1:2);
% end
% 
% 
% % space='                                                                  ';
% % for i=1:5
% %     figure(i); 
% %     showMatchedFeatures(rgb{i+1},rgb{i},matchedPoints{i}(:,3:4),matchedPoints{i}(:,1:2),'montage');
% %     title([num2str(i) '.png' space space num2str(i-1) '.png'],'FontSize',14);
% %     saveas(gcf,['horizontal' num2str(i) '-' num2str(i-1) '.png'])
% % end
% 
% % Q3
% H=cell(1,5);
% consensus=cell(1,5);
% for i=2:2
%     [H{i},consensus{i}]=RANSAChomography(matchedPoints{i},0.8*size(matchedPoints{i},1),1);
% end

rgb=cell(1,6);
img=cell(1,6);
for i=1:6
    rgb{i} = imread([num2str(i-1) '.png']);
    img{i}=single(rgb2gray(rgb{i}));
    [keypoints{i},features{i}]=sift(img{i},'Levels',4,'PeakThresh',5);
    keypoints{i}=keypoints{i}.';
    features{i}=features{i}.';
end

indexPairs=cell(1,5);
matchedPoints=cell(1,5);
for i=1:5
    indexPairs{i} = matchFeatures(features{i},features{i+1},'MatchThreshold',1);
    matchedPoints{i}(:,1:2) = keypoints{i}(indexPairs{i}(:,1),1:2);
    matchedPoints{i}(:,3:4) = keypoints{i+1}(indexPairs{i}(:,2),1:2);
end

consensus=cell(1,5);
space='                                                                  ';
for i=1:4
    figure(i); 
    size(matchedPoints{i},1)
    [~,consensus{i}]=RANSAChomography2(matchedPoints{i},0.85,3);
    size(consensus{i},1)
    showMatchedFeatures(rgb{i+1},rgb{i},consensus{i}(:,3:4),consensus{i}(:,1:2),'montage');
    title([num2str(i) '.png' space space num2str(i-1) '.png'],'FontSize',14);
    saveas(gcf,['A3Q3-matching' num2str(i) '-' num2str(i-1) '.png'])
end
i=5;
figure(i);
size(matchedPoints{i},1)
[~,consensus{i}]=RANSAChomography2(matchedPoints{i},0.8,3);
size(consensus{i},1)
showMatchedFeatures(rgb{i+1},rgb{i},consensus{i}(:,3:4),consensus{i}(:,1:2),'montage');
title([num2str(i) '.png' space space num2str(i-1) '.png'],'FontSize',14);
saveas(gcf,['A3Q3-matching' num2str(i) '-' num2str(i-1) '.png'])