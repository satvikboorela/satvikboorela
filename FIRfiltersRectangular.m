clc;
clear all;
close all;
disp('17131A04j6');
n=input('Enter the order of the filter:');
fp = input('Enter the passband frequency :');
fs = input('Enter the stopband frequency :');
f = input('Enter the sampling frequency :');
wp = 2*fp/f;
ws = 2*fs/f;

y = boxcar(n+1);
% low-pass filter
b = fir1(n,wp,y);
[h,o] = freqz(b,1,256);
m = 20*log10(abs(h));
subplot(2,2,1);
plot(o/pi,m);
title('Magnitude Response of LPF');
ylabel('Gain in dB ---->');
xlabel('Normalised Frequency ---->');
grid on;
% high-pass filter
b = fir1(n,wp,'high',y);
[h,o] = freqz(b,1,256);
m = 20*log10(abs(h));
subplot(2,2,2);
plot(o/pi,m);
title('Magnitude Response of HPF');
ylabel('Gain in dB ---->');
xlabel('Normalised Frequency ---->');
grid on;
