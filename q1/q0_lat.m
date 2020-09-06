clear
clc
%问题一
%计算2015年10月22日北京赤纬-11.5637度
%采用较简单公式计算
omega=-60:2:60;
sigma=asind(0.39795*cosd(0.98563*(295-173)));
phi=dms2degrees([39,54,26]);%纬度:度分秒转化为度
alpha=dms2degrees([116,23,29]);%经度:度分秒转化为度
H = 3; %间隔0.25m测量
L=H*cotd(asind(sind(phi)*sind(sigma)+cosd(phi)*cosd(sigma).*cosd(omega)));
plot(omega,L,'--');
xlabel("太阳时角 单位（°）")
ylabel("影长/米")