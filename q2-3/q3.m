filepath = "G:\2020数模\q3_data.xlsx";
book = xlsread(filepath,3,'B1:D21');

dist = @(x,y) sqrt(x.^2+y.^2);
ydata = dist(book(:,1),book(:,2));
xdata = book(:,3);
plot(xdata,ydata,'o')
hold on;

predicted = @(a,xdata) a(1)./tan(asin(sin(a(2))*sin(a(3))+cos(a(2))*cos(a(3))*cos((15*(xdata-a(4))-360)*pi/180)));

a0 = [1;2;0.5;2];

[ahat,resnorm,residual,exitflag,output,lambda,jacobian] = lsqcurvefit(predicted,a0,xdata,ydata);
plot(xdata,predicted(ahat,xdata))
xlabel("时间")
ylabel("影长/米")

