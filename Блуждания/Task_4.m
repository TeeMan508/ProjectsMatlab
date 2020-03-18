  clear;
  m =500;
  i=1;
  dh=0.01;
  aa=(dh^2)/3;
  x=zeros(1,m);
  y=zeros(1,m);
  S=(1--0)*500/20;
  %1221
  

  subplot(1,2,1);
  h=animatedline(x,y,'linestyle','none', 'marker','.','markersize',4,'markerFaceColor','r'); 
  axis([-2 2 -2 2]);
  
while ishandle(h) 
    i=i+1;
    x=x+dh*(2*rand(1,m)-1);
    y=y+dh*(2*rand(1,m)-1);
    r=sqrt(x.^2+y.^2);
    clearpoints(h); 
    addpoints(h,x,y);
    drawnow; 
    
    subplot(1,2,2);
    rk=0:0.1:2;
    %disp(n);
    h1=histogram(r, rk);
    axis([0 2 0 250]);
    drawnow;
   
    
    subplot(1,2,2);
    h2=animatedline(0,0','linestyle','none', 'marker','.','Color','r');
    f=S*exp(-r.^2/(2*i*aa))/(sqrt(2*3.14159265358*i*aa));
    clearpoints(h2);
    addpoints(h2,r,f);
    drawnow;
    
    
    
    
    
    
end
