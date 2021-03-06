%{
formation of zbus matrix
%}
clear; clc;close all;
%       e frm to r x
zprime=[ 1 1 0 0 0.11
    2 2 1 0 0.2
    3 3 1 0 0.1
    4 2 0 0 0.11
    5 2 3 0 0.2];

[elements,columns]=size(zprime);
zbus=[];
currentbusno=0;
for k=1:elements 
    [rows,cols]=size(zbus);
    from=zprime(k,2);
    to=zprime(k,3);
    x=zprime(k,5);
    newbus=max(from,to);
    ref=min(from,to); 
    if newbus>currentbusno && ref==0 
        zbus=[zbus zeros(rows,1) ;zeros(1,cols) x];
        currentbusno=newbus;
        continue
    end
    if newbus>currentbusno &&ref~=0
        zbus=[zbus zbus(:,ref);zbus(ref,:) x+zbus(ref,ref)];
        currentbusno=newbus;
        continue
    end
    if newbus<=currentbusno && ref==0
        zbus=zbus-(1/(zbus(newbus,newbus)+x))*zbus(:,newbus)*zbus(newbus,:);
        continue
    end
    if newbus<=currentbusno && ref~=0
        zbus=zbus-1/(x+zbus(from,from)+zbus(to,to)-2*zbus(from,to))*(zbus(:,from)-zbus(:,to))*(zbus(from,:)-zbus(to,:));
    end
end
zbus


%{
result:
zbus =

    0.0744    0.0356    0.0615
    0.0356    0.0744    0.0485
    0.0615    0.0485    0.1238

%}