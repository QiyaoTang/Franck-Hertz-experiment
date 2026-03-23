function [fitresult, gof] = createFit(x_selected, y_selected)
%CREATEFIT(X_SELECTED,Y_SELECTED)
%  创建一个拟合。
%
%  要进行 '无标题拟合 1' 拟合的数据:
%      X 输入: x_selected
%      Y 输出: y_selected
%  输出:
%      fitresult: 表示拟合的拟合对象。
%      gof: 带有拟合优度信息的结构体。
%
%  另请参阅 FIT, CFIT, SFIT.

%% 拟合: '无标题拟合 1'
[xData, yData] = prepareCurveData( x_selected, y_selected );

% 设置 fittype 和选项
ft = 'pchipinterp';
opts = fitoptions( 'Method', 'PchipInterpolant' );
opts.ExtrapolationMethod = 'pchip';
opts.Normalize = 'on';

% 对数据进行模型拟合
[fitresult, gof] = fit( xData, yData, ft, opts );

% 绘制数据拟合图（只显示拟合曲线，不显示点）
figure( 'Name', '无标题拟合 1' );

% 生成用于绘图的密集点
x_plot = linspace(min(xData), max(xData), 1000);
y_plot = fitresult(x_plot);

% 只绘制拟合曲线
plot(x_plot, y_plot, 'b-', 'LineWidth', 2);

% 为坐标轴加标签
xlabel( 'x_selected', 'Interpreter', 'none' );
ylabel( 'y_selected', 'Interpreter', 'none' );
xlim([0, 94.4]);   % 修正为带方括号的格式
grid on;

end