%P={[1 2];[1 3 2 4];[2 3 4];[2 4 3 5 6];[4 6 7 5];[7 5 4 6];[5 6 7]};
global N   P  Z    UU 
NN=[100 200 300 400 500 600 700 800];
Q=[];
for kkk=1:8
    N=NN(kkk);%�ڵ���
    P=cell(N,1);%���ƫ�ñ�
    Z=zeros(N,N);%�������Ч��ֵ
    UU=sort(randperm(N));%����һ���ܵĲ����Ľڵ��
    kk=1000;
    M=0;
    for k=1:kk
        go;
        M=M+m0;
    end
    M=M/kk;
    q=N/M;
    Q(kkk)=q;
end
plot(NN,Q,'-sb');
xlabel('Number of Users');
ylabel('Average Size of Multicast Groups');
grid on;


