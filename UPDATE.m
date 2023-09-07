%% CaluFFT���Ժ���
% ���ò�����
SampleFreq = 1024;

% ���ɲ�������
t = 0 : 1/SampleFreq : 1 - 1/SampleFreq; 
x=zeros(1,length(t));
% ����Ŀ���źź��� ������
x(1,1:length(t)/2) = 1;

% ��δ����������
point = x ;%+ 1*randn(size(t));

% DFT����
[f,ppy] = CaluFFT(point,SampleFreq,0);
title('Frequency Domain of point');

figure
t = linspace(-1,1,length(ppy));
hold on
for i = 1:512
    plot3(f(i)*ones(1,length(t)),t,ppy(i).*cos(2*pi*f(i)*t));
end
grid on;
hold off
xlabel('Ƶ��Ƕ�');
ylabel('ʱ��Ƕ�');
zlabel('�ź�ǿ��');
