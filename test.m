% get audio inform
fileName='zxcdfd.wav';
%fileName='yesnodata.wav';
[y, fs] = audioread(fileName); 
audioInfo = audioinfo(fileName);

% variable declaration
frame_size_ms = 32;
frame_shift_ms = 16;
frame_size = frame_size_ms*0.001*audioInfo.SampleRate;
frame_shift = frame_shift_ms*0.001*audioInfo.SampleRate;
frame_num = floor((audioInfo.TotalSamples-(frame_size-frame_shift))/frame_shift);
frame_autocorrelation_no = 170;
volume_threshold = 100;

% -----------------------------------------------
% Wave Form
waveform(y,audioInfo,frame_num);

% -----------------------------------------------
% Energy
energy_contour(y,frame_num,frame_size,frame_shift);

% -----------------------------------------------
% Zero Crossing Rate
zero_crossing_rate_contour(y,frame_num,frame_size,frame_shift);

% -----------------------------------------------
% Autocorrelation on Frame XXX
autocorrelation_all=autocorrelation(y,frame_num,frame_size,frame_shift,frame_autocorrelation_no);

% -----------------------------------------------
% Pitch
pitch_contour(audioInfo,frame_num,frame_size,frame_shift,autocorrelation_all);

% -----------------------------------------------
% End Point Detection
%end_point_detection();
