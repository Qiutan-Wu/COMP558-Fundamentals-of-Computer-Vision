function plotKeypoints(A,keypoints,fig)
N=size(A,1);
figure(fig);
imshow(A,[]);
hold on;
colors={'b','g','y','m'};
for k=1:length(keypoints(:,1))
    sigma=keypoints(k,3);
    x0=keypoints(k,1)*sigma;
    y0=keypoints(k,2)*sigma;
    figure(fig);
    hold on;
    viscircles([y0 x0],sigma*2,'Color',colors{log2(sigma)},'LineWidth',1);
    axis([0 N 0 N]);
    hold off
end
