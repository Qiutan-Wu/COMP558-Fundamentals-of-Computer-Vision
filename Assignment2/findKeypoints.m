%find keypoints in a N-layer Laplacian pyramid D
%tau is the threshold by which the values at extrema should be distinct from their neighbors in scale space 
function keypoints=findKeypoints2(D,N,tau)
k=0;
% keypoints=zeros(1000,3);
for i=2:N-1
    levelUp=imresize(D{1,i+1},2,'bilinear');
    levelDown=imresize(D{1,i-1},0.5);

    for x=9:size(D{1,i},1)-8
        for y=9:size(D{1,i,1})-8         
            if(isExtrema(x,y,D{1,i},levelUp,levelDown,tau))
                k=k+1;
                keypoints(k,:)=[x,y,2^(i-1)];
            end
        end
    end
end
% keypoints=keypoints(1:k,:);