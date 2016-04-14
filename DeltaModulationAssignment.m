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
title('filtered signal Sinusoidal wave ');
RootMeanSquare(y,deltaSignal)

%%%%%%%%%%%%%%%%%%%%%%%
%unit step
y = ones(1,length(t));
deltaSignal = DeltaModulation(t,y,1/Fs,0.05);
%butter take the degree and normalized cutoff frequency
[b a] = butter(2,0.3,'low');
filter(b,a,deltaSignal);
figure ;
plot(t,filtered);
title('filtered signal Unit Step');
RootMeanSquare(y,deltaSignal)


%%%%%%%%%%%%%%%%%%%%%%%%%%%
%square wave
y = square(2*pi*500*t);
deltaSignal = DeltaModulation(t,y,1/Fs,0.05);
%butter take the degree and normalized cutoff frequency
[b a] = butter(2,0.3,'low');
filter(b,a,deltaSignal);
figure ;
plot(t,filtered);
title('filtered signal Square Wave');
RootMeanSquare(y,deltaSignal)


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% delta = 0.1 delta %%%%%%%%%%%%%%%%%%
Fs = 50000 ;
t = 0:1/Fs:3/500;
y = sin(2*pi*500*t);
Wn = 2*pi*500/50000;
deltaSignal = DeltaModulation(t,y,1/Fs,0.05*0.1);
%butter take the degree and normalized cutoff frequency
[b a] = butter(2,0.3,'low');
filtered = filter(b,a,deltaSignal);
figure ;
plot(t,filtered);
title('filtered signal * 0.1 delta Sinusoidal Wave');
RootMeanSquare(y,deltaSignal)

%%%%%%%%%%%%%%%%%%%%%%%
%unit step
y = ones(1,length(t));
deltaSignal = DeltaModulation(t,y,1/Fs,0.05*0.1);
%butter take the degree and normalized cutoff frequency
[b a] = butter(2,0.3,'low');
filter(b,a,deltaSignal);
figure ;
plot(t,filtered);
title('filtered signal * 0.1 delta Unit Step');
RootMeanSquare(y,deltaSignal)


%%%%%%%%%%%%%%%%%%%%%%%%%%%
%square wave
y = square(2*pi*500*t);
deltaSignal = DeltaModulation(t,y,1/Fs,0.05*0.1);
%butter take the degree and normalized cutoff frequency
[b a] = butter(2,0.3,'low');
filter(b,a,deltaSignal);
figure ;
plot(t,filtered);
title('filtered signal * 0.1 delta Square wave');
RootMeanSquare(y,deltaSignal)


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%0.1 Ts %%%%%%%%%%%%%%%%%%%%%%
Fs = 50000*0.1 ;
t = 0:1/Fs:3/500;
y = sin(2*pi*500*t);
Wn = 2*pi*500/50000;
deltaSignal = DeltaModulation(t,y,1/Fs,0.05);
%butter take the degree and normalized cutoff frequency
[b a] = butter(4,0.5,'low');
filtered = filter(b,a,deltaSignal);
figure ;
plot(t,filtered);
title('filtered signal 0.1 Ts Sinusoidal wave');
RootMeanSquare(y,deltaSignal)

%%%%%%%%%%%%%%%%%%%%%%%
%unit step
y = ones(1,length(t));
deltaSignal = DeltaModulation(t,y,1/Fs,0.05);
%butter take the degree and normalized cutoff frequency
[b a] = butter(4,0.5,'low');
filter(b,a,deltaSignal);
figure ;
plot(t,filtered);
title('filtered signal 0.1 Ts Unit Step');
RootMeanSquare(y,deltaSignal)


%%%%%%%%%%%%%%%%%%%%%%%%%%%
%square wave
y = square(2*pi*500*t);
deltaSignal = DeltaModulation(t,y,1/Fs,0.05);
%butter take the degree and normalized cutoff frequency
[b a] = butter(4,0.5,'low');
filter(b,a,deltaSignal);
figure ;
plot(t,filtered);
title('filtered signal 0.1 Ts Square Wave');
RootMeanSquare(y,deltaSignal)