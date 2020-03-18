clear;
stop =0;

%Сепаратриссаa
x2 =-4.9;
p2 =2;

%Точка
x3 =0;
p3 =0.01;

%Эллипс
x1 =1;
p1 =0;

N=[x1 x2 x3;p1 p2 p3];
x=(-N(1,1):0.01:N(1,1));

t=0.0; 
dt =0.1;
Ep=1-cos(x1);
Ek=p1*p1/2;
Epm=0;
ycm=0;

subplot (4, 1, 1);
axis ([-5 5 -5 5]);
h=animatedline (N(1,:),N(2,:), 'Color', 'r', 'LineStyle', 'none','marker','.');
grid on
title('p(x)');

subplot (4, 1, 2);
axis ([-5 5 -5 5]); 
hek=animatedline (N(1,2),Ek, 'LineStyle','none','marker','.');
grid on
title('Ek for second one');

subplot(4,1,3);
axis ([-5 5 -5 5]); 
hep=animatedline (N(1,2),Ep, 'LineStyle','none','marker','.');
grid on
title('Ep for second one');

subplot(4,1,4);
axis ([-5 5 -5 5]);
grid on
title('Outstanding animation')

yc=sqrt(abs(5-N(1,1)^2));
m=animatedline (N(1,1), yc,'LineStyle','none','marker','o');
l=animatedline(x,(x-0)*(yc-5)/(N(1,1)-0)+5);


pause(0)
while isvalid(m)
t=t+dt;
N(1,:)=N(1,:)+N(2,:)*dt; 
N(2,:)=N(2,:)-sin(N(1,:))*dt;
Ek=N(2,1)*N(2,1)/2;
Ep=1-cos(N(1,1));
 if Ep>Epm
   Epm=Ep;
 end
 if 5-N(1,1)^2<0
    yc=sqrt(5-N(1,1)^2);
 end
  if 5-N(1,1)^2>=0
    yc=-sqrt(5-N(1,1)^2);
  end
 if N(1,:)>pi
   N(1,:)=N(1,:)-2* pi ;
 end
if N(1,:)<-pi
N(1,:)=N(1,:)+2*pi ;
end
if N(1,1)>=0
  x=(-N(1,1):0.01:N(1,1));
end
if N(1,1)<0
  x=(-N(1,1):-0.01:N(1,1)); 
end
if yc<ycm 
    ycm=yc;
    disp(ycm);
end
addpoints(h,N(1,:),N(2,:));
addpoints(hek,N(1,1),Ek);
addpoints(hep,N(1,1),Ep);
%clearpoints(m);
%addpoints(m,N(1,1),yc);
%clearpoints(l);
%addpoints(l,x, (x-0)*(yc-5)/(N(1,1)-0)+5);
drawnow;
end

