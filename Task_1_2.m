  m =500;
  i=0;
  %jepa
  dh=0.01;
  y=1:m; 
  y=y';  
  x=zeros(size(y));
  aa=(dh^2)/3;
  S=(1--1)*500/20;

  subplot(1,2,1);
  h=animatedline(x,y,'linestyle','none', 'marker','.','markersize',4,'markerFaceColor','r'); 
  axis([-2 2 0 m+1 ]);
  
  
  
  
while ishandle(h) 
    i=i+1;
    x=x+dh*(2*rand(m,1)-1); 
    
    clearpoints(h); 
    addpoints(h,x,y);
    drawnow;
    
    subplot(1,2,2);
    edges=-1:0.1:1;
    h1=histogram(x, edges);
    axis([-1 1 0 250]);
    drawnow;
    
    subplot(1,2,2);
    h2=animatedline(0,0,'Color','r','LineStyle','None','marker','.');
    f=S*exp(-x.^2/(2*i*aa))/(sqrt(2*3.14159265358*i*aa));
    clearpoints(h2);
    addpoints(h2,x,f);
    drawnow;
        
    
end
