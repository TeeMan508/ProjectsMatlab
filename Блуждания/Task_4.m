  clear;
  m =500;
  i=1;
  dh=0.1;
  aa=sqrt(2)*(dh^2)/3;
  x=zeros(1,m);
  y=zeros(1,m);
  S=(1--0)*500/42;
  %1221
  

  subplot(1,3,1);
  h=animatedline(x,y,'linestyle','none', 'marker','.','markersize',4,'markerFaceColor','r'); 
  axis([-2 2 -2 2]);
  
  subplot(1,3,2);
  h1=animatedline(0,0,'Color','b');
  axis([0.1 5 0 m/2]);
  
  subplot(1,3,2);
  h2=animatedline(0,0,'linestyle','none', 'marker','.','Color','r');
  axis([0.1 5 0 10000]);
  
while isvalid(h) 
    i=i+1;
    x=x+dh*(2*rand(1,m)-1);
    y=y+dh*(2*rand(1,m)-1);
    r=sqrt(x.^2+y.^2);
    clearpoints(h); 
    addpoints(h,x,y);
    drawnow; 
    
    subplot(1,3,2);
    rk=0.01:0.05:2.1;
    [n,rkb]=hist(r,rk);
    for l=1:length(n)
        if l>1
        n(l)=n(l)/(pi*(rkb(l)^2-rkb(l-1)^2));
        end
        if l==1
             n(l)=n(l)/(pi*rkb(l)^2);
        end
    end
    [x1,y1]=stairs(n, rkb);
    clearpoints(h1);
    addpoints(h1,y1,x1);
    drawnow;
 
    f=S*r.*exp(-r.^2/(2*i*aa))/(sqrt(2*3.14159265358*i*aa));
    %disp(f);
    clearpoints(h2);
    addpoints(h2,r,f);
    drawnow;
end
