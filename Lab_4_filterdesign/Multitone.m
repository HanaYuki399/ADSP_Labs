fs = 10e6; 
tmax = 0.01; 
t = [0:1/fs:tmax];
fNyq = fs/2;
signal = (rand(1,length(t))-0.5)*10; 
figure('Name','Input signal');
plot(signal)
signalDft = abs(fft(signal))*2/length(signal);
fVector = linspace(0,fs,length(t)); 
figure('Name', 'Magnitude spectrum input signal');
plot(fVector, signalDft) 
% Channel 0 data 
[b,a] = butter(4,[890e3/fNyq 910e3/fNyq]);
signal0 = filter(b,a, signal);
figure('Name','Channel 0 data');
plot(signal0);
[b,a] = butter(4,[990e3/fNyq 1010e3/fNyq]);
signal1 = filter(b,a, signal);
figure('Name','Channel 1 data');
plot(signal1);
[b,a] = butter(4,[1090e3/fNyq 1110e3/fNyq]);
signal2 = filter(b,a, signal);
figure('Name','Channel 2 data');
plot(signal2);
multi_signal=signal0+signal2+signal1;
figure('Name','Multitone data');
plot(multi_signal);
MultsignalDft = abs(fft(multi_signal))*2/length(multi_signal);
figure('Name','Magnitude spectrum multitone');
plot(fVector,MultsignalDft);
