function [f,ppy,phase]=CaluFFT(point,SampleFreq,log,calcu_length)
%Calculate DFT
%   [f,ppy]=CaluFFT(point,SampleFreq,log)
% INPUT PARAMETERS
%   'point' - The array of input signals
%   'SampleFreq' - Sample Frequency
%   'log' -  The format of amplitude
%         -  0 primary (default)
%         -  1 db
% OUTPUT PARAMETERS
%   'f' - Real Frequency Domain
%   'ppy' - Amplitude of corresponding frequency 
%   'length' - The calculation length of DFT

%% ����Ĭ��ֵ���ü���׳��
if nargin ==2  % �жϲ�������
    log = 0; % Ĭ��ֵΪ0 ��������Ϊ������ֵ
elseif nargin == 3
    calcu_length = length(point);
elseif nargin <2 
    error('Please input two parameters at least!');%����������������
end

%% FFT�����ź�Ƶ��
N = length(point);% ȷ���źų���
Yf = fft(point,calcu_length);% ��Ƶ��
%% �ź�Ƶ�׻�ͼ
fm = floor(N/2); % ȷ����Ƶ��ͼ������Ƶ�� 
f = (0:fm) * SampleFreq/N; % ȷ����Ƶ��ͼ��Ƶ�ʿ̶� 
ppy = abs(Yf) / (N/2);% ������ʵ��ֵ
ppy(:,1) = ppy(:,1)/2;
ppy(:,floor(N/2)) = ppy(:,floor(N/2))/2;
phase = angle(Yf);
if log == 1 % �ֱ��̶�
    ppy = 20*log10(ppy);
end
% figure;
% plot(f,ppy(1:length(f))); % ����ԭ����Ƶ��ͼ 
ppy = ppy(:,1:fm+1);
phase = phase(:,1:fm+1);
% title('Frequency Domain of point');
% xlabel('frequency (Hz)');
% if log == 1 % �ֱ��̶�
%     ylabel('Amplitude (dB)');
% else
%     ylabel('Amplitude ');
% end