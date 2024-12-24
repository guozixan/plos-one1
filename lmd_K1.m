clc;
clear;

% 设置图形窗口的大小
figure('Position', [0, 0, 15*72, 3*72]); % 设置宽度为 15 英寸，高度为 3 英寸

% 定义 K1 的不同取值
K1_values = [30,34,38,42,46];
colors = [[0 0.2 0.4]; [0.85 0 0]; [0 0.39 0]; [0.5 0 0.5]; [1 0.65 0]];
linestyles = {'-'}; % 线型

% 定义所有参数及初始值
K1=40,K2=35,K3=10,K4=5,alpha=0.7,beta=0.6,C1=10,C2=5,C3=6,W1=20,W2=5, W3=10,E1=10,E2=19,E3=18,I=5,L=5,R=8,S=12,T=10,P=18,B=8;

% 循环绘制 x、y、z 的图并处理
for var = 1:3
    subplot(1,3,var);
    
    % 清空绘图句柄数组
    h_lines = [];
    
    for i = 1:length(K1_values)
        K1 = K1_values(i);
        
        % 根据 var 的值选择对应的输出变量
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
% 保存图像为EMF矢量图
print(gcf, 'C:\Users\xin\Desktop\学业\12应急物流\matlab\图片\K1_xyz', '-dmeta', '-r300');
