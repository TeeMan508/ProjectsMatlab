clear; 
global rad lx ly m n;
j=0;
n=100;
dt=0.1; 
tmax=200.0; 
tmot=0; 
lx=100; ly=100; 
rad(1:n)=1;
m(1:n)=1; 
out=set_random(n);
x=out(1,:);
y=out(2,:); 
vx=out(3,:);
vy=out(4,:);

subplot(1,2,1);
sttext=['t=',num2str(0.00),'sec']; 
h=animatedline(x,y,'LineStyle','none','Marker','o', 'MarkerSize',2.5*rad(1),'Color','b'); 

subplot(1,2,1);
ht=title('—оударени€ шаров в плоском биль€рде');
set(ht,'FontSize',18,'FontName','Courier','Fontweight','bold');
clr="g";  
axis([0, lx, 0, ly]);
axis('square');

subplot(1,2,2);
hvx=animatedline(0,0,'Color','Blue');
axis([-200 200 0 40]);
grid on;

while (tmot<tmax)
    j=j+1;
    tmot=tmot+dt; 
    sttext=['t=',num2str(tmot),' sec']; 
    set(ht,'String',sttext);
    subplot(1,2,1);
    h1=animatedline(x(1),y(1));   
    set(h1,'color',clr); 
    
    if clr=="g"
       set(gcf,'ButtonDownFcn','vx=-vx; vy=-vy; clr="r";'); 
    else
       set(gcf,'ButtonDownFcn','vx=-vx; vy=-vy; clr="g";'); 
    end    
    [x, y, vx, vy]=ballsf8(n,x,y,vx,vy,dt);
    clearpoints(h);
    addpoints(h, x,y);
    addpoints(h1,x(1),y(1));
    drawnow; 
    
    subplot(1,2,2);
    [nvx, edges]=hist(vx);
    [x1, y1]= stairs(nvx, edges);
    clearpoints(hvx);
    addpoints(hvx,y1,x1);
    drawnow;
    
end
