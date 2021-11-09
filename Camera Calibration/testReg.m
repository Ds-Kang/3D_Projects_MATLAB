n=20;

e=normrnd(0,1,[n,1]);
x=(1:20)';
y=1+x+e;

X=[x,ones(20,1)];
s=(X'*X)\(X'*y);

%No outlier
figure("Name","base")
scatter(x,y)
hold on 
plot(x,X*s)

betainit=[1;1];
beta=mregress(y,X,betainit);
plot(x,X*beta)

legend('Respones','Least square fit','M-regressing fit')

hold off

%y1=20

y(1)=20;
s=(X'*X)\(X'*y);
figure("Name","y1=20")
scatter(x,y)
hold on 
plot(x,X*s)

betainit=[1;1];
beta=mregress(y,X,betainit);
plot(x,X*beta)

legend('Respones','Least square fit','M-regressing fit')

hold off

%y1=200

y(1)=200;
s=(X'*X)\(X'*y);
figure("Name","y1=200")
scatter(x,y)
hold on 
plot(x,X*s)

betainit=[1;1];
beta=mregress(y,X,betainit);
plot(x,X*beta)

legend('Respones','Least square fit','M-regressing fit')

hold off

%Various respones variables

y=1+x+e;
y(4)=50;
y(5)=60;
s=(X'*X)\(X'*y);
figure("Name","V1")
scatter(x,y)
hold on 
plot(x,X*s)

betainit=[1;1];
beta=mregress(y,X,betainit);
plot(x,X*beta)

legend('Respones','Least square fit','M-regressing fit')

hold off


y=1+x+e;
y(7)=100;
y(8)=80;
y(9)=60;
s=(X'*X)\(X'*y);
figure("Name","V2")
scatter(x,y)
hold on 
plot(x,X*s)

betainit=[1;1];
beta=mregress(y,X,betainit);
plot(x,X*beta)

legend('Respones','Least square fit','M-regressing fit')

hold off

y=1+x+e;
y(3)=60;
y(4)=70;
y(5)=90;
y(7)=100;
y(8)=80;
y(9)=60;
s=(X'*X)\(X'*y);
figure("Name","V3")
scatter(x,y)
hold on 
plot(x,X*s)

betainit=[1;1];
beta=mregress(y,X,betainit);
plot(x,X*beta)

legend('Respones','Least square fit','M-regressing fit')

hold off