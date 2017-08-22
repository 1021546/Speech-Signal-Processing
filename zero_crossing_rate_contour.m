function zero_crossing_rate=zero_crossing_rate_contour(y,frame_num,frame_size,frame_shift)
zero_crossing_rate(frame_num) = 0;
for i = 1:frame_num
	temp = (i-1)*frame_shift;
	for j = 1:frame_size
		if temp+j-1 == 0
			continue;
		end
		zero_crossing_rate(i) = zero_crossing_rate(i) + abs(sign(y(temp+j))-sign(y(temp+j-1)))*hamming_window(i-(temp+j), frame_size);
	end
	zero_crossing_rate(i) = zero_crossing_rate(i) / frame_size;
end
subplot(6, 1, 3);
x = 1:frame_num;
plot(x, zero_crossing_rate);
axis([0, frame_num, 0, 1]);
title('Zero Crossing Rate');
