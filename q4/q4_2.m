S = [2.4030;2.3340;2.3040;2.2320;2.2291;2.1811;2.1031;2.1002;2.0582;2.0044;1.9384;1.8936;1.8636;1.8516];
t = [8.9:0.05:9.55]';
xdata = t;
ydata = S;
plot(xdata,ydata,'o')
hold on;

predicted = @(a,xdata) 2./tan(asin(sin(a(1))*sin(a(2))+cos(a(1))*cos(a(2))*cos((15*(xdata-a(3))-360)*pi/180)));
a0 = [0.38;0.7;12];

[ahat,resnorm,residual,exitflag,output,lambda,jacobian] = lsqcurvefit(predicted,a0,xdata,ydata);
plot(xdata,predicted(ahat,xdata))
xlabel("时间")
ylabel("影长/米")