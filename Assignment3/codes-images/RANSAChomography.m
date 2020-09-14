function [H,consensus]=RANSAChomography(mp,tau,d)
A=zeros(8,9);
N=size(mp,1);

c=0;
while (c<(tau*N))
    c=0;
    p=randi([1,N],1,4);
    
    for i=1:4
        A(2*i-1,:)=[mp(p(i),1:2) 1 zeros(1,3) -mp(p(i),3)*mp(p(i),1:2) -mp(p(i),3)];
        A(2*i,:)=[zeros(1,3) mp(p(i),1:2) 1 -mp(p(i),4)*mp(p(i),1:2) -mp(p(i),4)];
    end
    ns=null(A);
    if(size(ns,2)>1)
          continue;
    end
    H=reshape(ns,[3,3]).';
    for i=1:N 
        p1=(mp(i,1:2)).';
        p2=(mp(i,3:4)).';
        p3=H*[p1;1];
        w=p3(3,1);
        p3=p3(1:2,1)/w;
        dist=norm(p2-p3);
        if(dist<d)
            c=c+1;
        end       
    end
    c
end

B=zeros(2*c,9);
consensus=zeros(c,4);
k=0;

for i=1:N     
        p1=(mp(i,1:2)).';
        p2=(mp(i,3:4)).';
        p3=H*[p1;1];
        p3=p3(1:2,1)/p3(3,1);
        dist=norm(p2-p3);
        if(dist<d)
            k=k+1;
            B(2*k-1,:)=[mp(i,1:2) 1 zeros(1,3) -mp(i,3)*mp(i,1:2) -mp(i,3)];
            B(2*k,:)=[zeros(1,3) mp(i,1:2) 1 -mp(i,4)*mp(i,1:2) -mp(i,4)];
            consensus(k,:)=mp(i,:);
        end             
end

[V,D]=eig((A.')*A);
D=min(D);
[~,m]=min(D);
H=reshape(V(:,m),[3,3]).';