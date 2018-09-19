global N  P  Z  C U1 i2 E 
C={;1};%全都重置一次
U1=sort(randperm(N));
i2=1;
E=[];
for i=1:N%生成效用值表
    for j=1:N
        if i==j
            Z(i,j)=0;  
        else
            Z(i,j)=rand;
        end
    end
end
for i=1:N%生成偏好表
    p=Z(i,:);%提取码率矩阵的第i行
    
    [B,P{i,1}]=sort(p,'descend');
    
end
while ~isempty(U1)%仅考虑互助关系时
    test;
end
[m0,~]=size(C);



