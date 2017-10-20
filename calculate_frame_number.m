% get audio inform
fileName='a1.wav';
[y, fs] = audioread(fileName); 
audioInfo = audioinfo(fileName);

% variable declaration
frame_size_ms = 32;
frame_shift_ms = 16;
frame_size = frame_size_ms*0.001*audioInfo.SampleRate;
frame_shift = frame_shift_ms*0.001*audioInfo.SampleRate;
frame_num = floor((audioInfo.TotalSamples-(frame_size-frame_shift))/frame_shift); % 374

frame_rate=fs/(frame_size-frame_shift);
frame_number=frame_rate*6; % 375
