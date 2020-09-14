%find the best matched between two feature lists f and f1
%match return a list of matching keypoint pairs
%d returns the Bhattacharya coefficient matrix of the two feature lists
function [match,d]=findMatchPoints(f,f1,t)
match=[];
k=0;
d=zeros(length(f(:,1)),length(f1(:,1)));
for i=1:length(f(:,1))
    for j=1:length(f1(:,1))
        d(i,j)=Bhattacharya(f(i,4:39),f1(j,4:39));
%         if(d<t)
%             k=k+1;
%             match(k,:)=[f(i,1)*f(i,3) f(i,2)*f(i,3) f1(j,1)*f1(j,3) f1(j,2)*f1(j,3) f(i,3) f1(j,3)];
%         end
    end
end

%only the mutual best matches with Bhattacharya coefficient smaller than the threshold  are picked out
bestmatch=zeros(length(f(:,1)),2);
for i=1:length(f(:,1))
    bestmatch(i,1)=i;
    [bestmatch(i,3),bestmatch(i,2)]=min(d(i,:));
    if(bestmatch(i,3)<t)
        j=bestmatch(i,2);
        if(d(i,j)==min(d(:,j)))
            k=k+1;
            match(k,:)=[f(i,1)*f(i,3) f(i,2)*f(i,3) f1(j,1)*f1(j,3) f1(j,2)*f1(j,3) f(i,3) f1(j,3)];
        end
    end
end
