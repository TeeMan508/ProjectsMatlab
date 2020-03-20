  clear;
  m =500;
  i=1;
  dh=0.1;
  y=1:m;
  x=zeros(size(y));
  x=x+5;
  g=9.8;
  %aa=sqrt(2)*(dh^2)/3;
  %H=aa/((dh)^2*g/2);
  S=(5--0)*500/51;


  subplot(1,3,1);
  h=animatedline(x,y,'linestyle','none', 'marker','.','markersize',4,'markerFaceColor','r'); 
  axis([0 m+1 0 6 ]);
  
  subplot(1,3,3);
  h3=animatedline(0,0,'linestyle','none', 'marker','.','Color','r');
  axis([0 6 0 500]);
  
  
while ishandle(h) 
    i=i+1;
    x=x+dh*(2*rand(1,m)-1);
    x=x-(dh)^2*g/2;
    for l=1:length(x)
       if x(l)<=0
           x(l)=-x(l);
       end
    end
    clearpoints(h); 
    addpoints(h,y,x);
    drawnow;
    
    subplot(1,3,2);
    edges=0:0.1:5;
    h2=histogram(x, edges);
    axis([0 6 0 500]);
    drawnow;
    
    x1=x;
    xs=sum(x1)/length(x);
    f=10*S*exp(-x/xs);
    clearpoints(h3);
    addpoints(h3,x,f);
    drawnow;
    
 
    
    
end
