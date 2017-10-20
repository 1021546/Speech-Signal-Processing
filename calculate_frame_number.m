% reference website : 
% http://mirlab.org/jang/books/audiosignalprocessing/audioBasicFeature.asp?title=3-2%20Basic%20Acoustic%20Features%20(%B0%F2%A5%BB%C1n%BE%C7%AFS%BCx)&language=chinese


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
