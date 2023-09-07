function draw_mainpicture(m,point,t,f,ppy,phase,period)
%�����źŴ�---�źŷֽ���ϳ�
% m - ��Ӧչ����m��г��

%% ���ó���Ĭ��ֵ
if (nargin<1)
    m=9;% Ĭ��չ��9��г��
end


hold off;% ��ʱhold off ����ÿ�θ���mʱ��������һ���µ�ͼ����������Բ�hold off����ʲôϸ�ڱ仯��


figure_point = plot3(-1*ones(1,length(t)),t,point);% ����ԭ����
set(figure_point,'LineWidth',3*get(figure_point,'LineWidth'));% ����ԭ�����߿�Ϊ 3

hold on

% ���Ƹ���г��
for i = 1:m+1
    plot3(f(i)*ones(1,length(t)),t,ppy(i).*cos(2*pi*f(i)*t + phase(i)));
end



%% ����m��г���ϳ�ͼ��
Fourier_synthesis = zeros(1,length(point));

for i = 1:m+1
    Fourier_synthesis = Fourier_synthesis + ppy(i).*cos(2*pi*f(i)*t + phase(i));
end
h = plot3((m+1)*ones(1,length(t)),t,Fourier_synthesis,'color',[119/255,12/255,176/255]);
set(h,'LineWidth',3*get(h,'LineWidth'));

%% ����Ƶ���ֵͼ

h=stem3(f(1,1:m+1),period*ones(1,m+1),ppy(1,1:m+1),'color',[244/255,159/255,47/255]);
set(h,'LineWidth',3*get(h,'LineWidth'));

%% ��ʽ����

grid on % ��������
hold off % �ر�hold

title('�����źŵĸ���Ҷչ���Ŀ��ӻ�');% ���ñ���
view(-49,23) % ������άͼ��ʼ�ӽ�
set(gca,'XTick',-1:1:m); % ����������̶�
set(gca,'YTick',-period-1:1:period+1);
set(gca,'ZTick',min([point - 1,-1.5,-ppy(2)]):0.5:max([point+1,1.5,ppy(1),ppy(2)]));% ��̬����������̶�

% ������������ʾ��Χ
axis([-1,m+1,-period,period,min([point - 1 , -1.5,-ppy(2)]),max([point+1,1.5,ppy(1),ppy(2)])]);% ��̬������ʾ��Χ

xlabel('Ƶ��Ƕ�');
ylabel('ʱ��Ƕ�');
zlabel('�ź�ǿ��');

% ���ע������
text(m/2,period-0.1,max([point+1,1.5,ppy(1),ppy(2)]),'��Ƶ����','color',[244/255,159/255,47/255],'FontWeight','bold');
text(m+1,1,max([point+1,1.5,ppy(1),ppy(2)]),[num2str(m),'��չ�����ͼ'],'color',[119/255,12/255,176/255],'FontWeight','bold');
text(-1,1,0.5*(max(point)+min(point)),'ԭ����','color',[17/255,122/255,228/255],'FontWeight','bold');

end

