function [A,B,C,C0]=initial(N,L,F)
A=zeros(N,L);%�洢���û��յ���ǿ������
B=zeros(1,N);%�洢�յ�������ǿ����
C=zeros(1,N);%�洢�յ�����Ч��ǿ����
for i=1:N
    for j=1:L
        if rand()>F
            A(i,j)=1;
        end
    end
end%ģ�ⶪ�����
for i=1:N
    for j=1:L
        B(i)=B(i)+A(i,j);
    end
end%�����յ��ܲ���
for i=1:N
    for j=1:L
        if A(i,j)~=0
            C(i)=C(i)+A(i,j);
        else
            break;
        end
    end
end%�����յ�����Ч����
C0=sum(C);%�洢���޸�ʱȫ������Ч����
end