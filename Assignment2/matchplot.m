A=imread('manor.png');
A=rgb2gray(A);

x0=[500 500];
y0=[500 700];
theta=[20 -60];
s=[0.5 1.5];
A1=RotateScale(A,x0(1),y0(1),theta(1),s(1));

[N,~]=size(A);
[N1,~]=size(A1);

comp1=zeros(N,N+N1);
comp1(1:N,1:N)=A;
comp1(N-N1+1:N,N+1:N+N1)=A1;

figure(1)
imshow(comp1,[]);
hold on
colors={'b','r','g','y'};
for k=1:length(match(:,1))
    plot([match(k,2) match(k,4)+N],[match(k,1) match(k,3)+N-N1],'LineWidth',0.5);
    viscircles([match(k,2) match(k,1)],match(k,5)*2,'Color',colors{log2(match(k,5))},'LineWidth',1);
%     viscircles([match(k,2) match(k,1)],match(k,5)*2,'Color','g','LineWidth',1);
    viscircles([match(k,4)+N match(k,3)+N-N1],match(k,6)*2,'Color',colors{log2(match(k,6))},'LineWidth',1);
end
hold off