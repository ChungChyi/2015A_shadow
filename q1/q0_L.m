clear
clc
%����һ
H=3;%�˳�3m
%����2015��10��22�ձ�����γ-11.5637��
%���ýϼ򵥹�ʽ����
sigma=asind(0.39795*cosd(0.98563*(295-173)));
phi=dms2degrees([39,54,26]);%γ��:�ȷ���ת��Ϊ��
alpha=dms2degrees([116,23,29]);%����:�ȷ���ת��Ϊ��
H = 0:0.25:15; %���0.25m����
omega=0;
L=H*cotd(asind(sind(phi)*sind(sigma)+cosd(phi)*cosd(sigma).*cosd(omega)));
plot(H,L,'--');
xlabel("�˳�")
ylabel("Ӱ��/��")