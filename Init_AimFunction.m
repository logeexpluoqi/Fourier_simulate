function [point,t,f,ppy,phase,period] =Init_AimFunction(Select_AimFunction,sample_seq,SampleFreq,new_point_string)
% ����CaluFFT������ʵ��ΪFFT�㷨��������ԭ�ź�DFT
% ���ԭ�����ķ�ֵ����λ����


%% ����Ĭ��ֵ���ü���׳��
if nargin ==3  % �жϲ�������
    new_point_string = 0; % ������ģʽ��δ�ӱ༭�������º���
elseif nargin < 3 
    error('Please input three parameters at least!');% ����������������
end

%% ������չ��������������ʾ���ڣ����ڻ�ͼ
period = 2;

% ������������ʾʱ���ź�
t = -period : 1/SampleFreq : period - 1/SampleFreq;

%% ���� - �ı�ԭ����

if new_point_string == 0
    point=zeros(1,length(sample_seq));
    switch Select_AimFunction
        case 1 % ����
            point(1,1:floor(length(sample_seq)*0.5)) = 1;% ռ�ձ�Ϊ0.5
        case 2 % ����
            point(1,1:floor(length(sample_seq)*0.1)) = 1;% ռ�ձ�Ϊ0.1
        case 3 % ����
            point(1,1:floor(length(sample_seq)*0.01)) = 1;% ռ�ձ�Ϊ0.01
        case 4 % ���ǲ�����
            point(1,1:length(sample_seq)/2) = sample_seq(1,1:length(sample_seq)/2);
            point(1,length(sample_seq)/2+1:length(sample_seq)) =  0.5- sample_seq(1,1:length(sample_seq)/2);
        case 5 % ��ݲ�����
            point(1,1:length(sample_seq)) = sample_seq(1,1:length(sample_seq));
    end
else
    x = sample_seq;
    point = eval(new_point_string);
end

% DFT���� 
% ��÷�ֵ��������λ����

[f,ppy,phase] = CaluFFT(point,SampleFreq,0);
% ��չԭ���� - ���ڻ���
point_period = [];
for i = 1:period*2
    point_period = [point_period,point];
end
point = point_period;




end