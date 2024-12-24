clc,clear;
% 设置图形窗口的大小
figure('Position', [0, 0, 15*72, 3*72]); % 设置宽度为 15 英寸，高度为 3 英寸

% 定义 I 的不同取值
E3_values = [20,25,30,35,40];
colors = [[0 0.2 0.4]; [0.85 0 0]; [0 0.39 0]; [0.5 0 0.5]; [1 0.65 0]];
linestyles = {'-'}; % 线型
linewidths = [2];
% 定义所有参数及初始值
K1=40,K2=35,K3=10,K4=5,alpha=0.7,beta=0.6,C1=10,C2=5,C3=6,W1=20,W2=5, W3=10,E1=10,E2=19,E3=18,I=5,L=5,R=8,S=12,T=10,P=18,B=8;



% 获取当前图形窗口句柄
figHandle = gcf;

% 循环绘制 x、y、z 的图并处理
for var = 1:3
    subplot(1,3,var); % 创建 1x3 的子图布局，并选择第 var 个子图
    
    % 清空绘图句柄数组
    h_lines = [];
    
    for i = 1:length(E3_values)
        E3 = E3_values(i);
        
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
        h_lines = [h_lines h]; % 将绘图句柄存储到数组中
    end
    
    % 坐标刻度间隔及其区间，坐标标注
    set(gca,'XTick',[0:5:50],'YTick',[0:0.2:1]);
    axis([0 50 0 1]);
    if var == 1
        xlabel('$Time$','interpreter','latex');ylabel('$x$','interpreter','latex');
    elseif var == 2
        xlabel('$Time$','interpreter','latex');ylabel('$y$','interpreter','latex');
    else
        xlabel('$Time$','interpreter','latex');ylabel('$z$','interpreter','latex');
    end
    
    % 创建图例
    legend_labels = cell(length(E3_values), 1);
    for i = 1:length(E3_values)
        legend_labels{i} = ['E3=' num2str(E3_values(i))];
    end
    legend(h_lines, legend_labels,'Location','northeast');
    
    % 图象网格，底图加白
    grid off;
    box off; % 取消边框
    ax1 = axes('Position',get(gca,'Position'),'XAxisLocation','top',...
        'YAxisLocation','right','Color','none','XColor','k','YColor','k');  % 设置坐标区
    set(ax1,'XTick', [],'YTick', []);   % 去掉 xy 轴刻度
end

% 保存图像（根据实际情况修改路径）
print(gcf, 'C:\Users\xin\Desktop\学业\12应急物流\matlab\图片\E3_xyz', '-dmeta', '-r600');