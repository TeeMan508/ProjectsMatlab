clear;
stop =0;
%έλλθορ
x1 =3;
p1 =0;

N=[x1 0 0;p1 0 0];
x=(-N(1,1):0.01:N(1,1));
b=-0.02;

t=0.0; 
dt =0.1;
Ep=1-cos(x1);
Ek=p1*p1/2;
Epm=0;
ycm=0;

subplot (3, 1, 1);
axis ([-5 5 -5 5]);
h=animatedline (N(1,:),N(2,:), 'Color', 'r', 'LineStyle', 'none','marker','.');
grid on
title('p(x)');

subplot (3, 1, 2);
axis ([-5 5 -5 5]); 
hek=animatedline (N(1,2),Ek,'Color','g', 'LineStyle','none','marker','.');
grid on
title('Ek');

subplot(3,1,3);
axis ([-5 5 -5 5]); 
hep=animatedline (N(1,2),Ep,'Color','b', 'LineStyle','none','marker','.');
grid on
title('Ep');

pause(0)
while isvalid(h)
t=t+dt;
N(1,:)=N(1,:)+N(2,:)*dt; 
N(2,:)=N(2,:)+(b*N(2,:)-sin(N(1,:)))*dt;
Ek=N(2,1)*N(2,1)/2;
Ep=1-cos(N(1,1));
 if N(1,:)>pi
   N(1,:)=N(1,:)-2* pi ;
 end
 if N(1,:)<-pi
   N(1,:)=N(1,:)+2*pi ;
 end
addpoints(h,N(1,:),N(2,:));
addpoints(hek,N(1,1),Ek);
addpoints(hep,N(1,1),Ep);
drawnow;
end

