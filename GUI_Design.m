%% ���������� - ��������������
% ���������������⡢�����С�������С��
set ( gcf,'defaultuicontrolfontsize',11)   
set ( gcf, 'unit','normalized','position', [0.65,0.1,0.5,0.75]) 
set ( gcf,'defaultuicontrolunits','normalized') 
set(gcf,'defaultuicontrolfontname','None') 
set(gcf,'defaultuicontrolhorizontal','left') 

str = '����Ҷ�����Ŀ��ӻ� V2.0 From ֪��@�繤��￵';
set(gcf,'menubar','none')
set(gcf,'name',str,'numbertitle','off');

%% �����ĸ�ͼ�ζ���
h_axes_3d=axes('position',[0.1,0.40,0.55,0.55],'visible','on'); % axes���� �����������ĸ�axes����
h_axes_f=axes('position',[0.1,0.07,0.2,0.2],'visible','on');
h_axes_nh=axes('position',[0.7,0.07,0.2,0.2],'visible','on');
h_axes_zz=axes('position',[0.4,0.07,0.2,0.2],'visible','on');

draw_all(3,point,t,f,ppy,phase,period,h_axes_3d,h_axes_f,h_axes_nh,h_axes_zz); % �Զ��庯�� draw_all() ���ڻ��������ĸ�ͼ��

%% ������Ϣ
background = background_words;

%% �˵�����Ķ��� 
% ����'�ļ�'��'����'�˵�
H_file = uimenu(gcf,'Label','�ļ�'); 
H_about = uimenu(gcf,'Label','����');

% ����'�ļ�'�������ݼ���Ӧ��callback����
H_save = uimenu(H_file,'Label','����ͼ��');  % ����ͼ��ѡ������
H_print = uimenu(H_file,'Label','��ӡԤ��','callback','printpreview');  % ����ͼ��ѡ������
H_exit = uimenu(H_file,'Label','�˳�','callback','close(gcf)');  % ����ͼ��ѡ������

% ����'�ļ�'-'����ͼ��'����ѡ��
H_save3d = uimenu(H_save,'Label','3dͼ��','callback','filesave(h_axes_3d)'); %�Զ��庯�� filesave() ����ͼ��
H_savef = uimenu(H_save,'Label','��Ƶ����ͼ��','callback','filesave(h_axes_f)');
H_savezz = uimenu(H_save,'Label','����г��ͼ��','callback','filesave(h_axes_zz)');
H_savenh = uimenu(H_save,'Label','���ͼ��','callback','filesave(h_axes_nh)');

% ����'����'�������ݼ���Ӧ��callback����
H_background = uimenu(H_about,'Label','ѡ�ⱳ��','callback','helpdlg(background,''ѡ�ⱳ��'')');
H_ME = uimenu(H_about,'Label','������Ϣ','callback','helpdlg({''MADE BY ֪��@�繤��￵'';''Version 2.0'';''Email:qizhenkang@sina.com''},''������Ϣ'')');


% H_ex = uimenu(gcf,'Label','���');
% H_exgray=uimenu(H_ex,'Label','��ɫ����','callback','set(gcf,''Color'',[0.8 0.8 0.8])');
% H_exgrid=uimenu(H_ex,'Label','Grid','callback','grid on');

%% �������������������Сλ�õ�
uipanel(gcf,'Title','��ѡ����Ҷչ���ļ�����','FontSize',12,'Position',[0.67,0.4,0.31,0.29]); % panel ����

%% �û��ؼ��Ķ���
% �õ������¿ؼ���
%   popup	-	������
%   edit	-   �༭��
%   text    -   ��̬�ı�
%   pushbutton  -   ��ť
%   radiobutton -   ��ѡ��ť
hpop = uicontrol(gcf,'Style','popup','position',[0.77,0.45,0.13,0.12],'string','3��չ��|5��չ��|9��չ��|22��չ��');
hedit = uicontrol(gcf,'Style','edit','position',[0.77,0.43,0.045,0.030]);
uicontrol(gcf,'Style','text','position',[0.825,0.410,0.1,0.05],'String','��չ��');
hbutton = uicontrol( gcf,'Style','pushbutton','position',[0.7, 0.33, 0.25, 0.05],'string','�鿴��ǰ�����Ķ�̬��Ϲ���');

hradio_one = uicontrol(gcf,'Style','radiobutton','position',[0.7,0.58,0.25,0.05],'string','ѡ��չ��������');
hradio_two = uicontrol(gcf,'Style','radiobutton','position',[0.7,0.47,0.25,0.05],'string','�Զ���չ��������');
set(hradio_one,'value',1); % ����Ĭ��ֵ
set(hradio_two,'value',0);

