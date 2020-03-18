clear;
stop =0;
%Ёллипс
x1 =2;
p1 =0;
%b=0.01, w=0.5, f=0.9 - переходные колибани€ с осцилл€цией амплитуды

N=[x1;p1];
x=(-N(1,1):0.01:N(1,1));
b=0.01;
w=0.5;
f=0;
A=2;
A2=0;
Ae=2;
x_buf1=x1;

t=0.0; 
dt =0.1;

subplot (2, 1, 1);
axis ([-5 5 -5 5]);
h=animatedline (N(1,:),N(2,:), 'Color', 'r', 'LineStyle', 'none','marker','.');
grid on
title('p(x)');

subplot(2,1,2);
axis ([0 500 -3 3]); 
xt=animatedline(t, N(1,1),'Color','b');
o=animatedline(t,A,'Color','r');
o_=animatedline(t,A,'Color','r');

grid on
title('x(t)');

pause(0)
while isvalid(h)
t=t+dt;
x_buf2=x_buf1;
x_buf1=N(1,:);
N(1,:)=N(1,:)+N(2,:)*dt; 
N(2,:)=N(2,:)+(-2*b*N(2,:)-sin(N(1,:))+f*cos(N(1,:)*sin(w*t)))*dt;
 if N(1,:)>pi
   N(1,:)=N(1,:)-2* pi ;
 end
 if N(1,:)<-pi
   N(1,:)=N(1,:)+2*pi ;
 end
 if (x_buf2 - x_buf1)*(x_buf1 - N(1,:)) < 0
   A2 = A;
   A = abs(x_buf1);
   if (Ae/A)<2.8 && (Ae/A)>2.6 
       disp(1/t);
   end
 end
 %if abs((A2 - A)/A) < 0.0001
   addpoints(o,t,A);
   addpoints(o_,t,-A);%drawnow;
 %end
addpoints(h,N(1,:),N(2,:));
addpoints(xt,t,N(1,:)); 
drawnow;
end

