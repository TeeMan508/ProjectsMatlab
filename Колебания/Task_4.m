clear;
k=26;

x=(-0.5-(k-1)*0.1:0.1:-0.5);
N=[x;zeros(1,k)];
s=zeros(1,k);
T=zeros(1,k);
W=zeros(1,k);
t=0.0; 
dt =0.02;

subplot (2, 1, 1);
axis ([-5 5 -5 5]);
h=animatedline (N(1,:),N(2,:), 'Color', 'r', 'LineStyle', 'none','marker','.');
grid on
title('p(x)');
pause(0)

subplot(2,1,2);
axis([0.4 3.1 0 0.16]);
w=animatedline('Color', 'r', 'LineStyle', 'none','marker','.');
grid on;
title('w(A)')
pause(0);


while isvalid(h)
t=t+dt;
M=N(2,:);
N(1,:)=N(1,:)+N(2,:)*dt; 
N(2,:)=N(2,:)-sin(N(1,:))*dt;
if N(1,:)>pi
   N(1,:)=N(1,:)-2* pi;
end
if N(1,:)<-pi
N(1,:)=N(1,:)+2*pi ;
end
B=T;
for i=1:k
    if N(2,i)<0
      s(i)=1;
    end
    if s(i)==0
      T(i)=T(i)+dt;
    end
    if T==B
        for l=1:k
            W(l)=1/(2*T(l));
            addpoints(w,-x(l),W(l));
        end
        break
    end
end      
%disp(W);
addpoints(h,N(1,:),N(2,:));
drawnow;
end

