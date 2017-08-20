function autocorrelation_all=autocorrelation(y,frame_num,frame_size,frame_shift,frame_autocorrelation_no)
autocorrelation_temp(frame_size) = 0;
temp_seq(frame_size) = 0;
autocorrelation_all(frame_num, frame_size) = 0;

for n = 1:frame_num
	temp = (n-1)*frame_shift;
	for m = 1:frame_size
		temp_seq(m) = y(temp+m)*hamming_window(n-(temp+m), frame_size);
	end
	for k = 1:frame_size
		autocorrelation_all(n, k) = sum(temp_seq(1:frame_size-k+1).*temp_seq(k:frame_size));
	end
end

autocorrelation_temp = autocorrelation_all(frame_autocorrelation_no,:);



subplot(6, 1, 4);
x = 1:frame_size;
plot(x, autocorrelation_temp);
axis([0, frame_size, -inf, inf]);
title(strcat('Autocorrelation on Frame¡@',num2str(frame_autocorrelation_no)))