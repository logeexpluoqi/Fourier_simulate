function filesave(handle)
% ͼƬ�ļ����湦��

    axes(handle);
    if isempty(handle)
        return;
    end
    newFig = figure; %�������½���figure�е���ͼ
    set(newFig,'Visible','off') %�����½���figureΪ���ɼ�
    newAxes = copyobj(handle,newFig);%��ͼ���Ƶ��½���figure��
    set(newAxes,'Units','default','Position','default'); %����ͼ��ʾ��λ��
    [filename,pathname] = uiputfile({ '*.jpg','figure type(*.jpg)'}, '����ͼ��','untitled');
    if isequal(filename,0)||isequal(pathname,0) % ���ѡ��ȡ���������˳�
        return;
    else
        fpath=fullfile(pathname,filename);
    end
    %imwrite(newFig,fpath);%����û�ѡ��ȡ���������˳�
    f = getframe(newFig);
    f = frame2im(f);
    imwrite(f, fpath);
end