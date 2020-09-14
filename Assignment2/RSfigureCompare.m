function RSfigureCompare(A,A1,x0,y0,theta,s,fig)
figure(fig)
subplot(1,2,1)
imshow(A,[])
hold on
plot(y0,x0,'r*')
hold off

figure(fig)
subplot(1,2,2)
imshow(A1,[])
hold on
plot(y0,x0,'r*')
hold off

sgtitle(['x0=',num2str(x0),', y0=',num2str(y0),', theta=',num2str(theta),', scale=',num2str(s)]);