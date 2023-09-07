function draw_dynamic_process(point,t,f,ppy,phase,period)
% ���ƶ�̬��Ϲ���
figure 
grid on

for i = 1:2:19
    hold off
    plot(t,point,'color','red')
    
    % ����m��г���ϳ�ͼ��
    Fourier_synthesis = zeros(1,length(point));
    for j = 1:i
        Fourier_synthesis = Fourier_synthesis + ppy(j).*cos(2*pi*f(j)*t + phase(j));
    end
    
    hold on
    plot(t,Fourier_synthesis,'color',[119/255,12/255,176/255])
    title([num2str(i),'��г�����ͼ��']);% ���ñ���
    grid on
    axis([-period,period,min(point)-0.25,max(point)+0.25])
    
    pause(0.5);
    
end
hold off
end