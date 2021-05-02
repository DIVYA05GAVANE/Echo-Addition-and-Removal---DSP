clc
clear all
close all
%Reading the original audio signal
fs = 44100;
y = audioread('docomo.mp3');
info = audioinfo('docomo.mp3');
info

%Playing the original song
fprintf("Original Sound");
p = audioplayer(y,fs);
play(p);
var = linspace(0,10,50);
tiledlayout(2,2);

nexttile
plot(y)
xlabel = 'Time'
ylabel = 'Audio Signal'
title('Original Sound');
%stop(p);

pause(20);

%Adding echo
num = [1,zeros(1,6000),0.9];
den = [1];
x = filter(num,den,y);
fprintf("Echoed Sound");
p = audioplayer(x,fs);
play(p);

nexttile
plot(x)
xlabel = 'Time'
ylabel = 'Audio Signal'
title('Echo added sound');
%stop(p);

pause(20);

%Removing echo
fprintf("Removed echo Sound");
den = [1,zeros(1,6000),0.9];
num = [1];
r = filter(num,den,x);
p = audioplayer(r,fs);
play(p);

nexttile([1 2])
plot(r);
xlabel = 'Time'
ylabel = 'Audio Signal'
title('Filtered sound');
%stop(p);