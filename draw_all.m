function draw_all(m,point,t,f,ppy,phase,period, h_axes_3d, h_axes_f, h_axes_nh,h_axes_zz)
% ����/��������ͼ��

% ����3d��ͼ
axes(h_axes_3d);
rotate3d on;
draw_mainpicture(m,point,t,f,ppy,phase,period)

% ����Ƶ�׷�ֵͼ
axes(h_axes_f);
draw_frequency(m,f,ppy)
% axes(h_axes_3d);

% ����Ƶ����λͼ
axes(h_axes_zz);
draw_phase(m,f,phase)
% axes(h_axes_3d);

% ����m�����ͼ
axes(h_axes_nh);
draw_harmonic(m,point,t,f,ppy,phase)
% axes(h_axes_3d);


end