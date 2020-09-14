%calculate the Bhattacharya coefficient between two normalized histograms
function d=Bhattacharya(H1,H2)
s1=0;
s2=0;
s3=0;
for i=1:length(H1)
    s1=s1+sqrt(H1(i)*H2(i));
    s2=s2+H1(i);
    s3=s3+H2(i);
end
d=sqrt(1-s1/sqrt(s2*s3));

% s=sum((H1.*H2).^0.5);
% d=(1-s/(sum(H1)*sum(H2))^0.5)^0.5;
