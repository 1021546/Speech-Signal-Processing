function end_point_detection(y,frame_num,audioInfo,Energy,Zero_Crossing_Rate,energy_sill,izct_sill)

%ITL= Lower threshold of energy. ITU= Upper threshold of energy. IZCT= Zero-crossing threshold
% �̧ǥHitl�Bitu�Bizct���зǡA��X�_�l�P�������I
epd_start = 1;
epd_end = frame_num;
itl = energy_sill;
itu = 5*itl;

% �H�����q(ITU)���зǡA�M�w�_�l���I�G�N���I�e�᩵����C���q(ITL)�B

% itu
for i = 1:frame_num
	if Energy(i) >= itu
		epd_start = i; % epd_start is initialized to 1
		break;
	end
end
for i = 1:frame_num
	if Energy(frame_num+1-i) >= itu
		epd_end = frame_num+1-i; % epd_end is initialized to frame_num
		break;
	end
end
% itl
for i = 1:epd_start-1
	if Energy(epd_start-i) <= itl
		epd_start = epd_start-i;
		break;
    end
    if i==epd_start-1
		epd_start = 0; % avoid " Energy(epd_start-i) <= itl " invalid
	end
end
for i = 1:frame_num-epd_end
	if Energy(epd_end+i) <= itl
		epd_end = epd_end+i;
		break;
    end
    if i==frame_num-epd_end
		epd_end = frame_num; % avoid " Energy(epd_end+i) <= itl " invalid
	end
end
% izct
for i = 1:epd_start-1
	if Zero_Crossing_Rate(epd_start-i) <= izct_sill
		epd_start = epd_start-i;
		break;
    end
    if i==epd_start-1
		epd_start = 0; % avoid " Zero_Crossing_Rate(epd_start-i) <= izct_sill " invalid
	end
end
for i = 1:frame_num-epd_end
	if Zero_Crossing_Rate(epd_end+i) <= izct_sill
		epd_end = epd_end+i;
		break;
    end
    if i==frame_num-epd_end
		epd_end = frame_num; % avoid " Zero_Crossing_Rate(epd_end+i) <= izct_sill " invalid
	end
end

subplot(6, 1, 6);
x = (1:length(y))/(audioInfo.TotalSamples/frame_num);

plot(x, y); % x and y must have same length
axis([0, frame_num, -inf, inf]); % �������x�b0��frame_num���d��
title('End Point Detection'); 
line([epd_start epd_start], [min(y) max(y)], 'color', 'r');
line([epd_end epd_end], [min(y) max(y)], 'color', 'g');