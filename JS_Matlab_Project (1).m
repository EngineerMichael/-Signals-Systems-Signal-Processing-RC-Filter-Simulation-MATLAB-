close all;
clear all;

%% Part 1: Analysis and Reconstruction
file = 'Signal2.wav';
[x, Fs] = audioread(file);          %x is an array containing the signal

Ts = 1 / Fs;                        %Ts is Sampling Period
Nsamps = length(x);                 %Nsamps is the length of array x
t = Ts * (1:Nsamps);                %Prepare time data for plot
                                    %Array is the length of Nsamps 
                                    %in increments of Ts
                                    
%% #2
%Plot Sound File in Time Domain
figure;
plot(t, x);
xlim([0 0.0115]);                      %3 Full Periods????
xlabel('Time (s)');
ylabel('Amplitude');
title('Original Signal in Time Domain');

%% #3
%Do Fourier Transform
x_fft = abs(fft(x) /Fs);            %Normalize Signal & Retain
                                    %Magnitude
x_fft = x_fft(1:Nsamps/2);          %Discard half of points
f = Fs * (0:(Nsamps/2)-1)/Nsamps;   %Prepare frequency data for plots

%Plot Sound File in Frequency Domain
figure;
plot(f, x_fft);

xlim([0 1550]);                     %Show only 5 Harmonics
xlabel('Frequency (Hz)');
ylabel('Amplitude');
title('Frequency Spectrum of Original Signal');
%% #6
a0 = 0.0050; %DC COMPONENT
a1 = 0.0176;
a2 = 0.0256;
a3 = 0.0089;
a4 = 0.0034;
a5 = 0.004;

fund_freq =   262.5;  %Fundamental Frequency ? (Obtained from Frequency Spectrum Graph) Hz
fund_period = (2 * pi) / fund_freq;
omega = 2 * pi * fund_freq; %rads/s

%6a
x1 = 2*a1*cos(omega * t);
figure
plot(t, x1);
xlim([0  0.01143]);  
xlabel('Time (s)');
ylabel('Amplitude');
title('X1');

   
%6b
x2 = x1 + 2*a2*cos(2*omega*t);
figure
plot(t, x2);
xlim([0  0.01143]);  
xlabel('Time (s)');
ylabel('Amplitude');
title('X2');


%6c
x3 = x2 + 2*a3*cos(3*omega*t);
figure
plot(t, x3);
xlim([0  0.01143]);  
xlabel('Time (s)');
ylabel('Amplitude');
title('X3');


%6d
x4 = x3 + 2*a4*cos(4*omega*t);
figure
plot(t, x4);
xlim([0  0.01143]);  
xlabel('Time (s)');
ylabel('Amplitude');
title('X4');


%6e
x5 = x4 + 2*a5*cos(5*omega*t);
figure
plot(t, x5);
xlim([0  0.01143]);  
xlabel('Time (s)');
ylabel('Amplitude');
title('X5');
%% #7
%Do Fourier Transform
x5_fft = abs(fft(x5) /Fs);            %Normalize Signal & Retain
                                    %Magnitude
x5_fft = x5_fft(1:Nsamps/2);          %Discard half of points
f = Fs * (0:(Nsamps/2)-1)/Nsamps;   %Prepare frequency data for plots

%Plot x5 in Frequency Domain
figure;
plot(f, x5_fft);

xlim([0 1550]);                     %Show only 5 Harmonics
xlabel('Frequency (Hz)');
ylabel('Amplitude');
title('Frequency Spectrum of x5');

%% Part 2:Instrument filtered with 1st Order Low-Pass, cutoff frequency = 200 Hz
h1 = (1.2566e+3)*exp((-t)/(795.77e-6));
figure
plot(t, h1);
xlim([0  0.01143]);  
xlabel('Time (s)');
ylabel('Amplitude');
title('Impulse Response at 200 Hz (h1)');
%% #2
%Do Fourier Transform
h1_fft = abs(fft(h1) /Fs);            %Normalize Signal & Retain
                                    %Magnitude
h1_fft = h1_fft(1:Nsamps/2);          %Discard half of points
f = Fs * (0:(Nsamps/2)-1)/Nsamps;   %Prepare frequency data for plots
figure
plot(f, h1_fft);
xlim([0  1550]);  
xlabel('Hz');
ylabel('Amplitude');
title('Frequency Spectrum of h1');

%% #3
%Convolution
output = conv(x, h1) * Ts;

Nsamps1 = length(output); %New Length Obtained from Convolution  which extends signal (Different from Nsamps)
t1 = (Ts) * (1:Nsamps1);
figure
plot(t1, output);
xlim([0 0.01143]);
xlabel('Time (s)');
ylabel('Amplitude');
title('Convolution x & h1 (output)');

%% #3b
%Do Fourier Transform
output_fft = abs(fft(output) /Fs);            %Normalize Signal & Retain Magnitude

output_fft = output_fft(1:Nsamps1/2);          %Discard half of points
f = Fs * (0:(Nsamps1/2)-1)/Nsamps1;   %Prepare frequency data for plots
figure
plot(f, output_fft);
xlim([0  1550]);  
xlabel('Hz');
ylabel('Amplitude');
title('Frequency Spectrum of output');


