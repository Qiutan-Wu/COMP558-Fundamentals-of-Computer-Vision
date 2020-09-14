%plot a N-layer pyramid C as a composite figure
%fig is an input selecting the figure window
function plotPyramid(C,N,fig)
p=0;
s=0.5;

figure(fig);

for i=1:N
    pos = [p 0.9-s s s];
    p=p+s;
    s=s/2;
    subplot('Position',pos);
    imshow(C{1,i},[]);
end