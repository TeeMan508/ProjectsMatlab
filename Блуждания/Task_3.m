  clear;
  m =500;
  i=1;
  dh=0.1;
  y=1:m;
  x=zeros(size(y));
  args=(1:1:5001);
  XS=zeros(1,length(args));
  XS2=zeros(1,length(args));

  subplot(2,1,1);
  h=animatedline(x,y,'linestyle','none', 'marker','.','markersize',4,'markerFaceColor','r'); 
  axis([-2 2 0 m+1 ]);
  
  subplot(2,1,2);
  h1=animatedline(0,0,'Color','Blue');
  h2=animatedline(0,0,'Color','Green');
  axis([0 length(args) -50 50])
  grid on;
  
while ishandle(h) 
    i=i+1;
    x=x+dh*(2*rand(1,m)-1); 
    clearpoints(h); 
    addpoints(h,x,y);
    drawnow; 
    
    x1=x;
    xs=sum(x1)/length(x);
    xs2=sum(x1.^2)/length(x);
    XS(i)=xs;
    XS2(i)=xs2;
    addpoints(h1,i,xs);
    addpoints(h2,i,xs2);
    drawnow;
    
    if i == length(args)
        p1=polyfit(args,XS,1);
        p2=polyfit(args,XS2,1);
        apr1=polyval(p1,args);
        apr2=polyval(p2,args);
        h3=line(args,apr1,'Color','r');
        h4=line(args,apr2,'Color','r');
        drawnow;
    end
    
end
