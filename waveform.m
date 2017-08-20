function waveform(y,audioInfo,frame_num)
subplot(6, 1, 1);
x = (1:length(y))/(audioInfo.TotalSamples/frame_num);
plot(x, y);
axis([0, frame_num, -inf, inf]); % �������x�b0��frame_num���d��
title('Wave Form');