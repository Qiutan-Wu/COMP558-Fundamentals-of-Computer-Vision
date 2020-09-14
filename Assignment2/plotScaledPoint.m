function plotScaledPoint(i,x,y,sigma)
x1=x*sigma;
y1=y*sigma;
figure(i)
hold on
plot(y1,x1,'bo')
hold off