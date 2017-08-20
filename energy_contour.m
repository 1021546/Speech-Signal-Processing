function energy_contour(y,frame_num,frame_size,frame_shift)
energy(frame_num) = 0;
for n = 1:frame_num
	temp = (n-1)*frame_shift;
	for m = 1:frame_size
		energy(n) = energy(n) + (y(temp+m)*hamming_window(n-(temp+m), frame_size))^2;
	end
end
subplot(6, 1, 2);
x = 1:frame_num;
plot(x, energy);
axis([0, frame_num, -inf, inf]);
title('Energy'); 