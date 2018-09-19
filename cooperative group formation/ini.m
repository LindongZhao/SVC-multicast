%P={[1 2];[1 3 2 4];[2 3 4];[2 4 3 5 6];[4 6 7 5];[7 5 4 6];[5 6 7]};
global N   P  Z    UU 
NN=[100 200 300 400 500 600 700 800];
Q=[];
for kkk=1:8
    N=NN(kkk);%节点数
    P=cell(N,1);%存放偏好表
    Z=zeros(N,N);%用来存放效用值
    UU=sort(randperm(N));%定义一个总的不会变的节点号
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


