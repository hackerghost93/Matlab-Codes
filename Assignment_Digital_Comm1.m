%---------------------PCM(Pulse Code modulation)-------------------------%
% generation of the function
% fs = sampling frequency
clc
fs = 4000 ;
% time line definition
t = 0:1/fs:1 ;
% function definition 
% be aware the frequency of the function is something else than the 
% sampling frequency
Signal = cos(2*pi*2*t);
% ploting the first one
plot(t,Signal,'r');
hold on ;

%quantizing fixed point numeric 
% for m bits
n = 3;
% as n is the number of digits in the fraction part
% m is the total number of digits of presentation
m = 2*n+1 ;
% quantize the function using the parameters
% as n increase you can see the increase in the efficiency of quantization
% 2*m levels quantization
Quantized_Signal = double(fi(Signal,1,m,n));
%ploting the quantized version
plot(t,Quantized_Signal,'b');
% u decode for decoding 
% encoding 2*m level as y is input
hold off ;

figure ;
digital_signal= uencode( Quantized_Signal , m );
xlabel('Ts');
ylabel('digital levels');
plot(t,digital_signal,'.');

% mean square quantization 
% get the value of q at each point
mean_square = power(Quantized_Signal - Signal,2);
mean_square_figure = figure ;
XLABEL('time');
YLABEL('quantization error');
% draw q at each point
plot(t,mean_square);
% get the mean square quantization error is the summation * 1/N 
MSE = sum(mean_square)/length(mean_square)

%--------------------------------Your Code-----------------------

% -----------------------------reconstruction from oversampling
oversampling = figure  ;
t=0:0.001:1; % time signal
y=2*cos(2*pi*5*t);
[B,A] = butter(3,1000/100000,'low'); % butter fly filter
zero_added_signal=zeros(1,length(y)*10);
for i=1:length(y)
zero_added_signal(i*10)=y(i);
end
zero_added_signal(1:9)=[];
% Adding zeros enhances the signal display and don't change the
%spectrum,it changes sampling freq. only
t=linspace(0,1,length(zero_added_signal));
filtered_signal = filter(B,A,zero_added_signal);
plot(t,filtered_signal,'r');
xlabel('time');
ylabel('oversampled signals');


%-----------------------% construction from minimum sampling--------
figure;
% minimum sampling is nyquios frequency = fs = 2*fmax = 10 
t=0:0.1:1;    % replace ?? with the suitable number
y=2*cos(2*pi*5*t);
% fs = 10 nyquios = 2*fmax = 2*5 ;
[B,A] = butter(10,0.1,'low');
zero_added_signal=zeros(1,length(y)*10);
for i=1:length(y)
zero_added_signal(i*10)=y(i);
end
zero_added_signal(1:9)=[];
t=linspace(0,1,length(zero_added_signal));
filtered_signal = filter(B,A,zero_added_signal);
plot(t,filtered_signal,'r')
XLABEL('time')
YLABEL('minimum sampled signals')
s=fft(filtered_signal);
s=fftshift(s);
fs=100; % why 100?? Write your comments in the m file
% because i added the zeros to the signal as it made 100 sample in the
% second instead of the past fs as 10 
%(Ts now is 1/100 for the main samples to have 1/10 distance
%as this distance must be constant)
freq=linspace(-fs/2,fs/2,length(s));
figure;
plot(freq,abs(s))
xlabel('freq')
ylabel('magnitude of minimum sampled signals')

%----------------------under sampling-------------------------------%


figure;
t=0:0.2:1;
y=2*cos(2*pi*5*t);
% the 2nd argument is the cuttoff frequency of the butterfly filter
[B,A] = butter(10,0.2,'low');   
t=linspace(0,1,length(y));
filtered_signal = filter(B,A,y);
plot(t,filtered_signal,'r');
xlabel('time')
ylabel('under sampled signals')
s=fft(filtered_signal);
s=fftshift(s);
fs = 10 ;
freq=linspace(-fs/2,fs/2,length(s));
figure;
plot(freq,abs(s))
xlabel('freq axis')
ylabel('magnitude of under sampled signals')

%----------------------------------------------------------------%