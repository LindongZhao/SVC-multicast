%����������n��ϵ������
%C=[2 15 13 4;10 4 14 15;9 14 16 13;7 8 11 9];%Ч�ʾ���C
function [x,z]=recovery(C)
n=size(C,1);%����C��������n
C=-C(:);%����Ŀ�꺯��ϵ����������C�����ų�һ�����������ɡ�
%%%�������һ����С���Ŷ�
%C = C + randn(n)/1000;
A=[];B=[];%û�в���ʽԼ��
Ae=zeros(2*n,n^2);%�����Լ����ϵ������a
for i=1:n
    for j=(i-1)*n+1:n*i
        Ae(i,j)=1;
    end
    for k=i:n:n^2
        Ae(n+i,k)=1;
    end
end
Be=ones(2*n,1);%��ʽԼ���Ҷ���b
Xm=zeros(n^2,1);%���߱����½�Xm
XM=ones(n^2,1);%���߱����Ͻ�XM
[x,z]=linprog(C,A,B,Ae,Be,Xm,XM);%ʹ��linprog���
x=reshape(x,n,n);%��������x�����ų�һ��n�׷���
z=-z;
%Assignment=round(x);%ʹ��round������������ȡ��
end