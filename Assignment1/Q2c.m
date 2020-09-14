close all;

lambda=[2 5 10];
angle=[0 45 90];
%Set kernel size according to lambda
N=lambda*6+1;

M=(N-1)/2;


for i=1:length(lambda)
    for j=1:length(angle)
        [even{i,j},odd{i,j}]=make2DGabor(N(i),lambda(i),angle(j));
        
        figure((i-1)*length(angle)+j);
        set(gcf,'unit','normalized','position',[0.2,0.2,0.64,0.45]);
        [X,Y]=meshgrid(-M(i):M(i),-M(i):M(i));
        
        subplot(1,2,1)
        surf(X,Y,even{i,j});
        title('Even')
        
        subplot(1,2,2)
        surf(X,Y,odd{i,j});
        title('Odd')
        
        sgtitle(['2D Gabor with ','lambda=',num2str(lambda(i)),', angle=',num2str(angle(j))]);
        
        
    end
end





