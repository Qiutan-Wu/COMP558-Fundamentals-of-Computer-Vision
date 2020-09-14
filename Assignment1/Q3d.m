close all;
%Experiment 3 values for lambda and angle each
lambda=[5 10 10];
angle=[0 45 90];
%Set the kernel size according to lambda
%  n=lambda*2+1;
 n=[11 11 21];
 
%A is the original image, A1 is its gray version
A=imread('Paolina.jpg');
% A=imread('myImage.jpg');
A1=rgb2gray(A);
[N,M]=size(A1);
 
%Show the filtered images
figure(1);
for i=1:length(lambda)
    for j=1:length(angle)
        [~,B{i,j}]=make2DGabor(n(i),lambda(i),angle(j));
        C{i,j}=conv2(A1,B{i,j},'same');%C is the filtered images
        subplot(3,3,(i-1)*3+j)
        imshow(C{i,j},[]);
        title(['lambda=',num2str(lambda(i)),', angle=',num2str(angle(j)),', N=',num2str(n(i))]);
    end
end
 
 
for i=1:length(lambda)
    for j=1:length(angle)
        D{i,j}=zeros(N,M);
    end
end
 
%The threshold of zero-crossing detection, set as [0 0 0] if not use
% threshold=[0 0 0];
threshold=[1 0.5 0.5]; 

% a pixel is detected as lying on an edge if it is a zero crossing in any 
%of the orientations of the filter response
for i=1:length(lambda)
    for j=1:length(angle)
        for x=2:N-1
            for y=2:M-1
                if((C{i,j}(x-1,y)*C{i,j}(x+1,y)<0)&&(abs(C{i,j}(x-1,y)-C{i,j}(x+1,y))>threshold(i)))
                    D{i,j}(x,y)=255;
                    
                elseif((C{i,j}(x,y+1)*C{i,j}(x,y-1)<0)&&(abs(C{i,j}(x,y+1)-C{i,j}(x,y-1))>i*threshold(i)))
                    D{i,j}(x,y)=255;
                    
                elseif((C{i,j}(x+1,y+1)*C{i,j}(x-1,y-1)<0)&&(abs(C{i,j}(x+1,y+1)-C{i,j}(x-1,y-1))>threshold(i)))
                    D{i,j}(x,y)=255;
                    
                elseif((C{i,j}(x-1,y+1)*C{i,j}(x+1,y-1)<0)&&(abs(C{i,j}(x-1,y+1)-C{i,j}(x+1,y-1))>i*threshold(i)))
                    D{i,j}(x,y)=255;
                end
            end
        end
    end
    
end
 
figure(2)
for i=1:length(lambda)
    for j=1:length(angle)
        subplot(3,3,(i-1)*3+j)
        imshow(D{i,j},[]);
        title(['lambda=',num2str(lambda(i)),', angle=',num2str(angle(j)),', N=',num2str(n(i))]);
    end
end
 
for i=1:length(lambda)
    E{i,1}=zeros(N,M);
end
for x=1:N
    for y=1:M
        for i=1:length(lambda)
            for j=1:length(angle)
                if(E{i,1}(x,y)==0)
                    E{i,1}(x,y)=E{i,1}(x,y)+D{i,j}(x,y);
                end
            end
        end
    end
end
 
%plot the edges
figure(3)
for i=1:length(lambda)
    subplot(3,1,i)
    imshow(E{i,1},[]);
    title(['lambda=',num2str(lambda(i)),', N=',num2str(n(i))]);
end
 %plot the edges on the original image
figure(4)
for i=1:length(lambda)
    subplot(3,1,i)
    imshow(imoverlay(A1,E{i,1},[1,1,0]),[]);
    title(['lambda=',num2str(lambda(i)),', N=',num2str(n(i))]);
end
