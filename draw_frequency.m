function draw_frequency(m,f,ppy)
% Ƶ�׻���
% f - Ƶ�ʴ�С
% ppy - ��Ӧ��ֵ��С
h=stem(f(1,1:m+1),ppy(1,1:m+1),'color',[244/255,159/255,47/255]);
set(h,'LineWidth',3*get(h,'LineWidth'));
axis([0,m+1,min(ppy(1,1:m+1)),1.25 * max(ppy(1,1:m+1))])
title('��ɢ�����ף�����ͼ��');
xlabel('Ƶ��Χf');
grid on
end