Here’s a detailed “ReadMe” file for the RC-Signal-Filter-MatLab project, which explains the purpose of the code, how to run it, and what each part does.



RC-Signal-Filter-MatLab - README



Overview



The RC-Signal-Filter-MatLab project implements a series of signal processing techniques using MATLAB to filter and analyze audio signals. The script performs the following tasks:

• Load audio signals (WAV files).

• Visualize the audio signals in both time and frequency domains.

• Reconstruct audio signals using Fourier Series.

• Apply first-order low-pass filters with different cutoff frequencies.

• Perform convolution between signals and impulse responses.

• Export the filtered signals back to WAV files.



This project is particularly focused on filtering and analyzing signals using Fourier Transforms and convolution operations. The filters applied are first-order low-pass filters, and the cutoff frequencies are explored with different values to observe their effects on various types of audio signals (e.g., instrument signals and voice signals).



Prerequisites

• MATLAB: This code is intended to run on MATLAB. Ensure that you have a working installation of MATLAB.

• Audio Files: The project uses audio files, specifically Signal2.wav and Voice.wav, that should be present in the directory for the code to run properly.

• Signal Processing Toolbox: The project uses basic MATLAB functions for signal processing, so the Signal Processing Toolbox is not required but may enhance the experience.



File Structure



/RC-Signal-Filter-MatLab

    ├── Signal2.wav          # Input audio file (instrument)

    ├── Voice.wav            # Input audio file (voice)

    ├── RC-Signal-Filter.m   # Main MATLAB script (this file)

    └── README.md            # This file



How to Run

1. Prepare the Environment:

Ensure you have the necessary audio files (Signal2.wav and Voice.wav) in your working directory.

2. Run the Script:

Open MATLAB, navigate to the directory containing the script and audio files, and run the script by typing:



RC-Signal-Filter



The script will:

• Load the audio signal (Signal2.wav or Voice.wav).

• Display various plots in both the time and frequency domains.

• Apply first-order low-pass filters with different cutoff frequencies.

• Perform convolutions and generate filtered output files (e.g., Filtered_Audio.WAV, Filtered_Audio1.WAV, Filtered_Voice.wav).



Script Breakdown



Part 1: Signal Analysis and Reconstruction

1. Reading Audio File:

The audio file Signal2.wav is loaded using audioread to obtain the signal data (x) and the sampling frequency (Fs).

2. Time Domain Visualization:

The script first plots the audio signal in the time domain using plot(t, x), where t is the time vector, and x is the audio data.

3. Fourier Transform:

The Fourier Transform is performed using the fft function to visualize the frequency spectrum of the signal.

4. Reconstruction using Fourier Series:

The script constructs the signal x by summing harmonic components of the form , where the coefficients a1, a2, ..., a5 are determined from the frequency analysis.

5. Frequency Domain Visualization:

Each reconstructed signal (x1, x2, …, x5) is plotted in both time and frequency domains to observe how adding harmonics changes the signal.



Part 2: Filtering with 1st Order Low-Pass Filter (Cutoff Frequency = 200 Hz)

1. Impulse Response Calculation:

The impulse response h1 of the low-pass filter is defined as an exponentially decaying function with a cutoff frequency of 200 Hz. The filter’s response is visualized in both the time and frequency domains.

2. Convolution:

The signal x is convolved with the filter h1 using conv(x, h1) * Ts, where Ts is the sampling period.

3. Output Generation:

The filtered signal is saved to a new WAV file (Filtered_Audio.WAV) using the audiowrite function.



Part 3: Filtering with 1st Order Low-Pass Filter (Cutoff Frequency = 1000 Hz)

1. Impulse Response Calculation:

Similar to Part 2, but with a cutoff frequency of 1000 Hz, the impulse response h2 is calculated and visualized.

2. Convolution:

The audio signal x is convolved with h2, and the filtered output is saved to a new WAV file (Filtered_Audio1.WAV).



Part 4: Voice Signal Filtering with 1st Order Low-Pass Filter (Cutoff Frequency = 100 Hz)

1. Voice Signal Analysis:

The voice signal Voice.wav is loaded and analyzed in the same manner as the instrument signal, including time-domain and frequency-domain visualizations.

2. Impulse Response Calculation:

A low-pass filter h3 with a cutoff frequency of 100 Hz is created and applied to the voice signal.

3. Convolution and Output:

The voice signal is filtered, and the output is saved as Filtered_Voice.wav.



Output

• Filtered Audio Files:

After applying the filters, the following filtered audio files are generated:

• Filtered_Audio.WAV (filtered instrument signal with a 200 Hz cutoff).

• Filtered_Audio1.WAV (filtered instrument signal with a 1000 Hz cutoff).

• Filtered_Voice.wav (filtered voice signal with a 100 Hz cutoff).

• Plots:

The script generates multiple plots, including:

• Time-domain plots of original and filtered signals.

• Frequency-domain plots of original and filtered signals.

• Impulse response plots of the low-pass filters.



Notes

• Convolution Length: The convolution operation extends the signal, resulting in an output with a different length than the input signal.

• Sampling Rate: The sampling rate of the audio files (Fs) affects the filtering process and the accuracy of the Fourier Transform.

• Filter Characteristics: The low-pass filters applied in this project have simple first-order exponential responses. The filter cutoff frequency determines the frequency components that are allowed to pass through.



Future Enhancements

• Higher-Order Filters: Implement higher-order low-pass filters for more complex filtering behaviors.

• Interactive GUI: Develop a graphical user interface (GUI) for easier interaction with the program.

• Real-Time Processing: Extend the project to process signals in real-time using streaming data.



License



This project is open-source and available under the MIT License.



This ReadMe provides an overview of how the script works, including details on installation, usage, and the purpose of each section of the code. It can be expanded as needed if more features are added in the future.

