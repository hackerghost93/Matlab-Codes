Fs = 50000 ;
t = 0:1/Fs:1/500;
y = sin(2*pi*500*t);
Wn = 2*pi*500/50000;
deltaSignal = DeltaModulation(t,y,1/Fs,0.05);
%butter take the degree and normalized cutoff frequency
[b a] = butter(2,0.3,'low');
filtered = filter(b,a,deltaSignal);
figure ;
plot(t,filtered);
RootMeanSquare(y,deltaSignal)

%%%%%%%%%%%%%%%%%%%%%%%
%unit step
y = ones(1,length(t));
deltaSignal = DeltaModulation(t,y,1/Fs,0.05);
%butter take the degree and normalized cutoff frequency
[b a] = butter(2,0.3,'low');
filter(b,a,deltaSignal);
%figure ;
%plot(t,filtered);
RootMeanSquare(y,deltaSignal)


%%%%%%%%%%%%%%%%%%%%%%%%%%%
%square wave
y = square(2*pi*500*t);
plot(t,y);
deltaSignal = DeltaModulation(t,y,1/Fs,0.05);
%butter take the degree and normalized cutoff frequency
[b a] = butter(2,0.3,'low');
filter(b,a,deltaSignal);
%figure ;
%plot(t,filtered);
RootMeanSquare(y,deltaSignal)