clc;
clear;

% ����ͼ�δ��ڵĴ�С
figure('Position', [0, 0, 15*72, 3*72]); % ���ÿ��Ϊ 15 Ӣ�磬�߶�Ϊ 3 Ӣ��

% ���� K1 �Ĳ�ͬȡֵ
K1_values = [30,34,38,42,46];
colors = [[0 0.2 0.4]; [0.85 0 0]; [0 0.39 0]; [0.5 0 0.5]; [1 0.65 0]];
linestyles = {'-'}; % ����

% �������в�������ʼֵ
K1=40,K2=35,K3=10,K4=5,alpha=0.7,beta=0.6,C1=10,C2=5,C3=6,W1=20,W2=5, W3=10,E1=10,E2=19,E3=18,I=5,L=5,R=8,S=12,T=10,P=18,B=8;

% ѭ������ x��y��z ��ͼ������
for var = 1:3
    subplot(1,3,var);
    
    % ��ջ�ͼ�������
    h_lines = [];
    
    for i = 1:length(K1_values)
        K1 = K1_values(i);
        
        % ���� var ��ֵѡ���Ӧ���������
        if var == 1
            [t,x]=ode45(@(t,x) yingjiwuliu(t, x, K1, K2, K3, K4, alpha, beta, C1, C2, C3, W1, W2, W3, E1, E2, E3, I, L, R, S, T, P, B),[0 50],[0.5 0.5 0.5]);
            h = plot(x(:,1), linestyles{1}, 'Color', colors(i,:), 'LineWidth', 1);
        elseif var == 2
            [t,x]=ode45(@(t,x) yingjiwuliu(t, x, K1, K2, K3, K4, alpha, beta, C1, C2, C3, W1, W2, W3, E1, E2, E3, I, L, R, S, T, P, B),[0 50],[0.5 0.5 0.5]);
            h = plot(x(:,2), linestyles{1}, 'Color', colors(i,:), 'LineWidth', 1);
        else
            [t,x]=ode45(@(t,x) yingjiwuliu(t, x, K1, K2, K3, K4, alpha, beta, C1, C2, C3, W1, W2, W3, E1, E2, E3, I, L, R, S, T, P, B),[0 50],[0.5 0.5 0.5]);
            h = plot(x(:,3), linestyles{1}, 'Color', colors(i,:), 'LineWidth', 1);
        end
        
        hold on;
        h_lines = [h_lines h];
    end
    
    set(gca,'XTick',[0:5:50],'YTick',[0:0.2:1]);
    axis([0 50 0 1]);
    if var == 1
        xlabel('$Time$','interpreter','latex');ylabel('$x$','interpreter','latex');
    elseif var == 2
        xlabel('$Time$','interpreter','latex');ylabel('$y$','interpreter','latex');
    else
        xlabel('$Time$','interpreter','latex');ylabel('$z$','interpreter','latex');
    end
    
    legend_labels = cell(length(K1_values), 1);
    for i = 1:length(K1_values)
        legend_labels{i} = ['K1=' num2str(K1_values(i))];
    end
    legend(h_lines, legend_labels,'Location','northeast');
    
    grid off;
    box off;
    ax1 = axes('Position',get(gca,'Position'),'XAxisLocation','top',...
        'YAxisLocation','right','Color','none','XColor','k','YColor','k');
    set(ax1,'XTick', [],'YTick', []);
end
% ����ͼ��ΪEMFʸ��ͼ
print(gcf, 'C:\Users\xin\Desktop\ѧҵ\12Ӧ������\matlab\ͼƬ\K1_xyz', '-dmeta', '-r300');
