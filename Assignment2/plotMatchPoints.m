function plotMatchPoints(A,A1,match,fig)

[N,~]=size(A);
[N1,~]=size(A1);

comp1=zeros(max(N,N1),N+N1);
comp1(1:N,1:N)=A;
comp1(1:N1,N+1:N+N1)=A1;

figure(fig)
imshow(comp1,[]);


colors={'b','g','y','m'};
for k=2:length(match(:,1))
    figure(fig);
    hold on
    plot([match(k,2) match(k,4)+N],[match(k,1) match(k,3)],'LineWidth',1.5);
    viscircles([match(k,2) match(k,1)],match(k,5)*2,'Color',colors{log2(match(k,5))},'LineWidth',1);
    viscircles([match(k,4)+N match(k,3)],match(k,6)*2,'Color',colors{log2(match(k,6))},'LineWidth',1);
    hold off
end

