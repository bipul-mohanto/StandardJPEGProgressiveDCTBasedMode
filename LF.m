function [L H R]=LF(Im)

[r c]=size(Im);

S=Im(:,1:2:c);
d=Im(:,2:2:c);
do=zeros(r,size(d,2));
so=[S,zeros(size(S,1),1)];
for i=1:r
    for j=1:size(S,2)
     pred(i,j)=round((S(i,j)+so(i,j+1))/2);
     dnew(i,j)=d(i,j)-pred(i,j);
     update(i,j)=round((do(i,j)+dnew(i,j))/4);
     do(i,j)=dnew(i,j);
     Snew(i,j)=S(i,j)+update(i,j);
    end
    
end
L=Snew;
H=dnew;

% inverse
di=[zeros(size(dnew,1),1),dnew];
si=[Snew,zeros(size(Snew,1),1)];

for i=1:r
    for j=1:size(Snew,2)
     update(i,j)=round((di(i,j)+dnew(i,j))/4);
     Si(i,j)=Snew(i,j)-update(i,j);
     pred(i,j)=round((Si(i,j)+si(i,j+1))/2);
     Di(i,j)=dnew(i,j)+pred(i,j);
    end
end

R=zeros(r,c);
R(:,1:2:c)=Si;
R(:,2:2:c)=Di;
end