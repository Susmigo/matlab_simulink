%{
Formation of bus admittance matrix
%}
clc;clear all;close all;
nbus=5;
%         Lp Lq R    X    ysh  tap
linedata=[ 1 2 0.02 0.06 0.03 1
    1 3 0.08 0.24 0.025 1
    2 3 0.06 0.18 0.02 1
    2 4 0.06 0.18 0.02 1
    2 5 0.04 0.12 0.015 1
    3 4 0.01 0.03 0.01 1
    4 5 0.08 0.24 0.025 1
    ];
nline=length(linedata);
i=sqrt(-1);
for k=1:nline
    lp(k)=linedata(k,1);
    lq(k)=linedata(k,2);
    r(k)=linedata(k,3);
    x(k)=linedata(k,4);
    ysh(k)=linedata(k,5);
    a(k)=linedata(k,6);
    z(k)=(r(k)^2+x(k)^2);
    y(k)=1/z(k);
end
ybus=zeros(nbus,nbus);
for k=1:nline
    ylp(k)=(1/a(k)^2-1/a(k))*y(k);
    ylq(k)=(1-1/a(k))*y(k);
    y(k)=y(k)/a(k);
end

for k=1:nline
    ybus(lp(k),lq(k))=ybus(lp(k),lq(k))-y(k);
    ybus(lq(k),lp(k))=ybus(lp(k),lq(k));
    ybus(lp(k),lp(k))=ybus(lp(k),lp(k))+y(k)+ylp(k)+1i*ysh(k); 
    ybus(lq(k),lq(k))=ybus(lq(k),lq(k))+y(k)+ylq(k)+1i*ysh(k);

end
ybus

%{
result:
ybus =

   6.2500 -18.6950i  -5.0000 +15.0000i  -1.2500 + 3.7500i   0.0000 + 0.0000i   0.0000 + 0.0000i
  -5.0000 +15.0000i  10.8333 -32.4150i  -1.6667 + 5.0000i  -1.6667 + 5.0000i  -2.5000 + 7.5000i
  -1.2500 + 3.7500i  -1.6667 + 5.0000i  12.9167 -38.6950i -10.0000 +30.0000i   0.0000 + 0.0000i
   0.0000 + 0.0000i  -1.6667 + 5.0000i -10.0000 +30.0000i  12.9167 -38.6950i  -1.2500 + 3.7500i
   0.0000 + 0.0000i  -2.5000 + 7.5000i   0.0000 + 0.0000i  -1.2500 + 3.7500i   3.7500 -11.2100i


%}
