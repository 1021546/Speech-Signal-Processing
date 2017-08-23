function waveform(y,audioInfo,frame_num)
subplot(6, 1, 1);
x = (1:length(y))/(audioInfo.TotalSamples/frame_num);
plot(x, y); % x and y must have same length
axis([0, frame_num, -inf, inf]); % 限制顯示x軸0到frame_num的範圍 限制顯示y軸 -inf 到 inf 的範圍
title('Wave Form');