clear
L=3;%��ǿ�����
F=[0.1 0.15 0.2 0.25 0.3 0.35 0.4 0.45 0.5];%�������
P=[19.2758 23.5309 27.9019 38.2781];%4��
%P=[19.7168 22.0017 24.4373 27.4240 31.3415 35.9382 38.2781];M=[1 2 2 3 4 4 5];%7��
%P=[19.7168 22.0017 24.4373 27.4240 31.3415 35.9382 38.2781 43.2947];%8��
T=1000;%���������С
PSNR=cell(1,4);
flag=1;

for i=1:2:7
PSNR2=zeros(1,6);%�������ƽ��PSNR
flag1=1;
for N=5:5:30
    P2=0;
    psnr2=zeros(1,N);%���û��ڱ������µ�ƽ��PSNR
    for j=1:T
        [A,B,C,C0]=initial(N,L,F(i));
%����ģ������û�������� ��������ʼ�޸�
        Times=1;%�������޸�������
        for k=1:Times
            [A,B,C,result]=cooperation(N,L,A,B,C);
        end
        for k=1:N
            psnr2(k)=P(C(k)+1);
        end
        P2=P2+sum(psnr2);
    end
    PSNR2(flag1)=P2/(N*T);
    flag1=flag1+1;
end
PSNR{1,flag}=PSNR2;
flag=flag+1;
end
%����PSNRͼ
X=[5 10 15 20 25 30];
figure;
plot(X,PSNR{1,1},'-sb');
xlabel('Cooperative Group Size');
ylabel('PSNR(dB)');
hold on;
plot(X,PSNR{1,2},'-dg');
hold on;
plot(X,PSNR{1,3},'-pr');
hold on;
plot(X,PSNR{1,4},'-oc');
hold on;
legend('With burst-loss probability = 0.1','With burst-loss probability = 0.2','With burst-loss probability = 0.3','With burst-loss probability = 0.4');
grid on;
set(gca,'GridLineStyle',':','GridColor','k', 'GridAlpha',1)
axis([5 30 20 40]);
set(gca,'YTick',20:5:40);



