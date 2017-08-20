function waveform(y,audioInfo,frame_num)
subplot(6, 1, 1);
x = (1:length(y))/(audioInfo.TotalSamples/frame_num);
plot(x, y);
axis([0, frame_num, -inf, inf]); % 限制顯示x軸0到frame_num的範圍
title('Wave Form');