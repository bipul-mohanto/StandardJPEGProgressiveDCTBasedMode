function [R]=inverse(Snew,dnew)

r=512;
c=512;
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
