function [A,B,C,C0]=initial(N,L,F)
A=zeros(N,L);%存储各用户收到增强层的情况
B=zeros(1,N);%存储收到的总增强层数
C=zeros(1,N);%存储收到的有效增强层数
for i=1:N
    for j=1:L
        if rand()>F
            A(i,j)=1;
        end
    end
end%模拟丢层情况
for i=1:N
    for j=1:L
        B(i)=B(i)+A(i,j);
    end
end%计算收到总层数
for i=1:N
    for j=1:L
        if A(i,j)~=0
            C(i)=C(i)+A(i,j);
        else
            break;
        end
    end
end%计算收到总有效层数
C0=sum(C);%存储不修复时全组总有效层数
end