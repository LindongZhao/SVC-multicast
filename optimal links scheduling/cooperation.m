function [A,B,C,result]=cooperation(N,L,A,B,C)
U=zeros(N,N);%����Ч�ñ�
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
end%����Ч�ñ�Ĺ���
%colSub = perms([1:N]).';  %�򵥴ֱ��ı�������
%linearInd = bsxfun(@plus,[1:N].',(colSub-1)*N);
%max(sum(U(linearInd)))
[X,result]=recovery(U);%XΪָ�ɾ���resultΪ�޸��������Ч����
J = sum(cumsum(X~=0,2)==0,2)+1;%�ҳ�ָ�ɾ����е�һ����Ϊ0ʵ����Ҳ��Ψһ��Ϊ0��Ԫ��λ��
J(J>size(X,2)) = nan;%��Ӧ������֪���û���˭������
J=J';
for i=1:N%�����յ���Ч��ǿ����C
    C(i)=U(i,J(i));
end
for i=1:N%���¸��û��������A
   index=sort(randperm(C(i)));
   A(i,index)=1;
end
for i=1:N
    B(i)=0;
    for j=1:L
        B(i)=B(i)+A(i,j);
    end
end%�����յ��ܲ���B
end