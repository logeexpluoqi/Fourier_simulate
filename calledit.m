function [point,t,f,ppy,phase,period] = calledit(hedit,hedit_point, hpop,hpop_point,hradio_one_value,hradio_point_one_Value,point,t,f,ppy,phase,period,sample_seq,SampleFreq,h_axes_3d,h_axes_f,h_axes_nh,h_axes_zz)
% panel��radiobutton�ȿؼ��Ļص�����
% �����޸�ԭ����

% ��ñ༭��͵������ֵ
ct = get(hedit,'string');
vpop = get (hpop,'value');

% ���� - �ı�ԭ����
vpop_point = get (hpop_point,'value'); % ����һ�����ú���ѡ��
new_point_string = get(hedit_point,'string'); % ���������Զ��庯��

if hradio_point_one_Value == 1 % ���ú���ѡ��
    [point,t,f,ppy,phase,period] = Init_AimFunction(vpop_point,sample_seq,SampleFreq);
elseif new_point_string % �Զ��庯��
    [point,t,f,ppy,phase,period] = Init_AimFunction(vpop_point,sample_seq,SampleFreq,new_point_string);
end




if~isempty(vpop)
    popstr = {'draw_all(3,point,t,f,ppy,phase,period,h_axes_3d,h_axes_f,h_axes_nh,h_axes_zz);',...
        'draw_all(5,point,t,f,ppy,phase,period,h_axes_3d,h_axes_f,h_axes_nh,h_axes_zz)',...
        'draw_all(9,point,t,f,ppy,phase,period,h_axes_3d,h_axes_f,h_axes_nh,h_axes_zz)',...
        'draw_all(22,point,t,f,ppy,phase,period,h_axes_3d,h_axes_f,h_axes_nh,h_axes_zz)'};

    cct = str2double(ct);
    if hradio_one_value == 1 % ���ݵ�ѡ��ѡ�������ͼ
        eval(popstr{vpop})
    else
        if ~isnan(cct) && cct>0 && cct <= 0.5*SampleFreq
            eval(['draw_all(',ct,',point,t,f,ppy,phase,period,h_axes_3d,h_axes_f,h_axes_nh,h_axes_zz)'])
        elseif ~isempty(ct) && cct <= 0.5*SampleFreq
            errordlg('������һ�������������֣��磺17','��ʾ');
        elseif cct > 0.5*SampleFreq
            errordlg('���ֳ�����Χ��������һ��С��0.5����Ƶ�ʵ�����Ĭ�����ֵΪ0.5*1024=512��','��ʾ');
        end
    end
end
end