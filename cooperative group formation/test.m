global P UU C U1 i2 E
V=[];
U=U1;
while ~isempty(U)%���нڵ㱻ѡ��ǰ���ε����������
    H=[];
    F=0;
    i1=1;
    a=size(U,2);
    b=randi([1,a]);
    na=U(b);%������ָ��������ѡ�ڵ�
    while F==0
        
        H=[H na];
        while ismember(P{na,1}(i1),E)==1
            i1=i1+1;%�жϱ��ڵ�����Ȼ���Ƿ��ڱ��ε���ǰ�ѳɻ�
        end
        nb=P{na,1}(i1);
        if ismember(nb,V)==1
            V=union(V,H);
            U=setdiff(U,V);
            F=1;%��־��Ҫ������һ��ѭ����ѡ�ڵ���
        elseif ismember(nb,H)==1
            C{i2,1}=H(find(H==nb):size(H,2));%�ɻ�����
            U1=setdiff(U1,C{i2,1});
            E=setdiff(UU,U1);
            i2=i2+1;%������һ
            V=union(V,H);
            U=setdiff(U,V);
            F=1;
        else
            na=nb;
            i1=1;%û������ѭ�������Ǹ��½ڵ��ˣ�����Ҫ�������ȼ�ѭ��
        end          
    end  
end