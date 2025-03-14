% 原始數據
y = [48.8, 47.2, 45.7, 41.125, 36.55, 31.975, 27.4, 26, 24.7]; 
x = 1:length(y); % x 軸為數據編號
yq =[43.4125,29.6875];
xq = [3.5,6.5];


% 繪製原始數據
figure;
plot(x, y, 'bo-', 'MarkerFaceColor', 'b', 'LineWidth', 1.5); % 原始數據點 (藍色圓點)

hold on; % 保持圖形
plot(xq, yq, 'rs', 'MarkerFaceColor', 'r', 'MarkerSize', 8); % 插值點 (紅色方塊)

% 標示數據點
for i = 1:length(x)
    text(x(i), y(i), sprintf('  %.2f', y(i)), 'FontSize', 10, 'Color', 'b');
end

for i = 1:length(xq)
    text(xq(i), yq(i), sprintf('  %.2f', yq(i)), 'FontSize', 10, 'Color', 'r');
end

% 設定圖形標籤與標題
xlabel('測量位置');
ylabel('溫度');
title('測試件：銅');
legend({'溫度線', '插值點'}, 'Location', 'Best');

grid on; % 顯示格線
hold off;

