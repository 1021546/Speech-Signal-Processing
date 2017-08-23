function waveform(y,audioInfo,frame_num)
subplot(6, 1, 1);
x = (1:length(y))/(audioInfo.TotalSamples/frame_num);
plot(x, y); % x and y must have same length
axis([0, frame_num, -inf, inf]); % �������x�b0��frame_num���d�� �������y�b -inf �� inf ���d��
title('Wave Form');