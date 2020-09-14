function paranoma=makePanorama(img2,img1,center,t,c,d)

    rgb2=img2;
    rgb1=img1;
    img2=single(rgb2gray(img2));
    img1=single(rgb2gray(img1));
    
if(center=='l')
    
    m=findMatchedPoints(img1,img2,t);
    size(m,1)

    H=RANSAChomography(m,c,d);
    
    [Nx1,Ny1]=size(img1);
    [Nx2,Ny2]=size(img2);
    paranoma=zeros(Nx2,Ny1+Ny2,3);
    paranoma(:,1:Ny2,:)=rgb2;
    ymax=0;
    for i=1:Nx2
        for j=Ny2+1:Ny1+Ny2
            temp=H\[j;i;1];
            y=int32(temp(1,1)/temp(3,1));
            x=int32(temp(2,1)/temp(3,1));
            if(x>0 && x<=Nx1 && y>0 && y<=Ny1)
                if(j>ymax)
                    ymax=j;
                end

                    paranoma(i,j,:)=rgb1(x,y,:);
               
            end
        end
    end
    paranoma=paranoma(:,1:ymax,:);
    
else
    
    m=findMatchedPoints(img2,img1,t);
    H=RANSAChomography(m,c,d);
    
    [Nx1,Ny1]=size(img1);
    [Nx2,Ny2]=size(img2);
    paranoma=zeros(Nx1,Ny1+Ny2,3);
    paranoma(:,Ny2+1:Ny1+Ny2,:)=rgb1;
    ymin=Ny2;
    for i=1:Nx2
        for j=-Ny2:-1
            temp=H\[j;i;1];
            y=int32(temp(1,1)/temp(3,1));
            x=int32(temp(2,1)/temp(3,1));
            if(x>0 && x<=Nx2 && y>0 && y<=Ny2)
                if(j<ymin)
                    ymin=j;
                end
                
                    paranoma(i,j+Ny2+1,:)=rgb2(x,y,:);
                
            end
        end
    end
    ymin=ymin+Ny2+1;
    paranoma=paranoma(:,ymin:Ny1+Ny2,:);
end
paranoma=uint8(paranoma);