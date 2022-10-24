clear all;
a=-pi/2;
b=pi/2;
n=1000;
h=(b-a)/(n-1);
x=a:h:b;
y=sin(x);
m=10;
XPN(1)=x(1);
YPN(1)=y(1);
for i=1:m,
    %Узлы Чебышева
    for j=1:i,
        t(j)=cos((2*j-1)*pi/(2*i));
end
    XchN=(a+b)/2+(b-a)*t/2;
    YchN=sin(XchN);
    W=vander(XchN);
    A=inv(W)*YchN';
    Pch=polyval(A,x);
    %Равномерные узлы
    W=vander(XPN);
    A=inv(W)*YPN';
    Pp=polyval(A,x);
    hx=(b-a)/i;
for j=1:i,
        XPN(j+1)=XPN(j)+hx;
end
    YPN=sin(XPN)
    plot(x,abs(y-Pp),'b',x,abs(y-Pch),'r');
    saveas(gcf,strcat('./plot', int2str(i), '.png'));
    dch(i)=max(abs(y-Pch));
    dp(i)=max(abs(y-Pp));
end
plot(log10(dch),'r');
saveas(gcf,'./dch.png')
hold on
plot(log10(dp),'b');
saveas(gcf,'./dp.png')
hold off