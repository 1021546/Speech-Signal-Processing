function pitch_contour(audioInfo,frame_num,frame_size,frame_shift,autocorrelation_all)
pitch(frame_num) = 0;
peak_count = 2;
temp_count = 2;
peak_pre = 0;
peak = 0;
for n = 1:frame_num
	temp = (n-1)*frame_shift;
	temp_count = peak_count;
	peak_pre = 0;
	for m = 2:frame_size-1
		if temp_count == 0
			break;
		end
		if (autocorrelation_all(n,m) > autocorrelation_all(n,m-1)) && (autocorrelation_all(n,m) > autocorrelation_all(n,m+1))
			peak = peak + (m-peak_pre);
			peak_pre = m;
			temp_count = temp_count - 1;
		end
	end
	peak = peak/peak_count;
	pitch(n) = audioInfo.SampleRate/peak;
end

subplot(6, 1, 5);
x = 1:frame_num;
plot(x, pitch);
axis([0, frame_num, -inf, inf]);
title('Pitch');