filepath = "G:\2020��ģ\data.xlsx";
book = xlsread(filepath,1,'B2:D22');
%1 2 �� ���Ӱ�Ӷ������� 3 ���ʱ��
%�������� �������
dist = @(x,y) sqrt(x.^2+y.^2);
ydata = dist(book(:,1),book(:,2));
xdata = book(:,3);
%��γ��
sigma = 10.6305*pi/180;
%�������� ������
predicted = @(a,xdata) a(1)./tan(asin(sin(sigma)*sin(a(2))+cos(sigma)*cos(a(2))*cos((15*(xdata-a(3))-360)*pi/180)));
a0 = [2;1;1];
      
[ahat,resnorm,residual,exitflag,output,lambda,jacobian] = lsqcurvefit(predicted,a0,xdata,ydata);
plot(xdata,predicted(ahat,xdata))
