clc
clear all
close all
warning off
Fs=44100;%Sampling frequency in hertz
ch=1;
datatype='uint8';
nbits=16;

Nseconds=10;

% to record audio data from an input device ...
recorder=audiorecorder(Fs,nbits,ch);
disp('Start speaking..')

%Record audio to audiorecorder object,...
recordblocking(recorder,Nseconds);
disp('End of Recording..');

%Store recorded audio signal in numeric array
x=getaudiodata(recorder,datatype);

%Write audio file
audiowrite('test.wav',x,Fs);
disp('Original Audio Signal')
y=audioread('test.wav');
p1=audioplayer(y,Fs);
play(p1);
var=linspace(0,10,50);
tiledlayout(2,2);

nexttile
plot(y);
xlable='Time'
ylable='Audio Signal'
title('Orignial Signal');
pause(10);

%Echo Addition
num=[1,zeros(1,4800),0.8];
den=1;
x=filter(num,den,y);
p1=audioplayer(x,Fs);
disp('Echo Added Signal')
play(p1);

nexttile
plot(x);
xlable='Time'
ylable='Audio Signal'
title('Eco Added Signal');
pause(10);

%Removing echo
den=[1,zeros(1,4800),0.8];
num=[1];
r=filter(num,den,x);
p1=audioplayer(r,Fs);
disp('Echo Removed Signal')
play(p1);

nexttile([1 2])
plot(x);
xlable='Time'
ylable='Audio Signal'
title('Signal After removing Echo');