% ���ø��ؼ���callback����
set(hedit,'string','128','callback','axes(h_axes_3d);[point,t,f,ppy,phase,period]=calledit( hedit,hedit_point, hpop,hpop_point,hradio_one.Value,hradio_point_one.Value,point,t,f,ppy,phase,period,sample_seq,SampleFreq,h_axes_3d,h_axes_f,h_axes_nh,h_axes_zz);')
set(hpop,'callback','axes(h_axes_3d);[point,t,f,ppy,phase,period]=calledit( hedit,hedit_point, hpop,hpop_point,hradio_one.Value,hradio_point_one.Value,point,t,f,ppy,phase,period,sample_seq,SampleFreq,h_axes_3d,h_axes_f,h_axes_nh,h_axes_zz);')
set(hbutton,'callback','draw_dynamic_process(point,t,f,ppy,phase,period)')

set(hradio_one,'callback','[point,t,f,ppy,phase,period]=radio_one_Callback(hradio_one,hradio_two,hradio_point_one,hradio_point_two,hedit,hedit_point, hpop,hpop_point,point,t,f,ppy,phase,period,sample_seq,SampleFreq,h_axes_3d,h_axes_f,h_axes_nh,h_axes_zz);')
set(hradio_two,'callback','[point,t,f,ppy,phase,period]=radio_two_Callback(hradio_one,hradio_two,hradio_point_one,hradio_point_two,hedit,hedit_point, hpop,hpop_point,point,t,f,ppy,phase,period,sample_seq,SampleFreq,h_axes_3d,h_axes_f,h_axes_nh,h_axes_zz);')

grid on


%% V2.0�������� - ѡ��ԭ����

% �������������������Сλ�õ�
uipanel(gcf,'Title','��ѡ����Ҫ����Ҫ��ʱ������','FontSize',12,'Position',[0.67,0.70,0.31,0.29]); % panel ����

% uicontrol(gcf,'Style','text','string','ʱ����ѡ��','position',[0.675,0.84,0.25,0.05]);
hpop_point = uicontrol(gcf,'Style','popup','position',[0.77,0.76,0.16,0.12],'string','������0.5ռ�ձȣ�|������0.1ռ�ձȣ�|������0.01ռ�ձȣ�|���ǲ�|��ݲ�');
set(hpop_point,'callback','axes(h_axes_3d);[point,t,f,ppy,phase,period]=calledit( hedit,hedit_point, hpop,hpop_point,hradio_one.Value,hradio_point_one.Value,point,t,f,ppy,phase,period,sample_seq,SampleFreq,h_axes_3d,h_axes_f,h_axes_nh,h_axes_zz);')

uicontrol(gcf,'Style','text','string','f(x)=','position',[0.73,0.715,0.10,0.05]);
hedit_point = uicontrol(gcf,'Style','edit','position',[0.77,0.73,0.16,0.04]);
set(hedit_point,'string','10*(x-0.5).^3','callback','axes(h_axes_3d);[point,t,f,ppy,phase,period]=calledit( hedit,hedit_point, hpop,hpop_point,hradio_one.Value,hradio_point_one.Value,point,t,f,ppy,phase,period,sample_seq,SampleFreq,h_axes_3d,h_axes_f,h_axes_nh,h_axes_zz);')

% ѡ��ʱ����
hradio_point_one = uicontrol(gcf,'Style','radiobutton','position',[0.7,0.90,0.13,0.05],'string','���ú�����');
hradio_point_two = uicontrol(gcf,'Style','radiobutton','position',[0.7,0.78,0.25,0.05],'string','�Զ���:<��:10*(x-0.5).^3>');
set(hradio_point_one,'value',1); % ����Ĭ��ֵ
set(hradio_point_two,'value',0);

set(hradio_point_one,'callback','[point,t,f,ppy,phase,period]=radio_point_one_Callback(hradio_one,hradio_two,hradio_point_one,hradio_point_two,hedit,hedit_point, hpop,hpop_point,point,t,f,ppy,phase,period,sample_seq,SampleFreq,h_axes_3d,h_axes_f,h_axes_nh,h_axes_zz);')
set(hradio_point_two,'callback','[point,t,f,ppy,phase,period]=radio_point_two_Callback(hradio_one,hradio_two,hradio_point_one,hradio_point_two,hedit,hedit_point, hpop,hpop_point,point,t,f,ppy,phase,period,sample_seq,SampleFreq,h_axes_3d,h_axes_f,h_axes_nh,h_axes_zz);')

