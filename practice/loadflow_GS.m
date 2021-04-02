%{
Load flow solution using gauss sidel method
%}
clear;clc;close all;
basemva=100;
busdata=[
    1 0 1.04 0 0 0 0 0 0 0 0
    2 1 1.04 0 100 0 50 0 25 100 0
    3 2 1 0 0 0 100 -50 0 0 0
    4 2 1 0 0 0 -30 10 0 0 0];
linedata=[ 
    1 2 0.05 0.15 0 1
    1 3 0.10 0.30 0 1
    2 3 0.15 0.45 0 1
    2 4 0.10 0.30 0 1
    3 4 0.05 0.15 0 1];
nline=length(linedata(:,1));
j=sqrt(-1); 
i=sqrt(-1);
for k=1:nline
    lp(k)=linedata(k,1);
    lq(k)=linedata(k,2);
    r(k)=linedata(k,3);
    x(k)=linedata(k,4); 
    ysh(k)=linedata(k,5);
    a(k)=linedata(k,6);
    nbus=length(busdata(:,2));
    z(k)=r(k)+j+x(k); 
    y(k)=1/z(k);
end
ybus=zeros(nbus,nbus);
yln=zeros(nbus,nbus); 
for k=1:nline
    ylp(k)=(1/a(k)^2-1/a(k))*y(k);
    ylq(k)=(1-1/a(k))*y(k); 
    y(k)=y(k)/a(k);
end
for k=1:nline
    ybus(lp(k),lq(k))=ybus(lp(k),lq(k))-y(k);
    ybus(lq(k),lp(k))=ybus(lp(k),lq(k));
    ybus(lp(k),lp(k))=ybus(lp(k),lp(k))+y(k)+ylp(k)+j*ysh(k); 
    ybus(lq(k),lq(k))=ybus(lq(k),lq(k))+y(k)+ylq(k)+j*ysh(k);
end
nbus=length(busdata(:,1));
for n=1:nbus
    bus(n)=busdata(n,1); 
    kb(n)=busdata(n,2);
    vm(n)=busdata(n,3); 
    delta(n)=busdata(n,4);
    pg(n)=busdata(n,5); 
    qg(n)=busdata(n,6);
    pd(n)=busdata(n,7);
    qd(n)=busdata(n,8);
    qmin(n)=busdata(n,9);
    qmax(n)=busdata(n,10);
    qsh(n)=busdata(n,11);
    delta(n)=[pi/180]*delta(n); 
    e(n)=vm(n)*cos(delta(n))+j*vm(n)*sin(delta(n));
    p(n)=(pg(n)-pd(n))/basemva; 
    q(n)=(qg(n)-qd(n))/basemva;
    s(n)=p(n)+j*q(n);
    dv(n)=0;
end
maxerror=0.1;
iter=0; 
for n=1:nbus
    vc(n)=0+0*j;
    vnew(n)=0+0*j;
end
while(maxerror>0.00001&&iter<15)
    for m=1:nbus
        for n=1:nbus 
            yv(n)=0+0*j;
        end
        if kb(m)==0
         vc(m)=vm(m); 
         e(m)=vc(m);
        end
        if kb(m)==2 
            for k=1:nbus
                if k~=m
                    yv(m)=yv(m)+ybus(m,k)*e(k);
                end
            end
            vc(m)=(conj(s(m))/conj(e(m))-yv(m))/ybus(m,m); 
            error(m)=abs(vc(m)-e(m));
            e(m)=e(m)+1.4*(vc(m)-e(m));
        end
        if kb(m)==1
            for k=1:nbus 
                if k~=m
                    yv(m)=yv(m)+ybus(m,k)*e(k);
                end
            end
            cos(m)=real(e(m))/abs(e(m));
            sin(m)=imag(e(m))/abs(e(m)); 
            e(m)=vm(m)*cos(m)+j*vm(m);
            qnew(m)=-conj(e(m))*(yv(m)+ybus(m,m)*(e(m)*100));
            if qnew(m)<qmin(m) 
                q(m)=qmin(m)/basemva;
                s(m)=p(m)+j*q(m);
                e(m)=1+0*j;
                vc(m)=(conj(s(m))/conj(e(m))-yv(m))/ybus(m,m); 
                e(m)=e(m)+1.4*(vc(m)-e(m));
            else
                q(m)=qmax(m)/basemva;
                cos(m)=real(e(m))/abs(e(m));
                sin(m)=imag(e(m))/abs(e(m)); 
                e(m)=vm(m)*cos(m)+j*vm(m)*sin(m); 
                s(m)=p(m)+j*q(m);
                vc(m)=(conj(s(m))/conj(e(m))-yv(m))/ybus(m,m); 
                cos(m)=real(vc(m))/abs(vc(m));
                sin(m)=imag(vc(m))/abs(vc(m)); 
                vnew(m)=vm(m)*cos(m)+j*vm(m)*sin(m);
                e(m)=vnew(m);
            end
        end
    end
    maxerror=max(error);
    iter=iter+1;
    iter;
    e;
end
ysh=zeros(nbus,nbus); 
yln=zeros(nbus,nbus);
for k=1:nline
    yln(lp(k),lq(k))=yln(lp(k),lq(k))+y(k);
    yln(lq(k),lp(k))=yln(lp(k),lq(k));
    ysh(lp(k),lp(k))=ysh(lp(k),lp(k))+j*ysh(k); 
    ysh(lq(k),lp(k))=ysh(lp(k),lq(k));   
end
for i=1:nbus
    for k=1:nbus
        sln(i,k)=0+0*j;
    end
end
for m=1:nbus
    for n=1:nbus
        sln(m,n)=((e(m)*(conj(e(m))-conj(e(n)))*conj(ybus(m,n)))+(e(m)*conj(e(m))*conj(ysh(m,n))))*basemva;
    end
end
sln



%{
result:
sln =

   0.0000 + 0.0000i  28.9805 +50.0054i  -8.2556 +32.0703i   0.0000 + 0.0000i
 -35.1572 -80.8894i   0.0000 + 0.0000i -62.3493 -10.6010i -16.1793 -20.7268i
   4.2000 -42.2095i  52.8215 - 5.2787i   0.0000 + 0.0000i  43.0660 - 2.4598i
   0.0000 + 0.0000i  15.0814 +17.9820i -45.1631 - 8.0257i   0.0000 + 0.0000i


%}