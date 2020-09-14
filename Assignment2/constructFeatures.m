%construct features from keypoints for an image A
%To illustrate a certain feature, give its index in the keypoints list as
%K. Two figures will be produced. One is the keypoint neighborhood
%representation. The other is the histogram
function features=constructFeatures2(C,keypoints,K,fig)

histogram=zeros(length(keypoints(:,1)),36);

for i=2:5
    [dx,dy]=gradient(C{1,i});
    gradMag{1,i}=sqrt(dx.^2+dy.^2);
    gradOrit{1,i}=atan2(dy,dx);
    gradOrit{1,i}=rad2deg(gradOrit{1,i});
    [l1,l2]=size(gradOrit{1,i});
    
    for x=1:l1
        for y=1:l2
            if(gradOrit{1,i}(x,y)<0)
                gradOrit{1,i}(x,y)=gradOrit{1,i}(x,y)+360;
            end
        end
    end
end

for i=1:length(keypoints(:,1))
    x0=keypoints(i,1);
    y0=keypoints(i,2);
    layer=log2(keypoints(i,3))+1;
        Ngd=C{1,layer}(x0-8:x0+8,y0-8:y0+8);
        NgdGradMag=gradMag{1,layer}(x0-8:x0+8,y0-8:y0+8);
        NgdGradOrit=gradOrit{1,layer}(x0-8:x0+8,y0-8:y0+8);
        
        Gm=fspecial('gaussian',17,1.5*keypoints(i,3));
                
        %visualization of a selected keypoint
        if(K>0)
            if(i==K)
                figure(fig)
                subplot(2,2,1)
                imshow(Ngd,[])
                title('gaussian image');
                subplot(2,2,2)
                imshow(Ngd,[])
                hold on
                [x,y] = meshgrid(1:17,1:17);
                u=sind(NgdGradOrit).*NgdGradMag/max(NgdGradMag(:))*2.5;
                v=cosd(NgdGradOrit).*NgdGradMag/max(NgdGradMag(:))*2.5;
                quiver(x,y,u,v,0,'LineWidth',1);
                hold off
                title('gradiant orientation');
                subplot(2,2,3)
                imshow(NgdGradMag,[])
                title('gradiant magnitude');
                subplot(2,2,4)
                imshow(NgdGradMag.*Gm,[])
                title('weighted gradiant magnitude');
                sgtitle(['x=',num2str(keypoints(i,1)),', y=',num2str(keypoints(i,2)),', sigma=',num2str(keypoints(i,3))]);
            end
        end
        
        NgdGradMag=NgdGradMag.*Gm;
        
        for x=1:17
            for y=1:17
                for bin=1:36
                    if(NgdGradOrit(x,y)>=10*(bin-1)&&NgdGradOrit(x,y)<10*bin)
                        histogram(i,bin)=histogram(i,bin)+NgdGradMag(x,y);
                        break;
                    end
                end
            end
        end
        
        if(K>0)
            if(i==K)
                figure(fig+1)
                subplot(1,2,1)
                bar(1:36,histogram(i,:));
                title('histogram before shifting');
            end
        end
        
        [peak,index]=max(histogram(i,:));
        %     histogram(i,:)=[histogram(i,locs(index1):36) histogram(i,1:locs(index1)-1)];
        histogram(i,:)=circshift(histogram(i,:),36-index+1);
        if(K>0)
            if(i==K)
                figure(fig+1)
                subplot(1,2,2)
                bar(1:36,histogram(i,:));
                title('histogram after shifting');
                sgtitle(['x=',num2str(keypoints(i,1)),', y=',num2str(keypoints(i,2)),', sigma=',num2str(keypoints(i,3))]);
            end
        end
        
        s=sum(histogram(i,:));
        histogram(i,:)=histogram(i,:)/s;
    
end

features=[keypoints histogram];


