clear
clc
%问题一
H=3;%杆长3m
%计算2015年10月22日北京赤纬-11.5637度
%采用较简单公式计算
sigma=asind(0.39795*cosd(0.98563*(295-173)));
phi=dms2degrees([39,54,26]);%纬度:度分秒转化为度
alpha=dms2degrees([116,23,29]);%经度:度分秒转化为度
t=9:0.25:15;%每间隔15min测量一次
omega=15*t+alpha-300;
L=H*cotd(asind(sind(phi)*sind(sigma)+cosd(phi)*cosd(sigma).*cosd(omega)));
num=length(L); %数据的点数是数列的长度
N0=datenum([0 0 0 9 0 0]); %起始时间9:00
dN=datenum([0 0 0 0 15 0]); 
N=N0+(0:num-1)*dN; %根据数据点数，产生15分钟间隔时间点
plot(N,L,'-s');
datetick(gca,'x','HH:MM');
xlabel("时间")
ylabel("影长/米")