%% #3c
%Convert the output to a WAV file
output_file = 'Filtered_Audio.WAV';
audiowrite(output_file, output, Fs);


%% Part 3: Instrument filtered with 1st Order Low-Pass, cutoff freq = 1000Hz

h2 = (6.2832e+3)*exp((-t)/(159.1546e-6));
figure
plot(t, h2);
xlim([0  0.01143]);  
xlabel('Time (s)');
ylabel('Amplitude');
title('Impulse Response at 1000Hz (h2)');
%% #2
%Do Fourier Transform
h2_fft = abs(fft(h2) /Fs);            %Normalize Signal & Retain
                                    %Magnitude
h2_fft = h2_fft(1:Nsamps/2);          %Discard half of points
f = Fs * (0:(Nsamps/2)-1)/Nsamps;   %Prepare frequency data for plots
figure
plot(f, h2_fft);
xlim([0  1550]);  
xlabel('Hz');
ylabel('Amplitude');
title('Frequency Spectrum of h2');

%% #3
%Convolution
output1 = conv(x, h2) * Ts;

Nsamps2 = length(output1); %New Length Obtained from convolution which extends signal (Different from Nsamps)
t = (Ts) * (1:Nsamps2);
figure
plot(t, output1);
xlim([0 0.01143]);
xlabel('Time (s)');
ylabel('Amplitude');
title('Convolution x & h2 (output1)');

%% #3b
%Do Fourier Transform
y1_fft = abs(fft(output1) /Fs);            %Normalize Signal & Retain
                                    %Magnitude
y1_fft = y1_fft(1:Nsamps2/2);          %Discard half of points
f = Fs * (0:(Nsamps2/2)-1)/Nsamps2;   %Prepare frequency data for plots
figure
plot(f, y1_fft);
xlim([0  1550]);  
xlabel('Hz');
ylabel('Amplitude');
title('Frequency Spectrum of output1');

%% #3c
%Convert the output to a WAV file
output_file1 = 'Filtered_Audio1.WAV';
audiowrite(output_file1, output1, Fs);

%% Part 4: Voice signal filter with 1st Order Low-Pass cutoff frequency = 100Hz
file = 'Voice.wav';
[x, Fs] = audioread(file);          %x is an array containing the signal

Ts = 1 / Fs;                        %Ts is Sampling Period
Nsamps = length(x);                 %Nsamps is the length of array x
t = Ts * (1:Nsamps);                %Prepare time data for plot
                                    %Array is the length of Nsamps 
                                    %in increments of Ts
                                    
%Plot Voice File in Time Domain
figure;
plot(t, x);
xlim([0.3328 4])                      %only plot from o to 0.06s
xlabel('Time (s)');
ylabel('Amplitude');
title('Voice Signal in Time Domain');

                            
%Do Fourier Transform
x_fft = abs(fft(x) /Fs);            %Normalize Signal & Retain
                                    %Magnitude
x_fft = x_fft(1:Nsamps/2);          %Discard half of points
f = Fs * (0:(Nsamps/2)-1)/Nsamps;   %Prepare frequency data for plots

%Plot Voice File in Frequency Domain
figure;
plot(f, x_fft);
xlim([0 1500]);                     
xlabel('Frequency (Hz)');
ylabel('Amplitude');
title('Frequency Spectrum of Voice Signal');

h3 = (0.63e+3)*exp(-t*(0.63e+3));

%Do Fourier Transform
h3_fft = abs(fft(h3) /Fs);            %Normalize Signal & Retain
                                    %Magnitude
h3_fft = h3_fft(1:Nsamps/2);          %Discard half of points
f = Fs * (0:(Nsamps/2)-1)/Nsamps;   %Prepare frequency data for plots



%Plot h3 in Frequency Domain
figure;
plot(f, h3_fft);
xlim([0 1500]);
xlabel('Frequency (Hz)');
ylabel('Amplitude');
title('Frequency Spectrum of h3');

%Convolution
output3 = conv(x, h3) * Ts;

Nsamps = length(output3);
t = (Ts) * (1:Nsamps);
figure
plot(t, output3);
xlim([0.3328 4]);
xlabel('Time (s)');
ylabel('Amplitude');
title('Convolution Impulse Response & Voice Signal (output3)');

%Do Fourier Transform
output3_fft = abs(fft(output3) /Fs);            %Normalize Signal & Retain
                                    %Magnitude
output3_fft = output3_fft(1:Nsamps/2);          %Discard half of points
f = Fs * (0:(Nsamps/2)-1)/Nsamps;   %Prepare frequency data for plots

%Plot output3 in Frequency Domain
figure;
plot(f, output3_fft);
xlim([0 1500]);                     
xlabel('Frequency (Hz)');
ylabel('Amplitude');
title('Frequency Spectrum of Output3');


%Convert the output to a WAV file
output_file = 'Filtered_Voice.wav';
audiowrite(output_file, output3, Fs);











