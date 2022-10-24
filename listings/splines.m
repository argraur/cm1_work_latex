clear all;
a=-pi/2;
b=pi/2;
n=100;
h=(b-a)/(n-1);
x=a:h:b;
y=sin(x);
m=10;
n=20;
%Узлы Чебышева
for j=1:m+2,
 t(j)=cos((2*j-1)*pi/2/(m+1));
end
XchN=(a+b)/2+(b-a)*t/2;
YchN=sin(XchN);
Ach=polyfit(XchN,YchN,m);
Pch=polyval(Ach,x);
%Равномерные узлы
hx=(b-a)/m;
Xp=a:hx:b;
Yp=sin(Xp);
Ap=polyfit(Xp,Yp,m);
Pp=polyval(Ap,x);
plot(x, abs(y-Pch),'r', x,abs(y-Pp),'b');
hold on;
%Сплайн
hsp=(b-a)/n;
Xsp=a:hsp:b;
Ysp=sin(Xsp);
Spl=spline(Xsp,Ysp,x);
plot(x,abs(y-Spl),'g');
saveas(gcf, strcat('spline_', int2str(m), '_', int2str(n), '.png'))
hold off