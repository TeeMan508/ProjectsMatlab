clear; %tm пор€дка 50 секунд
global rad lx ly m n;
j=0;
n=10;
dt=0.3; 
tmax=200.0; 
tmot=0; 
lx=100; ly=100; 
rad(1:n)=5;
m(1:n)=1; 
out=set_random(n);
x=out(1,:);
y=out(2,:); 
vx=out(3,:);
vy=out(4,:);

sttext=['t=',num2str(0.00),'sec']; 
h=animatedline(x,y,'LineStyle','none','Marker','o', 'MarkerSize',5*rad(1),'Color','b'); 

 
ht=title('—оударени€ шаров в плоском биль€рде');
set(ht,'FontSize',18,'FontName','Courier','Fontweight','bold');

clr="g";  
axis([0, lx, 0, ly]);
axis('square');


while (tmot<tmax)
    j=j+1;
    tmot=tmot+dt; 
    sttext=['t=',num2str(tmot),' sec']; 
    set(ht,'String',sttext);
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
end
