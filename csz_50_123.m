% 推论1
clc;
clear;

% 创建一个 1 行 3 列的图形窗口
figure('Position', [0, 0, 5*72*3, 2.75*72]);

% 定义一个存储所有子图句柄的数组
subplot_handles = zeros(1, 3);

% 第一个数组
subplot_handles(1) = subplot(1, 3, 1); % 创建第一个子图
K1=40,K2=30,K3=10,K4=5,alpha=0.7,beta=0.6,C1=10,C2=5,C3=6,W1=10,W2=5, W3=10,E1=10,E2=19,E3=9,I=5,L=5,R=8,S=10,T=10,P=20,B=8;
for i=0.1:0.2:1
    for j=0.1:0.2:1
        for k=0.1:0.2:1   
            [t,x]=ode45(@(t,x) yingjiwuliu(t,x,K1,K2,K3,K4,alpha,beta,C1,C2,C3,W1,W2,W3,E1,E2,E3,I,L,R,S,T,P,B),[0 50],[i j k]);               
            plot3(x(:,1),x(:,2),x(:,3),'linewidth',1); % 把颜色改为红色，线型改为五角星。
            set(gca,'XTick',[0:0.2:1],'YTick',[0:0.2:1],'ZTick',[0:0.2:1])
            hold on
            axis([0 1 0 1 0 1])
            view([45 10])
        end
    end
end
grid on;
hold on;
xlabel('x','Rotation',0);
ylabel('y','Rotation',0);
zlabel('z','Rotation',360,'position',[0 0 1.05]);

% 第二个数组
subplot_handles(2) = subplot(1, 3, 2); % 创建第二个子图
K1=40,K2=25,K3=10,K4=5,alpha=0.7,beta=0.6,C1=10,C2=5,C3=3,W1=10,W2=5, W3=10,E1=10,E2=19,E3=9,I=15,L=5,R=8,S=10,T=10,P=20,B=8;
for i=0.1:0.2:1
    for j=0.1:0.2:1
        for k=0.1:0.2:1   
            [t,x]=ode45(@(t,x) yingjiwuliu(t,x,K1,K2,K3,K4,alpha,beta,C1,C2,C3,W1,W2,W3,E1,E2,E3,I,L,R,S,T,P,B),[0 50],[i j k]);               
            plot3(x(:,1),x(:,2),x(:,3),'linewidth',1);
            set(gca,'XTick',[0:0.2:1],'YTick',[0:0.2:1],'ZTick',[0:0.2:1])
            hold on
            axis([0 1 0 1 0 1])
            view([45 10])
        end
    end
end
grid on;
hold on;
xlabel('x','Rotation',0);
ylabel('y','Rotation',0);
zlabel('z','Rotation',360,'position',[0 0 1.05]);

% 第三个数组
subplot_handles(3) = subplot(1, 3, 3); % 创建第三个子图
K1=40,K2=35,K3=10,K4=5,alpha=0.7,beta=0.6,C1=10,C2=5,C3=6,W1=20,W2=5, W3=10,E1=10,E2=19,E3=18,I=5,L=5,R=8,S=12,T=10,P=18,B=8;
for i=0.1:0.2:1
    for j=0.1:0.2:1
        for k=0.1:0.2:1   
            [t,x]=ode45(@(t,x) yingjiwuliu(t,x,K1,K2,K3,K4,alpha,beta,C1,C2,C3,W1,W2,W3,E1,E2,E3,I,L,R,S,T,P,B),[0 50],[i j k]);               
            plot3(x(:,1),x(:,2),x(:,3),'linewidth',1);
            set(gca,'XTick',[0:0.2:1],'YTick',[0:0.2:1],'ZTick',[0:0.2:1])
            hold on
            axis([0 1 0 1 0 1])
            view([45 10])
        end
    end
end
grid on;
hold on;
xlabel('x','Rotation',0);
ylabel('y','Rotation',0);
zlabel('z','Rotation',360,'position',[0 0 1.05]);

% 保存整个图形
saveas(gcf, 'C:\Users\xin\Desktop\学业\12应急物流\matlab\matlab高清图\csz_all_50.png');