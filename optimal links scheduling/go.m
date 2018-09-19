clear
N=10;%�û�����
L=3;%��ǿ�����
F=[0.1 0.15 0.2 0.25 0.3 0.35 0.4 0.45 0.5];%�������
P=[19.2758 23.5309 27.9019 38.2781];M=[1 2 3 5];%4��
%P=[19.7168 22.0017 24.4373 27.4240 31.3415 35.9382 38.2781];M=[1 2 2 3 4 4 5];%7��
%P=[19.7168 22.0017 24.4373 27.4240 31.3415 35.9382 38.2781 43.2947];%8��
T=1000;%���������С
V1=zeros(1,9);%δ��������Ч֡��
V2=zeros(1,9);%���������Ч֡��
PSNR1=zeros(1,9);%δ������ƽ��PSNR
PSNR2=zeros(1,9);%�������ƽ��PSNR
MOS1=zeros(1,9);%δ������ƽ��MOS
MOS2=zeros(1,9);%�������ƽ��MOS
for i=1:9
    v1=0;
    v2=0;
    P1=0;
    P2=0;
    M1=0;
    M2=0;
    psnr1=zeros(1,N);%���û�ֱ����ƽ��PSNR
    psnr2=zeros(1,N);%���û��ڱ������µ�ƽ��PSNR
    mos1=zeros(1,N);%���û�ֱ����ƽ��PSNR
    mos2=zeros(1,N);%���û��ڱ������µ�ƽ��PSNR
    for j=1:T
        [A,B,C,C0]=initial(N,L,F(i));
        for k=1:N
            psnr1(k)=P(C(k)+1);
            mos1(k)=M(C(k)+1);
        end
        P1=P1+sum(psnr1);
        M1=M1+sum(mos1);
%����ģ������û�������� ��������ʼ�޸�
        Times=1;%�������޸�������
        for k=1:Times
            [A,B,C,result]=cooperation(N,L,A,B,C);
        end
        for k=1:N
            psnr2(k)=P(C(k)+1);
            mos2(k)=M(C(k)+1);
        end
        P2=P2+sum(psnr2);
        M2=M2+sum(mos2);
        v1=v1+C0/(N*L);
        v2=v2+result/(N*L);
    end
    PSNR1(i)=P1/(N*T);
    PSNR2(i)=P2/(N*T);
    MOS1(i)=M1/(N*T);
    MOS2(i)=M2/(N*T);
    V1(i)=v1/T;
    V2(i)=v2/T;
end
%������Ч֡��ͼ
figure;
V1=V1*100;
V2=V2*100;
plot(F,V1,'-sb');
xlabel('Burst-loss probability during a GoP transmission');
ylabel('Valuable Video Frame Ratio(%)');
hold on;
plot(F,V2,'-or');
legend('Direct Multicast','The Proposed Scheme');
grid on;
set(gca,'GridLineStyle',':','GridColor','k', 'GridAlpha',1)
%����PSNRͼ
figure;
plot(F,PSNR1,'-sb');
xlabel('Burst-loss probability during a GoP transmission');
ylabel('PSNR(dB)');
hold on;
plot(F,PSNR2,'-or');
legend('Direct Multicast','The Proposed Scheme');
grid on;
set(gca,'GridLineStyle',':','GridColor','k', 'GridAlpha',1)
axis([0.1 0.5 20 40]);
set(gca,'YTick',20:5:40);
%����MOSͼ
figure;
plot(F,MOS1,'-sb');
xlabel('Burst-loss probability during a GoP transmission');
ylabel('MOS');
hold on;
plot(F,MOS2,'-or');
legend('Direct Multicast','The Proposed Scheme');
grid on;
set(gca,'GridLineStyle',':','GridColor','k', 'GridAlpha',1)
axis([0.1 0.5 1 5]);
set(gca,'YTick',1:1:5);


