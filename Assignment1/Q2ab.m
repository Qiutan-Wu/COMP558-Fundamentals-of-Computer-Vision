close all;

N=[19 31];
sigma=[3 5];
 
M=(N-1)/2;

for i=1:2
    gauss{1,i}=make2DGaussian(N(i),sigma(i));
    log{1,i}=make2DLOG(N(i),sigma(i));
    
     [X,Y]=meshgrid(-M(i):M(i), -M(i):M(i));
     
    subplot(2,2,i)
    surf(X,Y,gauss{1,i})
    title(['2D Gaussian with ','sigma=',num2str(sigma(i)),', N=',num2str(N(i))])
    
    subplot(2,2,2+i)
    surf(X,Y,log{1,i})
    title(['2D Laplace of Gaussian with ','sigma=',num2str(sigma(i)),', N=',num2str(N(i))])
end

