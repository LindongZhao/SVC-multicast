global N  P  Z  C U1 i2 E 
C={;1};%ȫ������һ��
U1=sort(randperm(N));
i2=1;
E=[];
for i=1:N%����Ч��ֵ��
    for j=1:N
        if i==j
            Z(i,j)=0;  
        else
            Z(i,j)=rand;
        end
    end
end
for i=1:N%����ƫ�ñ�
    p=Z(i,:);%��ȡ���ʾ���ĵ�i��
    
    [B,P{i,1}]=sort(p,'descend');
    
end
while ~isempty(U1)%�����ǻ�����ϵʱ
    test;
end
[m0,~]=size(C);



