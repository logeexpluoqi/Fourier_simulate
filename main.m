clc
clear
clf reset 
%% ԭ��������
% ���ò���Ƶ��
SampleFreq = 1024; 
% ��Ҫ���� ����Ƶ�ʾ�����Ƶ��չ������ߴ�Ϊ 0.5*SampleFreq
% �����Զ���չ�����������ֵĬ��Ϊ512

% ���ɲ�������
sample_seq = 0 : 1/SampleFreq : 1 - 1/SampleFreq; 

% ����ԭ��������������Ƶ���ֵ����λ����
Select_AimFunction = 1;% Ĭ��Ϊ�������� 0.5ռ�ձ�
[point,t,f,ppy,phase,period] = Init_AimFunction(Select_AimFunction,sample_seq,SampleFreq);

%% GUI��� - ��������������
GUI_Design;



