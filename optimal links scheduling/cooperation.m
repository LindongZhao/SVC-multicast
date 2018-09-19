function [A,B,C,result]=cooperation(N,L,A,B,C)
U=zeros(N,N);%建立效用表
for i=1:N
    U(i,1:N)=C(i);
end
for i=1:N
    if B(i)~=L
        for j=1:N
            if i==j
                U(i,j)=C(i);
            else
                for k=1:L
                    if A(i,k)==0&&A(j,k)~=0
                        if B(i)~=(L-1)
                            for l=(k+1):L
                                if A(i,l)==0
                                    U(i,j)=l-1;
                                    break;
                                end
                            end
                        else
                            U(i,j)=L;
                        end
                        break;
                    end
                end
            end
        end
    end
end%建立效用表的过程
%colSub = perms([1:N]).';  %简单粗暴的遍历方法
%linearInd = bsxfun(@plus,[1:N].',(colSub-1)*N);
%max(sum(U(linearInd)))
[X,result]=recovery(U);%X为指派矩阵，result为修复后的总有效层数
J = sum(cumsum(X~=0,2)==0,2)+1;%找出指派矩阵中第一个不为0实际上也是唯一不为0的元素位置
J(J>size(X,2)) = nan;%相应的我们知道用户和谁合作了
J=J';
for i=1:N%更新收到有效增强层数C
    C(i)=U(i,J(i));
end
for i=1:N%更新各用户具体层数A
   index=sort(randperm(C(i)));
   A(i,index)=1;
end
for i=1:N
    B(i)=0;
    for j=1:L
        B(i)=B(i)+A(i,j);
    end
end%更新收到总层数B
end