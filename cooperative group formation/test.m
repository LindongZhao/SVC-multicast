global P UU C U1 i2 E
V=[];
U=U1;
while ~isempty(U)%所有节点被选中前本次迭代不会结束
    H=[];
    F=0;
    i1=1;
    a=size(U,2);
    b=randi([1,a]);
    na=U(b);%这三行指令用于重选节点
    while F==0
        
        H=[H na];
        while ismember(P{na,1}(i1),E)==1
            i1=i1+1;%判断本节点的优先伙伴是否在本次迭代前已成环
        end
        nb=P{na,1}(i1);
        if ismember(nb,V)==1
            V=union(V,H);
            U=setdiff(U,V);
            F=1;%标志着要结束这一层循环重选节点了
        elseif ismember(nb,H)==1
            C{i2,1}=H(find(H==nb):size(H,2));%成环操作
            U1=setdiff(U1,C{i2,1});
            E=setdiff(UU,U1);
            i2=i2+1;%环数加一
            V=union(V,H);
            U=setdiff(U,V);
            F=1;
        else
            na=nb;
            i1=1;%没有跳出循环，但是更新节点了，所以要重置优先级循环
        end          
    end  
end