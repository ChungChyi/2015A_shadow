filepath = "G:\2020数模\data.xlsx";
book = xlsread(filepath,1,'B2:D22');
%1 2 列 存放影子顶点坐标 3 存放时间
%匿名函数 计算距离
dist = @(x,y) sqrt(x.^2+y.^2);
ydata = dist(book(:,1),book(:,2));
xdata = book(:,3);
%赤纬角
sigma = 10.6305*pi/180;
%匿名函数 推数据
predicted = @(a,xdata) a(1)./tan(asin(sin(sigma)*sin(a(2))+cos(sigma)*cos(a(2))*cos((15*(xdata-a(3))-360)*pi/180)));
a0 = [2;1;1];
      
[ahat,resnorm,residual,exitflag,output,lambda,jacobian] = lsqcurvefit(predicted,a0,xdata,ydata);
plot(xdata,predicted(ahat,xdata))
