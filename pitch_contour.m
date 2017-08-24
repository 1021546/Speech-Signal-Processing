function pitch_contour(audioInfo,frame_num,frame_size,autocorrelation_all,energy_sill,Energy)
pitch(frame_num) = 0;
peak_count = 3; % every frame choose three peaks
peak_start = 1; % first frame has high autocorrelation

% 從autocorrelation算頻率，共peak_count個週期
for n = 1:frame_num
	temp_count = peak_count;
	peak_end = 1;
	if Energy(n) < energy_sill
		pitch(n) = 0;
		continue;
	end
	for m = 2:frame_size-1
		if temp_count == 0
			break;
		end
		if (autocorrelation_all(n,m) > autocorrelation_all(n,m-1)) && (autocorrelation_all(n,m) > autocorrelation_all(n,m+1)) % find peak
			temp_count = temp_count - 1;
            peak_end = m;
		end
	end
	pitch(n) = audioInfo.SampleRate/((peak_end-peak_start)/peak_count);
end

subplot(6, 1, 5);
x = 1:frame_num;
plot(x, pitch);
axis([0, frame_num, -inf, inf]);
title('Pitch'); 
