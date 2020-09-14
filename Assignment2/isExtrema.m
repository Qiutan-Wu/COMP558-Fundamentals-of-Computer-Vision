%examine whether a point (x,y) is an scale and space extrema 
%D is the layer of the point 
%levelUp is the upsampled upper layer
%levelDown is the downsampled lower layer
%tau is the threshold by which the values at extrema should be distinct from their neighbors in scale space 
function e=isExtrema(x,y,D,levelUp,levelDown,tau)
%there should be 26 neighbors in scale space
neighbors=zeros(1,26);
k=0;

for i=-1:1
    for j=-1:1
        if(i~=0||j~=0)
            k=k+1;
            neighbors(k)=D(x+i,y+j);
        end
        k=k+1;
        neighbors(k)=levelUp(x+i,y+j);
        k=k+1;
        neighbors(k)=levelDown(x+i,y+j);
    end
end

%to be an extrema, the value of a point should be either smaller than its
%minimal neighbor by tau or larger than its maximal neighbor by tau
if(D(x,y)>=max(neighbors)+tau||D(x,y)<=min(neighbors)-tau)
    e=true;   
else
    e=false;
end
